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

    20240122 Version 1.0.0  SBC Models Viewer initial release

    see https://github.com/hominoids/SBC_Model_Framework

*/

include <sbc_models.scad>

/* [SBC Models] */
view = "Model"; // [Model, 2D_Sections, All_Models, Odroids]

sbc_model = "c1+"; // ["c1+","c2","c4","xu4","xu4q","mc1","hc1","hc4","n1","n2","n2+","n2l","n2lq","m1","m1s","h2","h2+","h3","h3+","show2","rpizero","rpizero2w","rpi1a+","rpi1b+","rpi3a+","rpi3b","rpi3b+","rpi4b","rpi5","rpicm1","rpicm3","rpicm3l","rpicm3+","rpicm4","rpicm4l","rpicm1","rpicm4+ioboard","rock64","rockpro64","quartz64a","quartz64b","h64b","star64","rock4a","rock4a+","rock4b","rock4b+","rock4c","rock4c+","rock5b-v1.3","rock5b","vim1","vim2","vim3l","vim3","vim4","tinkerboard","tinkerboard-s","tinkerboard-2","tinkerboard-2s","tinkerboard-r2","tinkerboard-r2s","opi5","opizero","opizero2","opir1plus_lts","opir1","jetsonnano","licheerv+dock","visionfive2","atomicpi"]

sbc_off = false;
sbc_info = true;
sbc_mask = false;
heatsink = "default"; // ["disable", "off", "default", "none", "open", "fan_open", "fan_1", "fan_2", "fan_hex","vent", "vent_hex_5mm", "vent_hex_8mm", "custom"]
fan_size = 0; // [0,30,40,50,60,70,80,92]
gpio = "default"; // ["disable", "off", "default", "none", "open", "block", "knockout", "vent"]
uart = "default"; // ["default", "none", "open", "knockout"]

/* [Hidden] */
s = search([sbc_model], sbc_data);
pcbsize_x = sbc_data[s[0]][10][0];
pcbsize_y = sbc_data[s[0]][10][1];
pcbsize_z = sbc_data[s[0]][10][1];
pcbmaxsize_z = sbc_data[s[0]][11][5];

sindex = 2;
text_offset = 5;
text_height = sbc_data[s[0]][11][5] + 175;
text_loc_x = [0,-10,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
adj = .01;
$fn=90;

if(view == "Model") {
    // sbc model
    if(sbc_off == false) {
        sbc(sbc_model, heatsink, fan_size, gpio, uart, false);
    }
    // create information text
    if(sbc_info == true) {
        for (i=[0:1:len(sbc_data[s[0]][1])-1]) {
            r = text_loc_x[0+i];
            color("#009900") translate([text_offset, pcbsize_y, text_height-i*7]) 
                rotate([90, 0, 0]) text(sbc_data[s[0]][1][i], 5);
        }
    }
    // sbc mask highlight
    if(sbc_mask == true) {
        #sbc(sbc_model, heatsink, fan_size, gpio, uart, true);
    }
}
// create 2d mask sections
if(view == "2D_Sections") {
    projection(cut = true) {
        // rear section
        difference() {
            translate([0, -pcbmaxsize_z, 0]) cube([pcbsize_x, pcbmaxsize_z, .1]);
            rotate([90, 0, 0]) sbc(sbc_model, "disable", 0, gpio, uart, true);
        }
        // left section
        difference() {
            translate([-pcbmaxsize_z-adj, 0, 0]) cube([pcbmaxsize_z, pcbsize_y, .1]);
            translate([0, 0, -adj]) rotate([0, -90, 0]) sbc(sbc_model, "disable", 0, gpio, uart, true);
        }    
        // front section
        difference() {
            translate([0, pcbsize_y, 0]) cube([pcbsize_x, pcbmaxsize_z, .1]);
            translate([0, pcbsize_y, pcbsize_y+adj]) rotate([-90, 0, 0]) 
                sbc(sbc_model, "disable", 0, gpio, uart, true);
        }
        // right section
        difference() {
            translate([pcbsize_x+adj, 0, 0]) cube([pcbmaxsize_z, pcbsize_y, .1]);
            translate([pcbsize_x, 0, pcbsize_x+adj]) rotate([0, 90, 0]) 
                sbc(sbc_model, "disable", 0, gpio, uart, true);
        } 
        // pcb section
        sbc(sbc_model, "disable", 0, "disable", uart, false); 
    }
}

if(view == "All_Models") {
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

        translate ([1120,0,0]) sbc("jetsonnano");
        linear_extrude(height = 2) {translate([1130,-20,0]) text("Jetson Nano");}
        color("green",.5) translate([1130,-20,-1]) cube([76,10,1]);

        translate ([1250,0,0]) sbc("licheerv+dock");
        linear_extrude(height = 2) {translate([1230,-20,0]) text("LicheeRV + Dock");}
        color("green",.5) translate([1230,-20,-1]) cube([105,10,1]);

        translate ([1340,0,0]) sbc("visionfive2");
        linear_extrude(height = 2) {translate([1350,-20,0]) text("VisionFive2");}
        color("green",.5) translate([1348,-20,-1]) cube([73,10,1]);

        translate ([1455,0,0]) sbc("atomicpi");
        linear_extrude(height = 2) {translate([1490,-20,0]) text("AtomicPi");}
        color("green",.5) translate([1488,-20,-1]) cube([56,10,1]);
    }
}

