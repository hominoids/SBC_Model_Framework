/*
    SBC Models Copyright 2016,2017,2018,2019,2020,2021,2022 Edward A. Kisiel hominoid@cablemi.com
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    Code released under GPLv3: http://www.gnu.org/licenses/gpl.html

    20190214 Version 1.0.0  SBC Model Framework
    20190218 Version 1.0.1  Added HK Odroid-N2 as "n2"
    20200425 Version 1.0.2  Added AtomicPi as "atomicpi"
                            Added Nvidia JetsonNano as "jetsonnano"
                            Updated Odroid-N2 sbc data
                            Updated Odroid-H2 sbc data
                            Added Odroid-C4 as"c4"
                            Added oem heatsinks
                            Added Odroid-XU4Q as "xu4q"
    20200725 Version 1.0.3  Added Odroid-N2+ and heatsink
    20201021 Version 1.0.4  Added HK Odroid-HC4 as "hc4"
    20220202 Version 1.0.5  Added HK Show2 as "show2"
    20220413 Version 1.0.6  Added Odroid-M1 as "m1"
    20220515 Version 1.0.7  Added rockpro64, jetsonnano, updated sbc_test.scad, sbc_test_components.scad
                            and other fixes and adjustments
    20221020 Version 1.0.8  rpizero,rpizero2w,rpi1a+,rpi1b+,rpi3a+,rpi3b,rpi3b+,rpi4b,rockpi4b+,
                            rockpi4c,rockpi4c+,rockpi5b,vim1,vim2,vim3l,vim3,vim4,
                            tinkerboard,tinkerboard-s,tinkerboard-2,tinkerboard-r2
                            rock64,quartz64a,quartz64b,h64b,opizero,opizero2,opir1plus_lts
    2022xxxx Version 2.0.0  added unlimted pcb to a sbc, unlimited pcb holes, unlimited pcb soc
    
    see https://github.com/hominoids/SBC_Model_Framework
    
    USE: sbc(model)
             model = "c1+","c2","c4","xu4","xu4q","mc1","hc1","hc4","m1","n1","n2","n2+","h2","show2",
                     "rpizero","rpizero2w","rpi1a+","rpi1b+","rpi3a+","rpi3b","rpi3b+","rpi4b",
                     "jetsonnano",
                     "rock64","rockpro64","quartz64b","quartz64b,"h64b",
                     "rockpi4b+","rockpi4c","rockpi4c+","rockpi5b",
                     "vim1","vim2","vim3l","vim3","vim4",
                     "tinkerboard","tinkerboard-s","tinkerboard-2","tinkerboard-r2",
                     "opizero","opizero2","opir1plus_lts"
*/

include <./sbc_models.cfg>
use <./sbc_library.scad>

module sbc(model, mask) {
    
