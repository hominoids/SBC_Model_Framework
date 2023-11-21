/*
    This file is part of SBC Model Framework https://github.com/hominoids/SBC_Model_Framework
    Copyright 2016,2017,2018,2019,2020,2021,2022 Edward A. Kisiel hominoid@cablemi.com
    
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
             model = "c1+","c2","c4","xu4","xu4q","mc1","hc1","hc4","m1","m1_noheatsink","m1s","n1","n2","n2l","n2lq","n2+","n2+_noheatsink","h2","show2"
                     "rpizero","rpizero2w","rpi1a+","rpi1b+","rpi3a+","rpi3b","rpi3b+","rpi4b","rpi5","rpi5_noheatsink",
                     "rock64","rockpro64","quartz64b","quartz64b,"h64b","star64"
                     "rock4b+","rock4c","rock4c+","rock5b-v1.3","rock5b-v1.42",
                     "vim1","vim2","vim3l","vim3","vim4",
                     "tinkerboard","tinkerboard-s","tinkerboard-2","tinkerboard-r2",
                     "opi5","opizero","opizero2","opir1plus_lts","opir1",
                     "jetsonnano",
                     "licheerv+dock",
                     "visionfive2"
*/

include <./sbc_models.cfg>
use <./sbc_library.scad>

module sbc(model, enablemask = false) {
    
    sbc_model = [model];
    s = search(sbc_model,sbc_data);
    
    $fn=90;
    adjust = .01;
    