if(view == "Odroids") {
    translate ([-365,0,12]) sbc("m1s");
    linear_extrude(height = 2) {translate([-360,-20,0]) text("Odroid-M1s");}

    translate ([-365,115,12]) sbc("m1");
    linear_extrude(height = 2) {translate([-355,100,0]) text("Odroid-M1");}

    translate ([-240,0,0]) sbc("hc4");
    linear_extrude(height = 2) {translate([-240,-20,0]) text("Odroid-HC4");}

    translate ([-120,0,0]) sbc("c4");
    linear_extrude(height = 2) {translate([-120,-20,0]) text("Odroid-C4");}

    translate ([-120,100,0]) sbc("c2");
    linear_extrude(height = 2) {translate([-120,80,0]) text("Odroid-C2");}

    translate ([-120,200,0]) sbc("c1+");
    linear_extrude(height = 2) {translate([-120,180,0]) text("Odroid-C1+");}

    translate ([0,0,0]) sbc("xu4");
    linear_extrude(height = 2) {translate([0,-20,0]) text("Odroid-XU4");}

    translate ([0,100,0]) sbc("xu4q");
    linear_extrude(height = 2) {translate([0,80,0]) text("Odroid-XU4Q");}

    translate ([0,200,0]) sbc("hc1");
    linear_extrude(height = 2) {translate([0,180,0]) text("Odroid-HC1/HC2");}

    translate ([0,290,0]) sbc("mc1");
    linear_extrude(height = 2) {translate([0,270,0]) text("Odroid-MC1");}

    translate ([120,0,12]) sbc("n2+");
    linear_extrude(height = 2) {translate([120,-20,0]) text("Odroid-N2+");}

    translate ([120,135,0]) sbc("n2l");
    linear_extrude(height = 2) {translate([120,120,0]) text("Odroid-N2L");}

    translate ([120,225,0]) sbc("n2lq");
    linear_extrude(height = 2) {translate([120,210,0]) text("Odroid-N2LQ");}

    translate ([120,315,18]) sbc("n2");
    linear_extrude(height = 2) {translate([120,305,0]) text("Odroid-N2");}

    translate ([120,470,0]) sbc("n1");
    linear_extrude(height = 2) {translate([120,450,0]) text("Odroid-N1");}

    translate ([240,0,0]) sbc("h3");
    linear_extrude(height = 2) {translate([240,-20,0]) text("Odroid-H3/H3+");}

    translate ([240,160,0]) sbc("h2");
    linear_extrude(height = 2) {translate([240,145,0]) text("Odroid-H2/H2+");}

    translate ([370,0,0]) sbc("show2");
    linear_extrude(height = 2) {translate([390,-20,0]) text("Show2");}
}