    sbc_model = [model];
    s = search(sbc_model,sbc_data);
    $fn=90;
    if(mask == true) {
        
    }
    else {
        for (i=[1:20:len(sbc_data[s[0]])-1]) {
            // pcb shapes
            if(sbc_data[s[0]][i] == "pcbshape") {
                type =  sbc_data[s[0]][i+1];
                pcb_id = sbc_data[s[0]][i+2];
                pcbloc_x = sbc_data[s[0]][i+3];
                pcbloc_y = sbc_data[s[0]][i+4];
                pcbloc_z = sbc_data[s[0]][i+5];
                pcbsize_x = sbc_data[s[0]][i+8];
                pcbsize_y = sbc_data[s[0]][i+9];
                pcbsize_z = sbc_data[s[0]][i+10];
                pcbcorner_radius = sbc_data[s[0]][i+11];
                pcb_color = sbc_data[s[0]][i+14];
                translate([pcbloc_x, pcbloc_y, pcbloc_z]) {
                    difference() {
                        if(type == "rectangle") {
                            color(pcb_color) pcb([pcbsize_x, pcbsize_y, pcbsize_z], pcbcorner_radius);
                        }
                        if(type == "round") {
                            color(pcb_color) pcb_add(type,loc_x,loc_y,loc_z,side,rotation,size_x,size_y,size_z,data_1,data_2);
                        }
                        if(type == "polygon") {
                            color(pcb_color) pcb_add(type,loc_x,loc_y,loc_z,side,rotation,size_x,size_y,size_z,data_1,data_2);
                        }
                        if(type == "dxf") {
                            color(pcb_color) pcb_add(type,loc_x,loc_y,loc_z,side,rotation,size_x,size_y,size_z,data_1,data_2);
                        }
                        // pcb mounting holes
                        for (i=[1:20:len(sbc_data[s[0]])-1]) {
                            if(sbc_data[s[0]][i] == "pcbhole" && sbc_data[s[0]][i+2] == pcb_id) {
                                pcbhole_x = sbc_data[s[0]][i+3];
                                pcbhole_y = sbc_data[s[0]][i+4];
                                pcbhole_z = sbc_data[s[0]][i+5];
                                pcbhole_size = sbc_data[s[0]][i+8];                        
                                if (pcbhole_x!=0 && pcbhole_y!=0) {
                                    translate([pcbhole_x, pcbhole_y, pcbhole_z-1]) 
                                        color(pcb_color) cylinder(d=pcbhole_size, h=pcbsize_z+2);
                                }
                            }
                        }
                    }
                    // soc placement
                    for (i=[1:20:len(sbc_data[s[0]])-1]) {
                        if(sbc_data[s[0]][i] == "soc" && sbc_data[s[0]][i+2] == pcb_id && sbc_data[s[0]][i+1] == "flat") {
                            soc1size_x = sbc_data[s[0]][i+8];
                            soc1size_y = sbc_data[s[0]][i+9];
                            soc1size_z = sbc_data[s[0]][i+10];
                            soc1loc_x = sbc_data[s[0]][i+3];
                            soc1loc_y = sbc_data[s[0]][i+4];
                            soc1loc_z = sbc_data[s[0]][i+5];
                            soc1_side = sbc_data[s[0]][i+6];
                            soc1_rotation = sbc_data[s[0]][i+7][2];                       
                            if (soc1_side == "top" ) {
                                color("dimgray",1) 
                                    translate([soc1loc_x,soc1loc_y,pcbsize_z]) 
                                        rotate([0,0,-soc1_rotation]) 
                                            cube([soc1size_x,soc1size_y,soc1size_z]);
                            }
                            if (soc1_side == "bottom") {               
                                color("dimgray",1) 
                                    translate([soc1loc_x,soc1loc_y,-pcbsize_z]) 
                                        rotate([0,0,soc1_rotation]) 
                                            cube([soc1size_x,soc1size_y,soc1size_z]);
                            }
                        }
                    }
                
                    // component placement
                    for (i=[1:20:len(sbc_data[s[0]])-1]) {
                        if(sbc_data[s[0]][i+2] == pcb_id) {

                            class = sbc_data[s[0]][i];
                            type = sbc_data[s[0]][i+1];
                            pcb_id = sbc_data[s[0]][i+2];
                            loc_x = sbc_data[s[0]][i+3];
                            loc_y = sbc_data[s[0]][i+4];
                            loc_z = sbc_data[s[0]][i+5];
                            side = sbc_data[s[0]][i+6];
                            rotation = sbc_data[s[0]][i+7][2];
                            size_x = sbc_data[s[0]][i+8];
                            size_y = sbc_data[s[0]][i+9];
                            size_z = sbc_data[s[0]][i+10];
                            data_1 = sbc_data[s[0]][i+11];
                            data_2 = sbc_data[s[0]][i+12];
                            data_3 = sbc_data[s[0]][i+13];
                            data_4 = sbc_data[s[0]][i+14];
                            data_5 = sbc_data[s[0]][i+15];
                            data_6 = sbc_data[s[0]][i+16];
                            data_7 = sbc_data[s[0]][i+17];
                            data_8 = sbc_data[s[0]][i+18];
                            mask = sbc_data[s[0]][i+19];
                            
                            
                            if (class == "memory") {
                                if (loc_x!=0 || loc_y!=0) {
                                    memory(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }            
                            }
                            if (class == "switch") {
                                if (loc_x!=0 || loc_y!=0) {
                                    switch(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }           
                            }
                            if (class == "button") {
                                if (loc_x!=0 || loc_y!=0) {
                                    button(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }           
                            }
                            if (class == "plug") {
                                if (loc_x!=0 || loc_y!=0) {
                                    plug(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }           
                            }
                            if (class == "usb2") {
                                if (loc_x!=0 || loc_y!=0) {
                                    usb2(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }          
                            }
                            if (class == "usb3") {
                                if (loc_x!=0 || loc_y!=0) {
                                    usb3(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }           
                            }
                            if (class == "usbc") {
                                if (loc_x!=0 || loc_y!=0) {
                                    usbc(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }           
                            }
                            if (class == "network") {
                                if (loc_x!=0 || loc_y!=0) {
                                    network(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }           
                            }
                            if (class == "video") {
                                if (loc_x!=0 || loc_y!=0) {
                                    video(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }           
                            }
                            if (class == "fan") {
                                if (loc_x!=0 || loc_y!=0) {
                                    fan(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }           
                            }
                            if (class == "gpio") {
                                if (loc_x!=0 || loc_y!=0) {
                                    gpio(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }           
                            }
                            if (class == "audio") {
                                if (loc_x!=0 || loc_y!=0) {
                                    audio(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }            
                            }
                            if (class == "storage") {
                                if (loc_x!=0 || loc_y!=0) {
                                    storage(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }           
                            }
                            if (class == "combo") {
                                if (loc_x!=0 || loc_y!=0) {
                                    combo(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }            
                            }
                            if (class == "jumper") {
                                if (loc_x!=0 || loc_y!=0) {
                                    jumper(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }            
                            }
                            if (class == "ic") {
                                if (loc_x!=0 || loc_y!=0) {
                                    ic(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }            
                            }
                            if (class == "misc") {
                                if (loc_x!=0 || loc_y!=0) {
                                    misc(loc_x,loc_y,rotation,side,type,pcbsize_z);
                                }   
                            }   
                            if (class == "heatsink") {
                                if (loc_x!=0 || loc_y!=0) {
                                    heatsink(loc_x,loc_y,rotation,side,type,pcbsize_z,sbc_data[s[0]][39]);
                                }   
                            }
                            if (class == "pcie") {
                                if(loc_x!=0 || loc_y!=0) {
                                    pcie(loc_x, loc_y, rotation, side, type, pcbsize_z);
                                }
                            }
                            if (class == "jst_ph") {
                                if(loc_x!=0 || loc_y!=0) {
                                    jst_ph(loc_x, loc_y, rotation, side, type, pcbsize_z);
                                }
                            }
                            if (class == "cm_holder") {
                                if(loc_x!=0 || loc_y!=0) {
                                    cm_holder(loc_x, loc_y, rotation, side, type, pcbsize_z);
                                }
                            }
                            if (class == "cm") {
                                if(loc_x!=0 || loc_y!=0) {
                                    cm(loc_x, loc_y, rotation, side, type, pcbsize_z);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
