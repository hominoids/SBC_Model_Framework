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

    20240124 Version 1.0.0  SBC Models Viewer initial release

    see https://github.com/hominoids/SBC_Model_Framework

*/

include <sbc_models.scad>
use <sbc_models_library.scad>

/* [SBC and Micro-Controllers] */
view = "3D Model"; // [3D Model, 2D Sections, Components, All SBC Models]

sbc_model = "c1+"; // ["c1+","c2","c4","xu4","xu4q","mc1","hc1","hc4","n1","n2","n2+","n2l","n2lq","m1","m1s","h2","h2+","h3","h3+","show2","rpizero","rpizero2w","rpi1a+","rpi1b+","rpi3a+","rpi3b","rpi3b+","rpi4b","rpi5","rpicm1","rpicm3","rpicm3l","rpicm3+","rpicm4","rpicm4l","rpicm4+ioboard","rock64","rockpro64","quartz64a","quartz64b","h64b","star64","rock4a","rock4a+","rock4b","rock4b+","rock4c","rock4c+","rock5b-v1.3","rock5b","vim1","vim2","vim3l","vim3","vim4","tinkerboard","tinkerboard-s","tinkerboard-2","tinkerboard-2s","tinkerboard-r2","tinkerboard-r2s","opi5","opizero","opizero2","opir1plus_lts","opir1","lepotato","sweetpotato","tritium-h2+","tritium-h3","tritium-h5","solitude","alta","jetsonnano","licheerv+dock","visionfive2","atomicpi"]

sbc_off = false;
sbc_info = true;
sbc_mask = false;

/* [Command Line Options] */
heatsink_mask = "default"; // ["disable", "off", "default", "none", "open", "fan_open", "fan_1", "fan_2", "fan_hex","vent", "vent_hex_5mm", "vent_hex_8mm", "custom"]
fan_size = 0; // [0,30,40,50,60,70,80,92]

gpio_mask = "default"; // ["disable", "off", "default", "none", "open", "block", "knockout", "vent"]

uart_mask = "default"; // ["default", "none", "open", "knockout"]

/* [Components] */
Class = "jst"; // [antenna,audio,b2b,battery,button,cm,discrete,display,fan,fpc,gpio,header,heatsink,ic,jst,memory,molex,network,pcb,pcbhole,pcbadd,pcbsub,pcbsoc,pcie,pillar,power,smd,storage,switch,terminal,uart,usb2,usb3,usbc,video]

/* [Hidden] */
s = search([sbc_model], sbc_data);
sindex = 2;
pcbsize_x = sbc_data[s[0]][10][0];
pcbsize_y = sbc_data[s[0]][10][1];
pcbsize_z = sbc_data[s[0]][10][2];
pcbmaxsize_z = sbc_data[s[0]][11][5];
text_offset = 10;
text_height = pcbmaxsize_z + 175;
text_indent = [0,-37,4.5,0,-24,-11,4,4.5,-16,-16.5,-2.5,-9.5,-11,-3.5,-15,3,4,1,3,11,0,-8,-11.5,-2,-8];
text_color = "#009900";

adj = .01;
$fn=90;

if(view == "3D Model") {
    // sbc size and holes to console
    echo(str(sbc_data[s[0]][1][0]));
    echo(str("    PCB Size: ", sbc_data[s[0]][10]));
    for (i=[sindex:11:len(sbc_data[s[0]])-1]) {
        class = sbc_data[s[0]][i];
        type = sbc_data[s[0]][i+1];
        pcbid = sbc_data[s[0]][i+2];
        loc_x = sbc_data[s[0]][i+3];
        loc_y = sbc_data[s[0]][i+4];
        loc_z = sbc_data[s[0]][i+5];
        face = sbc_data[s[0]][i+6];
        rotation = sbc_data[s[0]][i+7];
        size = sbc_data[s[0]][i+8];
        data = sbc_data[s[0]][i+9];
        mask = sbc_data[s[0]][i+10];
        if(class == "pcbhole" && pcbid == 0) {
            echo(str("    ", data[4], " hole: ", loc_x,", ", loc_y));
        }
    }
    // sbc model
    if(sbc_off == false) {
        sbc(sbc_model, heatsink_mask, fan_size, gpio_mask, uart_mask, false);
    }
    // create sbc information text
    if(sbc_info == true) {
        for (i=[0:1:len(sbc_data[s[0]][1])-1]) {
                color(text_color) translate([text_offset + text_indent[i], pcbsize_y, text_height-i*7]) 
                    rotate([90, 0, 0]) text(sbc_data[s[0]][1][i], 5);
        }
    }
    // sbc mask highlight
    if(sbc_mask == true) {
        #sbc(sbc_model, heatsink_mask, fan_size, gpio_mask, uart_mask, true);
    }
}
// create 2d mask sections
if(view == "2D_Sections") {
    projection(cut = true) {
        // rear section
        difference() {
            translate([0, -pcbmaxsize_z, 0]) cube([pcbsize_x, pcbmaxsize_z, .1]);
            rotate([90, 0, 0]) sbc(sbc_model, "disable", 0, gpio_mask, uart_mask, true);
        }
        // left section
        difference() {
            translate([-pcbmaxsize_z-adj, 0, 0]) cube([pcbmaxsize_z, pcbsize_y, .1]);
            translate([0, 0, -adj]) rotate([0, -90, 0]) sbc(sbc_model, "disable", 0, gpio_mask, uart_mask, true);
        }    
        // front section
        difference() {
            translate([0, pcbsize_y, 0]) cube([pcbsize_x, pcbmaxsize_z, .1]);
            translate([0, pcbsize_y, pcbsize_y+adj]) rotate([-90, 0, 0]) 
                sbc(sbc_model, "disable", 0, gpio_mask, uart_mask, true);
        }
        // right section
        difference() {
            translate([pcbsize_x+adj, 0, 0]) cube([pcbmaxsize_z, pcbsize_y, .1]);
            translate([pcbsize_x, 0, pcbsize_x+adj]) rotate([0, 90, 0]) 
                sbc(sbc_model, "disable", 0, gpio_mask, uart_mask, true);
        } 
        // pcb section
        sbc(sbc_model, "disable", 0, "disable", uart_mask, false); 
    }
}