    // create mask set
    if(enablemask == true) {
        for (i=[1:11:len(sbc_data[s[0]])-1]) {
            
            class = sbc_data[s[0]][i];
            type =  sbc_data[s[0]][i+1];
            pcb_id = sbc_data[s[0]][i+2];
            pcbloc_x = sbc_data[s[0]][i+3];
            pcbloc_y = sbc_data[s[0]][i+4];
            pcbloc_z = sbc_data[s[0]][i+5];
            pcb_side = sbc_data[s[0]][i+6];
            pcb_rotation = sbc_data[s[0]][i+7];
            pcbsize_x = sbc_data[s[0]][i+8][0];
            pcbsize_y = sbc_data[s[0]][i+8][1];
            pcbsize_z = sbc_data[s[0]][i+8][2];
            pcbcorner_radius = sbc_data[s[0]][i+9][0];
            pcb_color = sbc_data[s[0]][i+9][1];
            pcb_polygon = sbc_data[s[0]][i+9][2];
            dxf_scale = sbc_data[s[0]][i+9][3];
                
            // pcb shapes
            if(class == "pcbshape") {
                
                translate([pcbloc_x, pcbloc_y, pcbloc_z]) {
                    // mask placement
                    for (i=[1:11:len(sbc_data[s[0]])-1]) {
                        
                        class = sbc_data[s[0]][i];
                        type = sbc_data[s[0]][i+1];
                        id = sbc_data[s[0]][i+2];
                        loc_x = sbc_data[s[0]][i+3];
                        loc_y = sbc_data[s[0]][i+4];
                        loc_z = sbc_data[s[0]][i+5];
                        side = sbc_data[s[0]][i+6];
                        rotation = sbc_data[s[0]][i+7][2];
                        size = sbc_data[s[0]][i+8];
                        data = sbc_data[s[0]][i+9];
                        mask = sbc_data[s[0]][i+10];
                            
                        if(id == pcb_id) {  

                            if (class == "audio" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    audio(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }            
                            }
                           if (class == "b2b") {
                                if(loc_x != 0 || loc_y != 0) {
                                    b2b(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "battery" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    battery(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }   
                            }   
                            if (class == "button" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    button(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "cm" && mask[0] == true) {
                                if(loc_x != 0 || loc_y != 0) {
                                    cm(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "cm_holder" && mask[0] == true) {
                                if(loc_x != 0 || loc_y != 0) {
                                    cm_holder(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "discrete" && mask[0] == true) {
                                if(loc_x != 0 || loc_y != 0) {
                                    discrete(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "display" && mask[0] == true) {
                                if(loc_x != 0 || loc_y != 0) {
                                    display(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "fan" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    fan(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "fpc" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    fpc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "gpio" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    gpio(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "heatsink" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    heatsink(type, loc_x, loc_y, loc_z, side, rotation, size[2], pcbsize_z, enablemask, mask);
                                }   
                            }
                            if (class == "jst" && mask[0] == true) {
                                if(loc_x != 0 || loc_y != 0) {
                                    jst(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "jumper" && mask[0] == true) {
                                if(loc_x != 0 || loc_y != 0) {
                                    jumper(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "memory" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    memory(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }            
                            }
                            if (class == "network" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    network(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "pcb" && mask[0] == true) {
                                if(loc_x != 0 || loc_y != 0) {
                                    pcb(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "pcie" && mask[0] == true) {
                                if(loc_x != 0 || loc_y != 0) {
                                    pcie(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "power" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    power(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "smd" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    smd(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "storage" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    storage(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "switch" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    switch(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "terminal" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    terminal(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "usb2" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    usb2(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }          
                            }
                            if (class == "usb3" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    usb3(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "usbc" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    usbc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "video" && mask[0] == true) {
                                if (loc_x != 0 || loc_y != 0) {
                                    video(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                        }
                    }
                }
            }
        }
    }        
    else {
        // create pcb
        for (i=[1:11:len(sbc_data[s[0]])-1]) {
            
            class = sbc_data[s[0]][i];
            type =  sbc_data[s[0]][i+1];
            pcb_id = sbc_data[s[0]][i+2];
            pcbloc_x = sbc_data[s[0]][i+3];
            pcbloc_y = sbc_data[s[0]][i+4];
            pcbloc_z = sbc_data[s[0]][i+5];
            pcb_side = sbc_data[s[0]][i+6];
            pcb_rotation = sbc_data[s[0]][i+7];
            pcbsize_x = sbc_data[s[0]][i+8][0];
            pcbsize_y = sbc_data[s[0]][i+8][1];
            pcbsize_z = sbc_data[s[0]][i+8][2];
            pcbcorner_radius = sbc_data[s[0]][i+9][0];
            pcb_color = sbc_data[s[0]][i+9][1];
            pcb_polygon = sbc_data[s[0]][i+9][2];
            dxf_scale = sbc_data[s[0]][i+9][3];
            
            // pcb shapes
            if(class == "pcbshape") {
                
                translate([pcbloc_x, pcbloc_y, pcbloc_z]) {
                    difference() {
                        union() {
                            if(type == "rectangle") {
                                color(pcb_color) pcb([pcbsize_x, pcbsize_y, pcbsize_z], pcbcorner_radius);
                            }
                            if(type == "polygon") {
                                color(pcb_color) shape(type, [pcbsize_x, pcbsize_y, pcbsize_z], [pcbcorner_radius, pcb_color, pcb_polygon, 0]);
                            }
                            if(type == "round") {
                                color(pcb_color) rotate(pcb_rotation) 
                                    shape(type, [pcbsize_x, pcbsize_y, pcbsize_z], [pcbcorner_radius, pcb_color, pcb_polygon, 0]);
                            }
                            if(type == "dxf") {
                                color(pcb_color) shape(type, [pcbsize_x, pcbsize_y, pcbsize_z], [pcbcorner_radius, pcb_color, pcb_polygon,0]);
                            }
                            if(type == "cm1" || type == "cm3" || type == "cm3l" || type == "cm4") {
                                cm(type, pcbloc_x, pcbloc_y, pcbloc_z, pcb_side, pcb_rotation, sbc_data[s[0]][i+8], sbc_data[s[0]][i+9], pcbsize_z, false, 0);
                            }
                            // pcb additions
                            for (i=[1:11:len(sbc_data[s[0]])-1]) {
                                
                                class = sbc_data[s[0]][i];
                                type = sbc_data[s[0]][i+1];
                                id = sbc_data[s[0]][i+2];
                                loc_x = sbc_data[s[0]][i+3];
                                loc_y = sbc_data[s[0]][i+4];
                                loc_z = sbc_data[s[0]][i+5];
                                rotation = sbc_data[s[0]][i+7][2];
                                size = sbc_data[s[0]][i+8];
                                data = sbc_data[s[0]][i+9];
                                
                                if(class == "pcbadd" && id == pcb_id) {
                                    color(data[1]) translate([loc_x, loc_y, loc_z]) rotate(rotation) 
                                            shape(type, size, data);
                                }
                            }
                        }
                        // pcb mounting holes
                        for (i=[1:11:len(sbc_data[s[0]])-1]) {
                               
                            class = sbc_data[s[0]][i];
                            type = sbc_data[s[0]][i+1];
                            id = sbc_data[s[0]][i+2];
                            pcbhole_x = sbc_data[s[0]][i+3];
                            pcbhole_y = sbc_data[s[0]][i+4];
                            pcbhole_z = sbc_data[s[0]][i+5];
                            pcbhole_size = sbc_data[s[0]][i+8][0];                        
                            
                            if(class == "pcbhole" && id == pcb_id) {
                                
                                translate([pcbhole_x, pcbhole_y, pcbhole_z-1]) color(pcb_color) cylinder(d=pcbhole_size, h=pcbsize_z+2);
                            }
                        }
                        // pcb subtractions
                        for (i=[1:11:len(sbc_data[s[0]])-1]) {
                            
                            class = sbc_data[s[0]][i];
                            type = sbc_data[s[0]][i+1];
                            id = sbc_data[s[0]][i+2];
                            loc_x = sbc_data[s[0]][i+3];
                            loc_y = sbc_data[s[0]][i+4];
                            loc_z = sbc_data[s[0]][i+5];
                            side = sbc_data[s[0]][i+6];
                            rotation = sbc_data[s[0]][i+7][2];
                            size = sbc_data[s[0]][i+8];
                            data = sbc_data[s[0]][i+9];
                            mask = sbc_data[s[0]][i+10];
                            
                            if(class == "pcbsub" && id == pcb_id) {
                                color(data[1]) translate([loc_x, loc_y, loc_z-adjust]) rotate(rotation) 
                                        shape(type, [size[0], size[1], size[2]+2*adjust], [data[0], data[1], data[2], data[3]]);
                            }
                        }

                        
                        
                    }
                    // soc placement
                    for (i=[1:11:len(sbc_data[s[0]])-1]) {
                        
                        class = sbc_data[s[0]][i];
                        type = sbc_data[s[0]][i+1];
                        id = sbc_data[s[0]][i+2];
                        socloc_x = sbc_data[s[0]][i+3];
                        socloc_y = sbc_data[s[0]][i+4];
                        socloc_z = sbc_data[s[0]][i+5];
                        soc_side = sbc_data[s[0]][i+6];
                        soc_rotation = sbc_data[s[0]][i+7][2];                       
                        soc_size = sbc_data[s[0]][i+8];
                        soc_data = sbc_data[s[0]][i+9];
                        mask = sbc_data[s[0]][i+10];
                        
                        if(class == "pcbsoc" && id == pcb_id) {                        
                            soc(type, socloc_x, socloc_y, socloc_z, soc_side, soc_rotation, soc_size, soc_data, pcbsize_z, enablemask, mask);
                        }
                    }
                
                    // component placement
                    for (i=[1:11:len(sbc_data[s[0]])-1]) {
                        
                        class = sbc_data[s[0]][i];
                        type = sbc_data[s[0]][i+1];
                        id = sbc_data[s[0]][i+2];
                        loc_x = sbc_data[s[0]][i+3];
                        loc_y = sbc_data[s[0]][i+4];
                        loc_z = sbc_data[s[0]][i+5];
                        side = sbc_data[s[0]][i+6];
                        rotation = sbc_data[s[0]][i+7][2];
                        size = sbc_data[s[0]][i+8];
                        data = sbc_data[s[0]][i+9];
                        mask = sbc_data[s[0]][i+10];

                        if(id == pcb_id) {  

                            if (class == "antenna") {
                                if (loc_x != 0 || loc_y != 0) {
                                    antenna(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }            
                            }
                            if (class == "audio") {
                                if (loc_x != 0 || loc_y != 0) {
                                    audio(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }            
                            }
                           if (class == "b2b") {
                                if(loc_x != 0 || loc_y != 0) {
                                    b2b(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "battery") {
                                if (loc_x != 0 || loc_y != 0) {
                                    battery(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }   
                            }   
                            if (class == "button") {
                                if (loc_x != 0 || loc_y != 0) {
                                    button(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "cm") {
                                if(loc_x != 0 || loc_y != 0) {
                                    cm(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "cm_holder") {
                                if(loc_x != 0 || loc_y != 0) {
                                    cm_holder(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "discrete") {
                                if(loc_x != 0 || loc_y != 0) {
                                    discrete(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "display") {
                                if(loc_x != 0 || loc_y != 0) {
                                    display(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "fan") {
                                if (loc_x != 0 || loc_y != 0) {
                                    fan(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "fpc") {
                                if(loc_x != 0 || loc_y != 0) {
                                    fpc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                           if (class == "header" || class == "gpio") {
                                if(loc_x != 0 || loc_y != 0) {
                                    header(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "heatsink") {
                                if (loc_x != 0 || loc_y != 0) {
                                    heatsink(type, loc_x, loc_y, loc_z, side, rotation, size[2], pcbsize_z, enablemask, mask);
                                }   
                            }
                            if (class == "ic") {
                                if (loc_x != 0 || loc_y != 0) {
                                    ic(type, loc_x, loc_y, loc_z, side, rotation, size[0], size[1], size[2], pcbsize_z);
                                }           
                            }
                            if (class == "jst") {
                                if(loc_x != 0 || loc_y != 0) {
                                    jst(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "jumper") {
                                if(loc_x != 0 || loc_y != 0) {
                                    jumper(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "memory") {
                                if (loc_x != 0 || loc_y != 0) {
                                    memory(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }            
                            }
                            if (class == "network") {
                                if (loc_x != 0 || loc_y != 0) {
                                    network(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "pcb") {
                                if(loc_x != 0 || loc_y != 0) {
                                    pcb(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "pcie") {
                                if(loc_x != 0 || loc_y != 0) {
                                    pcie(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "pillar") {
                                if(loc_x != 0 || loc_y != 0) {
                                    pillar(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "power") {
                                if (loc_x != 0 || loc_y != 0) {
                                    power(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "smd") {
                                if (loc_x != 0 || loc_y != 0) {
                                    smd(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "storage") {
                                if (loc_x != 0 || loc_y != 0) {
                                    storage(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "switch") {
                                if (loc_x != 0 || loc_y != 0) {
                                    switch(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "terminal") {
                                if (loc_x != 0 || loc_y != 0) {
                                    terminal(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "usb2") {
                                if (loc_x != 0 || loc_y != 0) {
                                    usb2(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }          
                            }
                            if (class == "usb3") {
                                if (loc_x != 0 || loc_y != 0) {
                                    usb3(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "usbc") {
                                if (loc_x != 0 || loc_y != 0) {
                                    usbc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "video") {
                                if (loc_x != 0 || loc_y != 0) {
                                    video(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask);
                                }           
                            }
                            if (class == "pcbhole") {
                                if (loc_x != 0 || loc_y != 0) {
                                    pcbhole(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }           
                            }
                        }
                    }
                }
            }
        }
    }
}
