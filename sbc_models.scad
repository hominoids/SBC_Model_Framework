/*
    This file is part of SBC Model Framework https://github.com/hominoids/SBC_Model_Framework
    Copyright 2019,2020,2021,2022,2023,2024 Edward A. Kisiel hominoid@cablemi.com
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>
    Code released under GPLv3: http://www.gnu.org/licenses/gpl.html

    20190214 Version 1.0.0  SBC Model Framework initial release

    see https://github.com/hominoids/SBC_Model_Framework


    DESCRIPTION: creates SBC models and corresponding mask sets for openings.
           TODO: many

          USAGE: sbc(model, enableheatsink = "default", fansize = 0, enablegpio =  "default", enableuart =  "default", enablemask = false)

                     model = "c1+","c2","c4","c5","xu4","xu4q","mc1","hc1","hc4","n1","n2","n2+","n2l","n2lq",
                             "m1","m1s","h2","h2+","h3","h3+","h4","h4+","h4_ultra","show2",
                             "rpipicow","rpipicow","rpizero","rpizero2w","rpi1a+","rpi1b+","rpi3a+","rpi3b","rpi3b+","rpi4b","rpi5",
                             "rpicm1","rpicm3","rpicm3l","rpicm3+","rpicm4","rpicm4l","rpicm1","rpicm4+ioboard",
                             "a64","a64lts","rock64","rockpro64","quartz64a","quartz64b","h64b","star64","soedge_rk1808","soedge_a-baseboard"
                             "rock4a","rock4a+","rock4b","rock4b+","rock4c","rock4c+","rock5b-v1.3","rock5b","rock5b+","nio12l",
                             "vim1","vim2","vim3l","vim3","vim4",
                             "tinkerboard","tinkerboard-s","tinkerboard-2","tinkerboard-2s","tinkerboard-r2","tinkerboard-r2s",
                             "opi5","opizero","opizero2","opir1plus_lts","opir1","opi5max","opi3b-v2.1",
                             "lepotato","sweetpotato","tirtium-h2+","tritium-h3","tritium-h5","solitude","alta"
                             "jetsonnano",
                             "licheerv+dock",
                             "visionfive2",
                             "bpif3"
                             "atomicpi"
                             "milk-v_duos",
                             "rak19007"
                             "cnano-avr128da48"
                             "nodemcu-32s", "cs-solarmeter"
                             "feather-m0_express", "feather-m0_wifi", "feather-m4_express"
                             "ssi-eeb", "ssi-ceb", "atx", "micro-atx", "dtx", "flex-atx", "mini-dtx", "mini-itx", "mini-itx_thin", 
                             "mini-stx", "mini-stx_thin", "nano-itx", "nuc", "pico-itx"

            enableheatsink = "disable", "off", "default", "none", "open", "fan_open", "fan_1", "fan_2", "fan_hex", 
                             "vent", "vent_hex_5mm", "vent_hex_8mm", "custom"
                   fansize = 0, 25, 30, 40, 50, 60, 70, 80, 92
                enablegpio = "disable", "off", "default", "none", "open", "block", "knockout", "vent" 
                enableuart = "default", "none", "open", "knockout"
                enablemask = true or false

*/

include <./sbc_models.cfg>
use <./sbc_models_library.scad>

module sbc(model, enableheatsink = "default", fansize = 0, enablegpio =  "default", enableuart =  "default", enablemask = false) {

    sbc_model = [model];
    s = search(sbc_model, sbc_data);

    sindex = 2;
    $fn=90;
    adjust = .01;