// view component classes
if(view == "Components") {
    antenna =  ["ipex"];
    audio =    ["out-in-spdif", "jack_3.5", "audio_micro", "mic_round"];
    b2b =      ["df40"];
    battery =  ["bat_hold_1", "rtc_micro"];
    button =   ["momentary_6x6x9", "momentary_6x6x4", "momentary_6x6x4_90", "momentary_4x2x1_90", "momentary_4x2x1", "momentary_7x3x3_90", "momentary_4.5x3.5x2.5_90"];
    cm =       ["cm1","cm3","cm3l","cm4","cm4l","jetsonnano"];
    discrete = ["ir_1", "ir_dual", "capacitor", "led"];
    display =  ["lcd_2.2"];
    fan =      ["fan_micro","encl_pmw","encl_pmw_h"];
    fpc =      ["fh19", "fh12"];
    gpio =     ["open", "encl_header_30", "encl_header_12"];
    header =   ["open"];
    heatsink = ["40mm_passive_10", "40mm_passive_25", "32mm_passive_10", "c1+_oem", "c2_oem", "40mm_active_10", "c4_oem", "hc4_oem", "xu4_oem", "xu4q_oem", "n1_oem", "n2l_oem", "n2lq_oem", "n2_oem", "n2+_oem", "m1_oem", "h2_oem", "h3_oem", "atomicpi", "khadas_oem", "khadas_fan_oem", "radxa_oem", "rpi5_oem", "stub", "pine64_active_10", "pine64_passive_20", "pine64_passive_30", "m1s_oem"];
    ic =       ["generic"];
    jst =      ["xh", "ph", "zh", "sh", "pa"];
    memory =   ["emmc", "emmc_plug", "sodimm_5.2", "sodimm_9.2"];
    molex =    ["7478"];
    network =  ["rj45_single", "rj45_single_short", "rj45_reverse_single", "rj45_low_profile1","rj45_low_profile2", "rj45_double_stacked", "rj45-usb2_double", "rj45-usb3_double"];

    pcb =      ["round", "slot", "rectangle", "polygon", "dxf", "cm1", "cm3", "cm4"];
    pcbhole =  ["round"];
    pcbadd =   ["round", "slot", "rectangle", "polygon", "dxf"];
    pcbsub =   ["round", "slot", "rectangle", "polygon", "dxf"];
    pcbsoc =   ["flat", "raised", "mid-raised", "rk3399", "rk3588"];

    pcie =     ["x1","x4"];
    pillar =   ["hex", "round"];
    power =    ["pwr2.5_5x7.5", "pwr5.5_7.5x11.5", "pwr5.5_10x10", "pwr5.5_9.5x7", "pj-202ah", "molex_4x1", "small_encl_satapwr"];
    shape =    ["round","rectangle","slot","knockout"];   
    smd =      ["led"];
    storage =  ["microsdcard", "microsdcard2", "microsdcard3", "microsdcard3_i", "sata_header", "sata_power_vrec", "sata_encl_power", "m.2_header", "m.2_stud"];
    switch =   ["slide_4x9"];
    terminal = ["gtb"];
    uart =     ["molex_5267", "molex_5268"];
    usb2 =     ["micro", "single_horizontal_a", "single_vertical_a", "double_stacked_a"];
    usb3 =     ["single_horizontal_a", "single_vertical_a", "double_stacked_a", "double_stacked_usb3-usbc","double_stacked_usb3-usb2"];
    usbc =     ["single_horizontal", "single_vertical"];
    video =    ["hdmi_a", "hdmi_a_vertical", "dp-hdmi_a", "hdmi_micro", "hdmi_mini", "dp_mini", "mipi_csi", "mipi_dsi"];

    if(Class =="antenna") {
        for(i=[0:1:len(antenna)-1]) {
            antenna(antenna[0], i*20, i*20, 0, "top", 0, [0,0,0], [0], 0, false, [0]);
            color(text_color) translate([5+i*20, i*20, 0]) rotate([0, 0, 0]) text(str(antenna[i]), direction="ltr");
        }
    }
    if(Class =="audio") {
        for(i=[0:1:len(audio)-1]) {
            audio(audio[i], i*20, i*20, 0, "top", 0, [6.5,10,4],[5,0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([15+i*20, i*20, 0]) rotate([0, 0, 0]) text(str(audio[i]), direction="ltr");
        }
    }
    if(Class =="b2b") {
        for(i=[0:1:len(b2b)-1]) {
            if(b2b[i] == "df40") {
                for(c=[8:10:100]) {
                    b2b(b2b[i], 0, c-8, 0, "top", 0, [c,0,1.5],["default","black", "male"], 
                        0, false, [false,10,2,"default"]);
                    b2b(b2b[i], 25, c-8, 0, "top", 0, [c,0,1.5],["default","black", "female"], 
                        0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([0, -12, 0]) text(str(b2b[i]), direction="ltr");
            }
        }
    }
    if(Class =="battery") {
        for(i=[0:1:len(battery)-1]) {
            battery(battery[i], i*20, i*20, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([25+i*20, i*20, 0]) rotate([0, 0, 0]) text(str(battery[i]), direction="ltr");
        }
    }
    if(Class =="button") {
        for(i=[0:1:len(button)-1]) {
            button(button[i], i*12, i*12, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([15+i*12, i*12, 0]) rotate([0, 0, 0]) text(str(button[i]), direction="ltr");
        }
    }
    if(Class =="cm") {
        for(i=[0:1:len(cm)-1]) {
            cm(cm[i], 0, i*45, 0, "top", 0, [0,0,0],["#008066"], 0, false, [false,10,2,"default"]);
            color(text_color) translate([75, i*45, 0]) rotate([0, 0, 0]) text(str(cm[i]), direction="ltr");
        }
    }
    if(Class =="discrete") {
        for(i=[0:1:len(discrete)-1]) {
            if(discrete[i] == "ir_1") {
                for(c=[0:2:10]) {
                    discrete(discrete[i], 8, c*8, 0, "top", 0, [0,0,c],[0], 0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([0, -12, 0]) text(str(discrete[i]), direction="ltr");
            }
            if(discrete[i] == "ir_dual") {
                discrete(discrete[i], 40, 0, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
                color(text_color) translate([28, -12, 0]) text(str(discrete[i]), direction="ltr");
            }
            if(discrete[i] == "capacitor") {
                for(c=[0:2:10]) {
                    discrete(discrete[i], 120, 5+(c*8), 0, "top", 0, [8,0,4+c],[0], 0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([100, -12, 0]) text(str(discrete[i]), direction="ltr");
            }
            if(discrete[i] == "led") {
                for(c=[0:2:10]) {
                    discrete(discrete[i], 75, 5+(c*8), 0, "top", 0, [5,0,4+c],["default","red"], 
                        0, false, [false,10,2,"default"]);
                    discrete(discrete[i], 85, 5+(c*8), 0, "top", 0, [5,0,4+c],["default","green"], 
                        0, false, [false,10,2,"default"]);
                    discrete(discrete[i], 95, 5+(c*8), 0, "top", 0, [5,0,4+c],["default","yellow"], 
                        0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([75, -12, 0]) text(str(discrete[i]), direction="ltr");
            }
        }
    }
    if(Class =="display") {
        for(i=[0:1:len(display)-1]) {
            display(display[i], 0, i*45, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([75, i*45, 0]) rotate([0, 0, 0]) text(str(display[i]), direction="ltr");
        }
    }
    if(Class =="fan") {
        for(i=[0:1:len(fan)-1]) {
            fan(fan[i], i*20, i*20, 0, "top", 0, [6.5,10,4],[5,0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([15+i*20, i*20, 0]) rotate([0, 0, 0]) text(str(fan[i]), direction="ltr");
        }
    }
    if(Class =="fpc") {
        for(i=[0:1:len(fpc)-1]) {
            if(fpc[i] == "fh19") {
                for(c=[8:4:28]) {
                    fpc(fpc[i], 0, c-8, 0, "top", 0, [c,0,0],["smt","side", "#ede1ca","#a47c5b"], 
                            0, false, [false,10,2,"default"]);
                    fpc(fpc[i], 25, c-8, 0, "top", 0, [c,0,0],["smt","side", "white", "black"], 
                            0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([0, -12, 0]) text(str(fpc[i]), direction="ltr");
            }
            if(fpc[i] == "fh12") {
                for(c=[8:4:28]) {
                    fpc(fpc[i], 50, (c*2)-16, 0, "top", 0, [c,0,0],["smt","top", "#ede1ca","#a47c5b"], 
                        0, false, [false,10,2,"default"]);
                    fpc(fpc[i], 75, (c*2)-16, 0, "top", 0, [c,0,0],["smt","top", "white", "black"], 
                        0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([50, -12, 0]) text(str(fpc[i]), direction="ltr");
            }
        }
    }
    if(Class =="gpio") {
        gpio("open",0,0,0,"top",0,[20,2,6],["thruhole","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        color(text_color) translate([55, 0, 0]) text(str("open 20x2"));
        translate([0, 20, 0])
        gpio("open",0,0,0,"top",0,[13,2,6],["smt","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        color(text_color) translate([35, 20, 0]) text(str("open 13x2"));
        translate([0, 40, 0])
        gpio("open",0,0,0,"top",0,[10,2,6],["smt","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        color(text_color) translate([30, 40, 0]) text(str("open 10x2"));
        translate([0, 60, 0])
        gpio("open",0,0,0,"top",0,[7,2,6],["smt","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        color(text_color) translate([25, 60, 0]) text(str("open 7x2"));
        translate([0, 80, 0])
        gpio("encl_header_12",0,0,0,"top",0,[7,2,6],["smt","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        color(text_color) translate([25, 80, 0]) text(str("encl_header_12"));
        translate([0, 100, 0])
        gpio("encl_header_30",0,0,0,"top",0,[7,2,6],["smt","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        color(text_color) translate([45, 100, 0]) text(str("encl_header_30"));
    }
    if(Class =="header") {
        header("open",0,0,0,"top",0,[2,3,6],["smt","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",10,0,0,"top",0,[3,2,6],["thruhole","black","male",2.54,"silver",0,0,0],0,false,[10,2,"default"]);
        header("open",22,0,0,"top",0,[3,2,6],["smt","black","female",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",32,0,0,"top",0,[1,6,6],["thruhole","black","female",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);

        header("open",-8,0,0,"top",0,[2,8,4],["smt","black","male",2,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",-15,0,0,"top",0,[2,3,4],["thruhole","black","male",2,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",-23,0,0,"top",0,[2,8,4],["smt","black","female",2,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",-32,0,0,"top",0,[2,6,6],["thruhole","black","female",2,"silver",0,0,0],0,false,[10,2,"default"]);

        header("open",8,-20,0,"top",0,[2,8,3],["smt","black","male",1,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",15,-20,0,"top",0,[2,3,3],["thruhole","black","male",1,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",22,-20,0,"top",0,[2,8,4],["smt","black","female",1,"silver",0,0,0],0,false,[10,2,"default"]);
        header("open",32,-20,0,"top",0,[2,6,7],["thruhole","black","female",1,"#fee5a6",0,0,0],0,false,[10,2,"default"]);        
    }
    if(Class =="heatsink") {
        for(i=[0:1:len(heatsink)-1]) {
            if(i <= 6) {
                heatsink(heatsink[i], 0, i*55, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
                color(text_color) translate([50, i*55, 0]) text(str(heatsink[i]), direction="ltr");
            }
            if(i > 6 && i <= 12) {
                heatsink(heatsink[i], 180, (i*50)-320, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
                color(text_color) translate([240, (i*50)-320, 0]) text(str(heatsink[i]), direction="ltr");
            }
            if(i > 12  && i <= 15) {
                heatsink(heatsink[i], 320, (i*100)-1300, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
                color(text_color) translate([420, (i*100)-1300, 0]) text(str(heatsink[i]), direction="ltr");
            }
            if(i > 15 && i <= 21) {
                heatsink(heatsink[i], 520, (i*85)-1350, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
                color(text_color) translate([605, (i*85)-1350, 0]) text(str(heatsink[i]), direction="ltr");
            }
            if(i > 21) {
                heatsink(heatsink[i], 700, (i*50)-1100, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
                color(text_color) translate([790, (i*50)-1100, 0]) text(str(heatsink[i]), direction="ltr");
            }
       }
    }
    if(Class =="ic") {
        for(i=[0:1:len(ic)-1]) {
            if(ic[i] == "generic") {
                for(c=[4:2:16]) {
                    ic(ic[i], (c*8)-32, 0, 0, "top", 0, [c,c,.8],[0], 0, false, [false,10,2,"default"]);
                    ic(ic[i], (c*4)-16, 30, 0, "top", 0, [7,c,.8],[0], 0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([0, -12, 0]) text(str(ic[i]), direction="ltr");
            }
        }
    }
    if(Class =="jst") {
        // thruhole side entry
        jst("xh",-15,0,0,"top",0,[3,0,0],["thruhole","side","green"],0,false,[10,2,"default"]);
        jst("ph",-30,0,0,"top",0,[4,0,0],["thruhole","side","white"],0,false,[10,2,"default"]);
        jst("zh",-40,0,0,"top",0,[3,0,0],["thruhole","side","white"],0,false,[10,2,"default"]);
        jst("sh",-50,0,0,"top",0,[3,0,0],["thruhole","side","white"],0,false,[10,2,"default"]);

        // thruhole top entry
        jst("xh",-15,20,0,"top",0,[3,0,0],["thruhole","top","orange"],0,false,[10,2,"default"]);
        jst("ph",-30,20,0,"top",0,[4,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("zh",-40,20,0,"top",0,[3,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("sh",-50,20,0,"top",0,[3,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);

        jst("pa",0,-30,0,"top",0,[7,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("pa",0,-40,0,"top",0,[6,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("pa",0,-50,0,"top",0,[5,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("pa",0,-60,0,"top",0,[4,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("pa",0,-70,0,"top",0,[3,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("pa",0,-80,0,"top",0,[2,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);

        // smt side entry
        jst("xh",0,0,0,"top",0,[3,0,0],["smt","side","white"],0,false,[10,2,"default"]);
        jst("ph",15,0,0,"top",0,[4,0,0],["smt","side","white"],0,false,[10,2,"default"]);
        jst("zh",30,0,0,"top",0,[3,0,0],["smt","side","white"],0,false,[10,2,"default"]);
        jst("sh",40,0,0,"top",0,[3,0,0],["smt","side","white"],0,false,[10,2,"default"]);

        // smt top entry
        jst("xh",0,20,0,"top",0,[3,0,0],["smt","top","white"],0,false,[10,2,"default"]);
        jst("ph",15,20,0,"top",0,[4,0,0],["smt","top","white"],0,false,[10,2,"default"]);
        jst("zh",30,20,0,"top",0,[3,0,0],["smt","top","white"],0,false,[10,2,"default"]);
        jst("sh",40,20,0,"top",0,[3,0,0],["smt","top","white"],0,false,[10,2,"default"]);
    }
    if(Class =="memory") {
        for(i=[0:1:len(memory)-1]) {
            memory(memory[i], 0, i*25, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([80, i*25, 0]) rotate([0, 0, 0]) text(str(memory[i]), direction="ltr");
        }
    }
    if(Class =="molex") {
        for(i=[0:1:len(molex)-1]) {
            if(molex[i] == "7478") {
                for(c=[3:4:12]) {
                    molex(molex[i], 0, (c*4)-6, 0, "top", 0, [c,0,0],["thruhole","top"], 
                            0, false, [false,10,2,"default"]);
                    molex(molex[i], 35, (c*4)-6, 0, "top", 0, [c,0,0],["thruhole","side"], 
                            0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([80, i*25, 0]) rotate([0, 0, 0]) text(str(molex[i]), direction="ltr");
            }
        }
    }
    if(Class =="network") {
        for(i=[0:1:len(network)-1]) {
            network(network[i], i*20, i*40, 0, "top", 0, [0,0,0], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([20+(i*20), i*40, 0]) rotate([0, 0, 0]) text(str(network[i]), direction="ltr");
        }
    }
    if(Class =="pcie") {
        pcie("x4", 0, 25, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
        color(text_color) translate([40, 0, 0]) rotate([0, 0, 0]) text(str("x1"), direction="ltr");
        pcie("x1", 0, 0, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
        color(text_color) translate([40, 25, 0]) rotate([0, 0, 0]) text(str("x4"), direction="ltr");
    }
    if(Class =="pillar") {
        for(c=[5:1:12]) {
            pillar("hex", 0, (c*15)-70, 0, "top", 0, [c,3,c],[0,"#fee5a6"], 
                    0, false, [false,10,2,"default"]);
            pillar("round", 35, (c*15)-70, 0, "top", 0, [c,3,c],[0,"white"], 
                    0, false, [false,10,2,"default"]);
        }
    }
    if(Class =="power") {
        for(i=[0:1:len(power)-1]) {
            power(power[i], i*20, i*40, 0, "top", 0, [0,0,0], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([20+(i*20), i*40, 0]) rotate([0, 0, 0]) text(str(power[i]), direction="ltr");
        }
    }
    if(Class =="smd") {
        for(i=[0:1:len(smd)-1]) {
            smd(smd[i], i*20, i*40, 0, "top", 0, [3,2,1], ["red"], 0, false, [false,10,2,"default"]);
            color(text_color) translate([6+(i*20), i*40, 0]) rotate([0, 0, 0]) text(str(smd[i]), direction="ltr");
        }
    }
    if(Class =="storage") {
        for(i=[0:1:len(storage)-1]) {
            storage(storage[i], i*20, i*40, 0, "top", 0, [3,2,1], ["red"], 0, false, [false,10,2,"default"]);
            color(text_color) translate([40+(i*20), i*40, 0]) rotate([0, 0, 0]) text(str(storage[i]), direction="ltr");
        }
    }
    if(Class =="switch") {
        for(i=[0:1:len(switch)-1]) {
            switch(switch[i], i*20, i*40, 0, "top", 0, [3,2,1], ["red"], 0, false, [false,10,2,"default"]);
            color(text_color) translate([40+(i*20), i*40, 0]) rotate([0, 0, 0]) text(str(switch[i]), direction="ltr");
        }
    }
    if(Class =="terminal") {
        for(i=[0:1:len(terminal)-1]) {
            for(c=[5:1:12]) {
                terminal(terminal[i], 0, (c*20)-100, 0, "top", 0, [c,8.3,14], [5,"lightgreen"],
                    0, false, [false,10,2,"default"]);
            }
            color(text_color) translate([30, 0, 0]) rotate([0, 0, 0]) text(str(terminal[i]), direction="ltr");
        }
    }
    if(Class =="uart") {
        for(i=[0:1:len(uart)-1]) {
            uart(uart[i], i*20, i*40, 0, "top", 0, [0,0,0], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([40+(i*20), i*40, 0]) rotate([0, 0, 0]) text(str(uart[i]), direction="ltr");
        }
    }
    if(Class =="usb2") {
        for(i=[0:1:len(usb2)-1]) {
            usb2(usb2[i], i*20, i*40, 0, "top", 0, [10,10,10], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([20+(i*20), i*40, 0]) rotate([0, 0, 0]) text(str(usb2[i]), direction="ltr");
        }
    }
    if(Class =="usb3") {
        for(i=[0:1:len(usb3)-1]) {
            usb3(usb3[i], i*20, i*40, 0, "top", 0, [10,10,10], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([20+(i*20), i*40, 0]) rotate([0, 0, 0]) text(str(usb3[i]), direction="ltr");
        }
    }
    if(Class =="usbc") {
        for(i=[0:1:len(usbc)-1]) {
            usbc(usbc[i], i*20, i*40, 0, "top", 0, [0,0,0], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([20+(i*20), i*40, 0]) rotate([0, 0, 0]) text(str(usbc[i]), direction="ltr");
        }
    }
    if(Class =="video") {
        for(i=[0:1:len(video)-1]) {
            video(video[i], i*20, i*40, 0, "top", 0, [0,0,0], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([20+(i*20), i*40, 0]) rotate([0, 0, 0]) text(str(video[i]), direction="ltr");
        }
    }
}

// display all models
if(view == "All SBC Models") {
    translate([-460,0,0]) {
        translate ([-365,0,12]) sbc("m1s");
        linear_extrude(height = 2) {translate([-360,-20,0]) text("Odroid-M1s");}
        color("green",.5) translate([-355,-20,-1]) cube([65,10,1]);

        translate ([-365,115,12]) sbc("m1");
        linear_extrude(height = 2) {translate([-355,100,0]) text("Odroid-M1");}
        color("green",.5) translate([-355,100,-1]) cube([65,10,1]);

        translate ([-240,0,0]) sbc("hc4");
        linear_extrude(height = 2) {translate([-240,-20,0]) text("Odroid-HC4");}
        color("green",.5) translate([-240,-20,-1]) cube([72,10,1]);

        translate ([-120,0,0]) sbc("c4");
        linear_extrude(height = 2) {translate([-120,-20,0]) text("Odroid-C4");}
        color("green",.6) translate([-120,-20,-1]) cube([63,10,1]);

        translate ([-120,100,0]) sbc("c2");
        linear_extrude(height = 2) {translate([-120,80,0]) text("Odroid-C2");}
        color("green",.5) translate([-120,80,-1]) cube([63,10,1]);

        translate ([-120,200,0]) sbc("c1+");
        linear_extrude(height = 2) {translate([-120,180,0]) text("Odroid-C1+");}
        color("green",.5) translate([-120,180,-1]) cube([70,10,1]);

        translate ([0,0,0]) sbc("xu4");
        linear_extrude(height = 2) {translate([0,-20,0]) text("Odroid-XU4");}
        color("green",.5) translate([0,-20,-1]) cube([72,10,1]);

        translate ([0,100,0]) sbc("xu4q");
        linear_extrude(height = 2) {translate([0,80,0]) text("Odroid-XU4Q");}
        color("green",.6) translate([0,80,-1]) cube([82,10,1]);

        translate ([0,200,0]) sbc("hc1");
        linear_extrude(height = 2) {translate([0,180,0]) text("Odroid-HC1/HC2");}
        color("green",.5) translate([0,180,-1]) cube([103,10,1]);

        translate ([0,290,0]) sbc("mc1");
        linear_extrude(height = 2) {translate([0,270,0]) text("Odroid-MC1");}
        color("green",.5) translate([0,270,-1]) cube([74,10,1]);

        translate ([0,370,0]) sbc("show2");
        linear_extrude(height = 2) {translate([0,350,0]) text("Show2");}
        color("orange",.5) translate([0,350,-1]) cube([41,10,1]);

        translate ([120,0,12]) sbc("n2+");
        linear_extrude(height = 2) {translate([120,-20,0]) text("Odroid-N2+");}
        color("green",.5) translate([120,-20,-1]) cube([71,10,1]);

        translate ([120,135,0]) sbc("n2l");
        linear_extrude(height = 2) {translate([120,120,0]) text("Odroid-N2L");}
        color("green",.5) translate([120,120,-1]) cube([70,10,1]);

        translate ([120,225,0]) sbc("n2lq");
        linear_extrude(height = 2) {translate([120,210,0]) text("Odroid-N2LQ");}
        color("green",.5) translate([120,210,-1]) cube([80,10,1]);

        translate ([120,315,18]) sbc("n2");
        linear_extrude(height = 2) {translate([120,305,0]) text("Odroid-N2");}
        color("green",.5) translate([120,305,-1]) cube([63,10,1]);

        translate ([120,470,0]) sbc("n1");
        linear_extrude(height = 2) {translate([120,450,0]) text("Odroid-N1");}
        color("green",.5) translate([120,450,-1]) cube([63,10,1]);

        translate ([240,0,0]) sbc("h3");
        linear_extrude(height = 2) {translate([240,-20,0]) text("Odroid-H3/H3+");}
        color("green",.5) translate([240,-20,-1]) cube([84,10,1]);

        translate ([240,150,0]) sbc("h2");
        linear_extrude(height = 2) {translate([240,135,0]) text("Odroid-H2/H2+");}
        color("green",.5) translate([240,135,-1]) cube([84,10,1]);

        translate ([380,0,0]) sbc("rockpro64");
        linear_extrude(height = 2) {translate([400,-20,0]) text("RockPro 64");}
        color("yellow",.3) translate([400,-20,-1]) cube([71,10,1]);

        translate ([380,115,0]) sbc("rock64");
        linear_extrude(height = 2) {translate([400,95,0]) text("Rock 64");}
        color("yellow",.3) translate([400,95,-1]) cube([50,10,1]);

        translate ([380,202,0]) sbc("quartz64a");
        linear_extrude(height = 2) {translate([385,187,0]) text("Quartz 64 A");}
        color("yellow",.3) translate([385,187,-1]) cube([72,10,1]);

        translate ([380,320,0]) sbc("quartz64b");
        linear_extrude(height = 2) {translate([380,300,0]) text("Quartz 64 B");}
        color("yellow",.3) translate([380,300,-1]) cube([72,10,1]);

        translate ([380,410,0]) sbc("h64b");
        linear_extrude(height = 2) {translate([400,390,0]) text("H64 B");}
        color("yellow",.3) translate([400,390,-1]) cube([38,10,1]);

        translate ([380,500,0]) sbc("star64");
        linear_extrude(height = 2) {translate([400,485,0]) text("Star 64");}
        color("yellow",.3) translate([400,485,-1]) cube([43,10,1]);

        translate([550,-90,0]) sbc("rpicm4");
        linear_extrude(height = 2) { translate([550,-110,0]) text("RPi CM4"); }
        color("green",.3) translate([550,-110,-1]) cube([55,10,1]);

        translate([550,-170,0]) sbc("rpicm4l");
        linear_extrude(height = 2) { translate([550,-190,0]) text("RPi CM4L"); }
        color("green",.3) translate([550,-190,-1]) cube([63,10,1]);

        translate([550,-240,0]) sbc("rpicm3");
        linear_extrude(height = 2) { translate([550,-260,0]) text("RPi CM3"); }
        color("green",.3) translate([550,-260,-1]) cube([55,10,1]);

        translate([535,0,0]) sbc("rpi5");
        linear_extrude(height = 2) { translate([550,-20,0]) text("RPi 5"); }
        color("green",.3) translate([550,-20,-1]) cube([35,10,1]);

        translate([535,90,0]) sbc("rpi4b");
        linear_extrude(height = 2) { translate([550,70,0]) text("RPi 4B"); }
        color("yellow",.3) translate([550,70,-1]) cube([42,10,1]);

        translate([535,180,0]) sbc("rpi3b+");
        linear_extrude(height = 2) { translate([535,160,0]) text("RPi 3B+"); }
        color("yellow",.3) translate([535,160,-1]) cube([50,10,1]);

        translate([535, 270, 0]) sbc("rpi3b");
        linear_extrude(height = 2) { translate([535,250,0]) text("RPi 3B"); }
        color("yellow",.3) translate([535,250,-1]) cube([42,10,1]);

        translate([535, 360, 0]) sbc("rpi3a+");
        linear_extrude(height = 2) { translate([535,340,0]) text("RPi 3A+"); }
        color("yellow",.3) translate([535,340,-1]) cube([50,10,1]);

        translate([535, 450, 0]) sbc("rpi1b+");
        linear_extrude(height = 2) { translate([535,430,0]) text("RPi 1B+"); }
        color("yellow",.3) translate([535,430,-1]) cube([50,10,1]);

        translate([535, 540, 0]) sbc("rpi1a+");
        linear_extrude(height = 2) { translate([535,520,0]) text("RPi 1A+"); }
        color("yellow",.3) translate([535,520,-1]) cube([50,10,1]);

        translate([535,620,0]) sbc("rpizero2w");
        linear_extrude(height = 2) { translate([535,605,0]) text("RPi Zero2 W"); }
        color("yellow",.3) translate([535,605,-1]) cube([78,10,1]);

        translate([535,680,0]) sbc("rpizero");
        linear_extrude(height = 2) { translate([535,662,0]) text("RPi Zero"); }
        color("yellow",.3) translate([535,662,-1]) cube([53,10,1]);

        translate([535,750,0]) sbc("rpicm4+ioboard");
        linear_extrude(height = 2) { translate([535,732,0]) text("RPi CM4 IO Board"); }
        color("yellow",.3) translate([535,732,-1]) cube([53,10,1]);

        translate([650,495,0]) sbc("rock4b+");
        linear_extrude(height = 2) { translate([650,475,0]) text("ROCK 4A/B+"); }
        color("yellow",.3) translate([650,475,-1]) cube([92,10,1]);

        translate([650,405,0]) sbc("rock4c");
        linear_extrude(height = 2) { translate([650,385,0]) text("ROCK 4C"); }
        color("yellow",.3) translate([650,385,-1]) cube([73,10,1]);

        translate([650,315,0]) sbc("rock4c+");
        linear_extrude(height = 2) { translate([655,295,0]) text("ROCK 4C+"); }
        color("yellow",.3) translate([655,295,-1]) cube([80,10,1]);

        translate([650,210,0]) sbc("rock5b-v1.3");
        linear_extrude(height = 2) { translate([655,195,0]) text("ROCK 5b v1.31"); }
        color("yellow",.3) translate([655,195,-1]) cube([95,10,1]);

        translate([650,105,0]) sbc("rock5bq");
        linear_extrude(height = 2) { translate([655,85,0]) text("ROCK 5bq v1.42"); }
        color("green",.3) translate([655,85,-1]) cube([102,10,1]);

        translate([650,0,0]) sbc("rock5b");
        linear_extrude(height = 2) { translate([655,-20,0]) text("ROCK 5b v1.42"); }
        color("green",.3) translate([655,-20,-1]) cube([95,10,1]);

        translate([775,0,0]) sbc("vim4");
        linear_extrude(height = 2) { translate([775,-20,0]) text("Vim4"); }
        color("green",.3) translate([775,-20,-1]) cube([32,10,1]);

        translate([775,90,0]) sbc("vim3");
        linear_extrude(height = 2) { translate([775,70,0]) text("Vim3"); }
        color("green",.3) translate([775,70,-1]) cube([32,10,1]);

        translate([775,185,0]) sbc("vim3l");
        linear_extrude(height = 2) { translate([775,165,0]) text("Vim3L"); }
        color("green",.3) translate([775,165,-1]) cube([39,10,1]);

        translate([775,270,0]) sbc("vim2");
        linear_extrude(height = 2) { translate([775,250,0]) text("Vim2"); }
        color("green",.3) translate([775,250,-1]) cube([32,10,1]);

        translate([775,360,0]) sbc("vim1");
        linear_extrude(height = 2) { translate([775,340,0]) text("Vim1"); }
        color("green",.3) translate([775,340,-1]) cube([32,10,1]);

        translate([885,0,0]) sbc("tinkerboard-r2");
        linear_extrude(height = 2) { translate([885,-20,0]) text("Tinkerboard"); }
        color("yellow",.3) translate([885,-20,-1]) cube([72,10,1]);

        linear_extrude(height = 2) { translate([885,-35,0]) text("R2/R2S"); }
        color("yellow",.3) translate([885,-35,-1]) cube([48,10,1]);

        translate([885,90,0]) sbc("tinkerboard-2");
        linear_extrude(height = 2) { translate([885,70,0]) text("Tinkerboard 2/2S"); }
        color("yellow",.3) translate([885,70,-1]) cube([104,10,1]);

        translate([885,185,0]) sbc("tinkerboard-s");
        linear_extrude(height = 2) { translate([885,165,0]) text("Tinkerboard S"); }
        color("yellow",.3) translate([885,165,-1]) cube([85,10,1]);

        translate([885,275,0]) sbc("tinkerboard");
        linear_extrude(height = 2) { translate([885,255,0]) text("Tinkerboard"); }
        color("yellow",.3) translate([885,255,-1]) cube([72,10,1]);

        translate([1005,0,0]) sbc("opi5");
        linear_extrude(height = 2) { translate([1005,-20,0]) text("OrangePi 5"); }
        color("green",.3) translate([1005,-20,-1]) cube([70,10,1]);

        translate([1005,90,0]) sbc("opizero");
        linear_extrude(height = 2) { translate([1005,73,0]) text("Zero/ZeroPlus"); }
        color("yellow",.3) translate([1005,73,-1]) cube([86,10,1]);

        translate([1005,185,0]) sbc("opizero2");
        linear_extrude(height = 2) { translate([1005,165,0]) text("OPi Zero2"); }
        color("yellow",.3) translate([1005,165,-1]) cube([63,10,1]);

        translate([1005,275,0]) sbc("opir1plus_lts");
        linear_extrude(height = 2) { translate([1005,255,0]) text("OPi R1 Plus LTS"); }
        color("yellow",.3) translate([1005,255,-1]) cube([102,10,1]);

        translate([1005,375,0]) sbc("opir1");
        linear_extrude(height = 2) { translate([1005,350,0]) text("OPi R1"); }
        color("green",.3) translate([1005,350,-1]) cube([45,10,1]);

        translate ([1120,0,0]) sbc("alta");
        linear_extrude(height = 2) {translate([1130,-20,0]) text("Alta");}
        color("yellow",.5) translate([1130,-20,-1]) cube([24,10,1]);

        translate ([1120,90,0]) sbc("solitude");
        linear_extrude(height = 2) {translate([1130,70,0]) text("Solitude");}
        color("yellow",.5) translate([1130,70,-1]) cube([50,10,1]);

        translate ([1120,185,0]) sbc("sweetpotato");
        linear_extrude(height = 2) {translate([1130,165,0]) text("Sweet Potato");}
        color("yellow",.5) translate([1130,165,-1]) cube([80,10,1]);

        translate ([1120,275,0]) sbc("lepotato");
        linear_extrude(height = 2) {translate([1130,255,0]) text("Le Potato");}
        color("yellow",.5) translate([1130,255,-1]) cube([57,10,1]);

        translate ([1120,360,0]) sbc("tritium-h5");
        linear_extrude(height = 2) {translate([1130,340,0]) text("Tritium H5");}
        color("yellow",.5) translate([1130,340,-1]) cube([64,10,1]);

        translate ([1120,450,0]) sbc("tritium-h3");
        linear_extrude(height = 2) {translate([1130,430,0]) text("Tritium H3");}
        color("yellow",.5) translate([1130,430,-1]) cube([64,10,1]);

        translate ([1120,550,0]) sbc("tritium-h2+");
        linear_extrude(height = 2) {translate([1130,530,0]) text("Tritium H2+");}
        color("yellow",.5) translate([1130,530,-1]) cube([72,10,1]);




        translate ([1230,0,0]) sbc("jetsonnano");
        linear_extrude(height = 2) {translate([1240,-20,0]) text("Jetson Nano");}
        color("green",.5) translate([1240,-20,-1]) cube([76,10,1]);

        translate ([1360,0,0]) sbc("licheerv+dock");
        linear_extrude(height = 2) {translate([1340,-20,0]) text("LicheeRV + Dock");}
        color("green",.5) translate([1340,-20,-1]) cube([105,10,1]);

        translate ([1450,0,0]) sbc("visionfive2");
        linear_extrude(height = 2) {translate([1460,-20,0]) text("VisionFive2");}
        color("green",.5) translate([1458,-20,-1]) cube([73,10,1]);

        translate ([1565,0,0]) sbc("atomicpi");
        linear_extrude(height = 2) {translate([1600,-20,0]) text("AtomicPi");}
        color("green",.5) translate([1598,-20,-1]) cube([56,10,1]);
    }
}