    // create mask set
    if(enablemask == true) {
        for (i=[sindex:11:len(sbc_data[s[0]])-1]) {

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
            if(class == "pcb") {

                translate([pcbloc_x, pcbloc_y, pcbloc_z]) {
                    // mask placement
                    for (i=[sindex:11:len(sbc_data[s[0]])-1]) {

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
                                audio(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "button" && mask[0] == true) {
                                button(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "cm" && mask[0] == true) {
                                cm(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "db" && mask[0] == true) {
                                db(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "discrete" && mask[0] == true) {
                                discrete(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "display" && mask[0] == true) {
                                display(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "fpc" && mask[0] == true) {
                                fpc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                           if (class == "gpio" && mask[0] == true && enablegpio != "disable" && enablegpio != "none") {
                                if(is_undef(enablegpio)  == false && enablegpio != "default" && enablegpio != "off") {
                                    gpio(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask,
                                        [mask[0], mask[1], mask[2],enablegpio]);
                                }
                                else {
                                    gpio(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "heatsink" && mask[0] == true && enableheatsink != "disable" && enableheatsink != "none")  {
                                if(is_undef(enableheatsink)  == false && enableheatsink != "default" && enableheatsink != "off") {
                                    if(fansize >= 25 && fansize <= 92) {
                                        heatsink(type, loc_x, loc_y, loc_z, side, rotation, size, [fansize], pcbsize_z, enablemask,
                                            [mask[0], mask[1], mask[2],enableheatsink]);
                                    }
                                    else {
                                        heatsink(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask,
                                            [mask[0], mask[1], mask[2],enableheatsink]);
                                    }
                                }
                                else {
                                    heatsink(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);                                
                                }
                            }

                            if (class == "jst" && mask[0] == true) {
                                jst(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "memory" && mask[0] == true) {
                                memory(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "molex") {
                                molex(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "network" && mask[0] == true) {
                                network(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "power" && mask[0] == true) {
                                power(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "storage" && mask[0] == true) {
                                storage(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "switch" && mask[0] == true) {
                                switch(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "terminal" && mask[0] == true) {
                                terminal(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                           if (class == "uart" && mask[0] == true && enableuart != "none") {
                                if(is_undef(enableuart)  == false && enableuart != "default") {
                                    uart(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask,
                                        [mask[0], mask[1], mask[2],enableuart]);
                                }
                                else {
                                    uart(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                                }
                            }
                            if (class == "usb2" && mask[0] == true) {
                                usb2(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "usb3" && mask[0] == true) {
                                usb3(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                             }
                            if (class == "usbc" && mask[0] == true) {
                                usbc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "video" && mask[0] == true) {
                                video(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                        }
                    }
                }
            }
        }
    }
    else {
        // create pcb
        for (i=[sindex:11:len(sbc_data[s[0]])-1]) {
            
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
            if(class == "pcb") {
                
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
                            if(type == "cm1" || type == "cm3" || type == "cm3l" || type == "cm3+" || type == "cm4" || type == "cm4l" || type == "cm4s" || type == "soedge") {
                                cm(type, pcbloc_x, pcbloc_y, pcbloc_z, pcb_side, pcb_rotation[2], sbc_data[s[0]][i+8], sbc_data[s[0]][i+9], pcbsize_z, false, 0);
                            }
                            // pcb additions
                            for (i=[sindex:11:len(sbc_data[s[0]])-1]) {

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
                        for (i=[sindex:11:len(sbc_data[s[0]])-1]) {
                               
                            class = sbc_data[s[0]][i];
                            type = sbc_data[s[0]][i+1];
                            id = sbc_data[s[0]][i+2];
                            pcbhole_x = sbc_data[s[0]][i+3];
                            pcbhole_y = sbc_data[s[0]][i+4];
                            pcbhole_z = sbc_data[s[0]][i+5];
                            pcbhole_rotation = sbc_data[s[0]][i+7];
                            pcbhole_size_x = sbc_data[s[0]][i+8][0];
                            pcbhole_size_y = sbc_data[s[0]][i+8][1];

                            if(class == "pcbhole" && id == pcb_id) {                                
                                translate([pcbhole_x, pcbhole_y, pcbhole_z-1]) color(pcb_color) 
                                    cylinder(d=pcbhole_size_x, h=pcbsize_z+2);
                            }
                            if(class == "pcbpad" && id == pcb_id) {
                                union() {
                                    for(r=[0:2.54:(pcbhole_size_y-1)*2.54]) {
                                        for(c=[0:2.54:(pcbhole_size_x-1)*2.54]) {
                                            translate([pcbhole_x+c, pcbhole_y+r, pcbhole_z-1]) color(pcb_color) 
                                                cylinder(d=1.5, h=pcbsize_z+2);
                                        }
                                    }
                                }
                            }
                            if(class == "gpio" && id == pcb_id) {
                                union() {
                                    for(r=[0:2.54:(pcbhole_size_y-1)*2.54]) {
                                        for(c=[0:2.54:(pcbhole_size_x-1)*2.54]) {
                                            translate([2.54/2+pcbhole_x+c, 2.54/2+pcbhole_y+r, pcbhole_z-1]) 
                                                color(pcb_color) cylinder(d=1.5, h=pcbsize_z+2);
                                        }
                                    }
                                }
                            }
                        }
                        // pcb subtractions
                        for (i=[sindex:11:len(sbc_data[s[0]])-1]) {

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
                    for (i=[sindex:11:len(sbc_data[s[0]])-1]) {

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
                            pcbsoc(type, socloc_x, socloc_y, socloc_z, soc_side, soc_rotation, soc_size, soc_data, pcbsize_z, enablemask, mask);
                        }
                    }

                    // additions
                    for (i=[sindex:11:len(sbc_data[s[0]])-1]) {
                           
                        class = sbc_data[s[0]][i];
                        type = sbc_data[s[0]][i+1];
                        id = sbc_data[s[0]][i+2];
                        add_x = sbc_data[s[0]][i+3];
                        add_y = sbc_data[s[0]][i+4];
                        add_z = sbc_data[s[0]][i+5];
                        add_side = sbc_data[s[0]][i+6];
                        add_rotation = sbc_data[s[0]][i+7];
                        add_size = sbc_data[s[0]][i+8];


                        if(class == "gpio" && id == pcb_id) {
                            pcbpad("round", add_x+2.54/2, add_y+2.54/2, add_z, add_side, add_rotation[2], 
                                add_size, [1.27,"#fee5a6",2.1], pcbsize_z, false, 0);
                        }
                    }

                    // component placement
                    for (i=[sindex:11:len(sbc_data[s[0]])-1]) {

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
                                antenna(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "audio") {
                                audio(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "b2b") {
                                b2b(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "battery") {
                                battery(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "button") {
                                button(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "cm") {
                                cm(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "cm_holder") {
                                cm_holder(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "db") {
                                db(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "discrete") {
                                discrete(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "display") {
                                display(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "fan") {
                                fan(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "fpc") {
                                fpc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "gpio" && enablegpio != "disable" && enablegpio != "off") {
                                gpio(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "header") {
                                header(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "heatsink" && enableheatsink != "disable" && enableheatsink != "off") {
                                heatsink(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "ic") {
                                ic(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "jst") {
                                jst(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "memory") {
                                memory(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "molex") {
                                molex(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "network") {
                                network(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "pcbhole") {
                                pcbhole(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "pcbpad") {
                                pcbpad(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "pcie") {
                                pcie(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "pillar") {
                                pillar(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "power") {
                                power(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "smd") {
                                smd(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "storage") {
                                storage(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "switch") {
                                switch(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "terminal") {
                                terminal(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "uart") {
                                uart(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "usb2") {
                                usb2(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "usb3") {
                                usb3(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "usbc") {
                                usbc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                            if (class == "video") {
                                video(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
                            }
                        }
                    }
                }
            }
        }
    }
}
