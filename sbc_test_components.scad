/*
    SBC Library Copyright 2016,2017,2018,2019,2020,2021,2022 Edward A. Kisiel hominoid@cablemi.com

    This program is free software: you can redistribute it and/or modify`
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    Code released under GPLv3: http://www.gnu.org/licenses/gpl.html

    20190214 Version 1  Component Library for the SBC Model Framework
    
    component classes and types:
    memory  - "emmc","emmc_plug","sodimm_5.2","sodimm_9.2"
    switch -  "slide_4x9"
    button -  "momentary_6x6x9","momentary_6x6x4","momentary_6x6x4_90","momentary_4x2x1","momentary_7x3x3_90"
    plug -    "pwr2.5_5x7.5","pwr5.5_7.5x11.5","pwr5.5_10x10","rtc_micro","audio_micro","uart_micro","molex_4x1",
              "small_encl_satapwr"
    usb2 -    "micro","single_vertical_a","double_stacked_a","single_horizontal_a"
    usb3 -    "double_stacked_a","single_horizontal_a",
    network - "rj45_single",
    video -   "hdmi_a","hdmi_a_vertical","dp-hdmi_a","mipi_csi","mipi_dsi","hdmi_micro","dp_mini","hdmi_a_vertical"
    fan -     "micro","encl_pmw","encl_pmw_h"
    gpio -    "encl_header_12","encl_header_30","header_20","header_26","header_40"
    ic -      "ic_2.8x2.8","ic_3x3","ic_3.7x3.7","ic_4x4","ic_4.7x4.7","ic_5x5","ic_5.75x5.75","ic_6x6","ic_6.4x6.4",
              "ic_6.75x6.75","ic_7x7","ic_4.3x5.1","ic_5.4x5.3","ic_6.7x8.4","ic_9x9","ic_11x8","ic_13x8",
              "ic_13x9","ic_16x10"
    audio -   "out-in-spdif","jack_3.5"
    storage - "sdcard","sdcard_i","sata_header","sata_encl_header","m.2_header","m.2_stud","sata_encl_power",
              "sata_power_vrec","microsdcard"
    combo -   "rj45-usb2_double","rj45-usb3_double","double_stacked_usb3-usbc"
    jumper -  "header_2x1","header_3x1","header_3x2","header_5x1","header_6x1","header_7x1"
    misc -    "ir_1","bat_hold_1","led_3x1.5","lcd_2.2"
    heatsink -"hc4_oem","c4_oem","c2_oem","c1+_oem","xu4_oem","n1_oem","xu4q_oem","n2_oem","n2+_oem","m1_oem","h2_oem",
               "khadas_oem","khadas_fan_oem","radxa_oem"
    pcie -     "x4"
    jst_ph -   number of pins from 2-16

    
*/

use <sbc_library.scad>

$fn = 90;

// jst_ph class
linear_extrude(height = 2) {translate([-360,-5,0]) rotate([0,0,90]) text("jst_ph", size=8, halign="right");}
jst_ph(-365,18,0,"top",2,1);
linear_extrude(height = 1) {translate([-355,10,0]) text("jst-2",size=5, halign="right");}
jst_ph(-365,38,0,"top",3,1);
linear_extrude(height = 1) {translate([-355,30,0]) text("jst-3",size=5, halign="right");}
jst_ph(-365,58,0,"top",4,1);
linear_extrude(height = 1) {translate([-355,50,0]) text("jst-4",size=5, halign="right");}
jst_ph(-365,78,0,"top",5,1);
linear_extrude(height = 1) {translate([-355,70,0]) text("jst-5",size=5, halign="right");}
jst_ph(-365,98,0,"top",5,1);
linear_extrude(height = 1) {translate([-355,90,0]) text("jst-6",size=5, halign="right");}

// pcie class
linear_extrude(height = 2) {translate([-310,-5,0]) rotate([0,0,90]) text("pcie", size=8, halign="right");}
pcie(-330,18,0,"top","x4",0);
linear_extrude(height = 1) {translate([-310,10,0]) text("x4",size=5, halign="right");}

// memory class
linear_extrude(height = 2) {translate([-210,-5,0]) rotate([0,0,90]) text("memory", size=8, halign="right");}
memory(-220,18,0,"top","emmc",0);
linear_extrude(height = 1) {translate([-210,10,0]) text("emmc",size=5, halign="right");}
memory(-220,55,0,"top","emmc_plug",0);
linear_extrude(height = 1) {translate([-210,45,0]) text("emmc_plug",size=5, halign="right");}
memory(-280,78,0,"top","sodimm_5.2",0);
linear_extrude(height = 1) {translate([-210,67,0]) text("sodimm_5.2",size=5, halign="right");}
memory(-280,100,0,"top","sodimm_9.2",0);
linear_extrude(height = 1) {translate([-210,92,0]) text("sodimm_9.2",size=5, halign="right");}

// switch class
linear_extrude(height = 2) {translate([-178,-5,0]) rotate([0,0,90]) text("switch", size=8, halign="right");}
switch(-185,20,0,"top","slide_4x9",0);
linear_extrude(height = 1) {translate([-190,10,0]) text("slide_4x9",size=5, halign="left");}

// button class
linear_extrude(height = 2) {translate([-145,-5,0]) rotate([0,0,90]) text("button", size=8, halign="right");}
button(-150,20,0,"top","momentary_6x6x4",0);
linear_extrude(height = 1) {translate([-155,10,0]) text("momentary_6x6x4",size=5, halign="left");}
button(-150,40,0,"top","momentary_6x6x9",0);
linear_extrude(height = 1) {translate([-155,32,0]) text("momentary_6x6x9",size=5, halign="left");}
button(-150,65,0,"top","momentary_6x6x4_90",0);
linear_extrude(height = 1) {translate([-155,54,0]) text("momentary_6x6x4_90",size=5, halign="left");}
button(-150,85,0,"top","momentary_4x2x1",0);
linear_extrude(height = 1) {translate([-155,76,0]) text("momentary_4x2x1",size=5, halign="left");}
button(-150,105,0,"top","momentary_7x3x3_90",0);
linear_extrude(height = 1) {translate([-155,96,0]) text("momentary_7x3x3_90",size=5, halign="left");}

// plug class
linear_extrude(height = 2) {translate([-70,-5,0]) rotate([0,0,90]) text("plug", size=8, halign="right");}
plug(-80,20,0,"top","pwr2.5_5x7.5",0);
linear_extrude(height = 1) {translate([-80,10,0]) text("pwr2.5_5x7.5",size=5, halign="left");}
plug(-80,40,0,"top","pwr5.5_7.5x11.5",0);
linear_extrude(height = 1) {translate([-80,32,0]) text("pwr5.5_7.5x11.5",size=5, halign="left");}
plug(-80,70,0,"top","pwr5.5_10x10",0);
linear_extrude(height = 1) {translate([-80,62,0]) text("pwr5.5_10x10",size=5, halign="left");}
plug(-80,97,0,"top","audio_micro",0);
linear_extrude(height = 1) {translate([-80,90,0]) text("audio_micro",size=5, halign="left");}
plug(-80,115,0,"top","rtc_micro",0);
linear_extrude(height = 1) {translate([-80,106,0]) text("rtc_micro",size=5, halign="left");}
plug(-80,130,0,"top","uart_micro",0);
linear_extrude(height = 1) {translate([-80,123,0]) text("uart_micro",size=5, halign="left");}
plug(-80,150,0,"top","small_encl_satapwr",0);
linear_extrude(height = 1) {translate([-80,140,0]) text("small_encl_satapwr",size=5, halign="left");}
plug(-80,175,0,"top","molex_4x1",0);
linear_extrude(height = 1) {translate([-80,165,0]) text("molex_4x1",size=5, halign="left");}

// usb2 class
linear_extrude(height = 2) {translate([-10,-5,0]) rotate([0,0,90]) text("usb2", size=8, halign="right");}
usb2(-20,20,0,"top","micro",0);
linear_extrude(height = 1) {translate([-25,10,0]) text("micro",size=5, halign="left");}
usb2(-20,40,0,"top","single_vertical_a",0);
linear_extrude(height = 1) {translate([-25,32,0]) text("single_vertical_a",size=5, halign="left");}
usb2(-20,80,0,"top","double_stacked_a",0);
linear_extrude(height = 1) {translate([-25,72,0]) text("double_stacked_a",size=5, halign="left");}
usb2(-20,120,0,"top","single_horizontal_a",0);
linear_extrude(height = 1) {translate([-25,112,0]) text("single_horizontal_a",size=5, halign="left");}

// usb3 class
linear_extrude(height = 2) {translate([35,-5,0]) rotate([0,0,90]) text("usb3", size=8, halign="right");}
usb3(25,20,0,"top","double_stacked_a",0);
linear_extrude(height = 1) {translate([5,10,0]) text("double_stacked_a",size=5, halign="left");}
usb3(25,60,0,"top","single_horizontal_a",0);
linear_extrude(height = 1) {translate([5,50,0]) text("single_horizontal_a",size=5, halign="left");}

// usbc class
linear_extrude(height = 2) {translate([65,-5,0]) rotate([0,0,90]) text("usbc", size=8, halign="right");}
usbc(55,20,0,"top","single_horizontal",0);
linear_extrude(height = 1) {translate([40,2,0]) text("usbc_horizontal",size=5, halign="left");}
usbc(55,40,0,"top","single_vertical",0);
linear_extrude(height = 1) {translate([42,32,0]) text("usbc_vertical",size=5, halign="left");}

// network class
linear_extrude(height = 2) {translate([95,-5,0]) rotate([0,0,90]) text("network", size=8, halign="right");}
network(85,20,0,"top","rj45_single",0);
linear_extrude(height = 1) {translate([80,10,0]) text("rj45_single",size=5, halign="left");}

// video class
linear_extrude(height = 2) {translate([125,-5,0]) rotate([0,0,90]) text("video", size=8, halign="right");}
video(120,20,0,"top","hdmi_a",0);
linear_extrude(height = 1) {translate([120,10,0]) text("hdmi_a",size=5, halign="left");}
video(120,50,0,"top","dp-hdmi_a",0);
linear_extrude(height = 1) {translate([120,42,0]) text("dp-hdmi_a",size=5, halign="left");}
video(120,90,0,"top","mipi_csi",0);
linear_extrude(height = 1) {translate([120,82,0]) text("mipi_csi",size=5, halign="left");}
video(120,107,0,"top","mipi_dsi",0);
linear_extrude(height = 1) {translate([120,100,0]) text("mipi_dsi",size=5, halign="left");}
video(120,122,0,"top","hdmi_micro",0);
linear_extrude(height = 1) {translate([120,115,0]) text("hdmi_micro",size=5, halign="left");}
video(120,142,0,"top","dp_mini",0);
linear_extrude(height = 1) {translate([120,135,0]) text("dp_mini",size=5, halign="left");}
video(120,167,0,"top","hdmi_a_vertical",0);
linear_extrude(height = 2) {translate([155,160,0]) text("hdmi_a_vertical", size=5, halign="right");}

// fan class
linear_extrude(height = 2) {translate([160,-5,0]) rotate([0,0,90]) text("fan", size=8, halign="right");}
fan(155,20,0,"top","micro",0);
linear_extrude(height = 1) {translate([155,10,0]) text("micro",size=5, halign="left");}
fan(155,40,0,"top","encl_pmw",0);
linear_extrude(height = 1) {translate([155,32,0]) text("encl_pmw",size=5, halign="left");}
fan(145,65,0,"top","encl_pmw_h",0);
linear_extrude(height = 1) {translate([155,52,0]) text("encl_pmw_h",size=5, halign="left");}

// gpio class
linear_extrude(height = 2) {translate([200,-5,0]) rotate([0,0,90]) text("gpio", size=8, halign="right");}
gpio(195,20,0,"top","encl_header_12",0);
linear_extrude(height = 1) {translate([195,10,0]) text("encl_header_12",size=5, halign="left");}
gpio(195,40,0,"top","encl_header_30",0);
linear_extrude(height = 1) {translate([195,32,0]) text("encl_header_30",size=5, halign="left");}
gpio(195,60,0,"top","header_20",0);
linear_extrude(height = 1) {translate([195,52,0]) text("header_20",size=5, halign="left");}
gpio(195,80,0,"top","header_26",0);
linear_extrude(height = 1) {translate([195,72,0]) text("header_26",size=5, halign="left");}
gpio(195,100,0,"top","header_40",0);
linear_extrude(height = 1) {translate([195,92,0]) text("header_40",size=5, halign="left");}

// audio class
linear_extrude(height = 2) {translate([257,-5,0]) rotate([0,0,90]) text("audio", size=8, halign="right");}
audio(250,20,0,"top","jack_3.5",0);
linear_extrude(height = 1) {translate([250,10,0]) text("jack_3.5",size=5, halign="left");}
audio(250,50,0,"top","out-in-spdif",0);
linear_extrude(height = 1) {translate([250,40,0]) text("out-in-spdif",size=5, halign="left");}

// storage class
linear_extrude(height = 2) {translate([300,-5,0]) rotate([0,0,90]) text("storage", size=8, halign="right");}
storage(295,20,0,"top","sdcard",0);
linear_extrude(height = 1) {translate([295,10,0]) text("sdcard",size=5, halign="left");}
storage(295,40,0,"top","sata_header",0);
linear_extrude(height = 1) {translate([295,32,0]) text("sata_header",size=5, halign="left");}
storage(295,60,0,"top","sata_encl_header",0);
linear_extrude(height = 1) {translate([295,52,0]) text("sata_encl_header",size=5, halign="left");}
storage(295,80,0,"top","m.2_header",0);
linear_extrude(height = 1) {translate([295,72,0]) text("m.2_header",size=5, halign="left");}
storage(305,102,0,"top","m.2_stud",0);
linear_extrude(height = 1) {translate([295,92,0]) text("m.2_stud",size=5, halign="left");}
storage(295,115,0,"top","sata_encl_power",0);
linear_extrude(height = 1) {translate([295,110,0]) text("sata_encl_power",size=5, halign="left");}
storage(295,138,0,"top","sata_power_vrec",0);
linear_extrude(height = 1) {translate([295,130,0]) text("sata_power_vrec",size=5, halign="left");}
storage(295, 157, 0, "top", "microsdcard", 0);
linear_extrude(height = 1) {translate([295,150,0]) text("microsdcard",size=5, halign="left");}

// combo class
linear_extrude(height = 2) {translate([360,-5,0]) rotate([0,0,90]) text("combo", size=8, halign="right");}
combo(350,20,0,"top","rj45-usb2_double",0);
linear_extrude(height = 1) {translate([350,10,0]) text("rj45-usb2_double",size=5, halign="left");}
combo(350,70,0,"top","rj45-usb3_double",0);
linear_extrude(height = 1) {translate([350,60,0]) text("rj45-usb3_double",size=5, halign="left");}
combo(350,120,0,"top","double_stacked_usb3-usbc",0);
linear_extrude(height = 1) {translate([350,110,0]) text("double_stacked_usb3-usbc",size=5, halign="left");}


// jumper class
linear_extrude(height = 2) {translate([415,-5,0]) rotate([0,0,90]) text("jumper", size=8, halign="right");}
jumper(410,20,0,"top","header_2x1",0);
linear_extrude(height = 1) {translate([410,10,0]) text("header_2x1",size=5, halign="left");}
jumper(410,40,0,"top","header_3x1",0);
linear_extrude(height = 1) {translate([410,30,0]) text("header_3x1",size=5, halign="left");}
jumper(410,60,0,"top","header_3x2",0);
linear_extrude(height = 1) {translate([410,50,0]) text("header_3x2",size=5, halign="left");}
jumper(410,80,0,"top","header_5x1",0);
linear_extrude(height = 1) {translate([410,70,0]) text("header_5x1",size=5, halign="left");}
jumper(410,100,0,"top","header_6x1",0);
linear_extrude(height = 1) {translate([410,90,0]) text("header_6x1",size=5, halign="left");}
jumper(410,130,0,"top","header_7x1",0);
linear_extrude(height = 1) {translate([410,120,0]) text("header_7x1",size=5, halign="left");}

// ic class
linear_extrude(height = 2) {translate([460,-5,0]) rotate([0,0,90]) text("ic", size=8, halign="right");}
ic(455,20,0,"top","ic_2.8x2.8",0);
linear_extrude(height = 1) {translate([455,10,0]) text("ic_2.8x2.8",size=5, halign="left");}
ic(455,40,0,"top","ic_3x3",0);
linear_extrude(height = 1) {translate([455,30,0]) text("ic_3x3",size=5, halign="left");}
ic(455,60,0,"top","ic_3.7x3.7",0);
linear_extrude(height = 1) {translate([455,50,0]) text("ic_3.7x3.7",size=5, halign="left");}
ic(455,80,0,"top","ic_4.7x4.7",0);
linear_extrude(height = 1) {translate([455,70,0]) text("ic_4.7x4.7",size=5, halign="left");}
ic(455,100,0,"top","ic_5x5",0);
linear_extrude(height = 1) {translate([455,90,0]) text("ic_5x5",size=5, halign="left");}
ic(455,120,0,"top","ic_5.75x5.75",0);
linear_extrude(height = 1) {translate([455,110,0]) text("ic_5.75x5.75",size=5, halign="left");}
ic(455,140,0,"top","ic_6x6",0);
linear_extrude(height = 1) {translate([455,130,0]) text("ic_6x6",size=5, halign="left");}
ic(455,160,0,"top","ic_6.4x6.4",0);
linear_extrude(height = 1) {translate([455,150,0]) text("ic_6.4x6.4",size=5, halign="left");}
ic(455,180,0,"top","ic_6.75x6.75",0);
linear_extrude(height = 1) {translate([455,170,0]) text("ic_6.75x6.75",size=5, halign="left");}
ic(455,200,0,"top","ic_7x7",0);
linear_extrude(height = 1) {translate([455,190,0]) text("ic_7x7",size=5, halign="left");}
ic(455,220,0,"top","ic_6.7x8.4",0);
linear_extrude(height = 1) {translate([455,210,0]) text("ic_6.7x8.4",size=5, halign="left");}
ic(455,240,0,"top","ic_11x8",0);
linear_extrude(height = 1) {translate([455,230,0]) text("ic_11x8",size=5, halign="left");}
ic(455,260,0,"top","ic_13x8",0);
linear_extrude(height = 1) {translate([455,250,0]) text("ic_13x8",size=5, halign="left");}
ic(455,280,0,"top","ic_13x9",0);
linear_extrude(height = 1) {translate([455,270,0]) text("ic_13x9",size=5, halign="left");}
ic(455,300,0,"top","ic_16x10",0);
linear_extrude(height = 1) {translate([455,290,0]) text("ic_16x10",size=5, halign="left");}

// misc class
linear_extrude(height = 2) {translate([510,-5,0]) rotate([0,0,90]) text("misc", size=8, halign="right");}
misc(500,20,0,"top","ir_1",0);
linear_extrude(height = 1) {translate([500,10,0]) text("ir_1",size=5, halign="left");}
misc(500,40,0,"top","bat_hold_1",0);
linear_extrude(height = 1) {translate([500,30,0]) text("bat_hold_1",size=5, halign="left");}
misc(500,80,0,"top","led_3x1.5",0);
linear_extrude(height = 1) {translate([500,70,0]) text("led_3x1.5",size=5, halign="left");}
misc(500,100,0,"top","lcd_2.2",0);
linear_extrude(height = 1) {translate([500,90,0]) text("lcd_2.2",size=5, halign="left");}

// heatsink class
linear_extrude(height = 2) {translate([570,-5,0]) rotate([0,0,90]) text("heatsink", size=8, halign="right");}
heatsink(550,42,0,"top","c1+_oem",1,1);
linear_extrude(height = 1) {translate([540,10,0]) text("c1+_oem/c2_oem/c4_oem/hc4_oem",size=5, halign="left");}
heatsink(550,96,0,"top","xu4_oem",1,1);
linear_extrude(height = 1) {translate([555,60,0]) text("xu4_oem/n1",size=5, halign="left");}
heatsink(605,96,0,"top","40mm_active",1,1);
linear_extrude(height = 1) {translate([605,60,0]) text("40mm_active",size=5, halign="left");}
heatsink(550,155,0,"top","xu4q_oem",1,1);
linear_extrude(height = 1) {translate([555,118,0]) text("xu4q_oem",size=5, halign="left");}
heatsink(550,200,0,"top","n2_oem",1,1);
linear_extrude(height = 1) {translate([555,185,0]) text("n2_oem",size=5, halign="left");}
heatsink(550,315,0,"top","n2+_oem",1,1);
linear_extrude(height = 1) {translate([555,300,0]) text("n2+_oem",size=5, halign="left");}
heatsink(660,200,0,"top","m1_oem",1,1);
linear_extrude(height = 1) {translate([660,185,0]) text("m1_oem",size=5, halign="left");}
heatsink(565,430,0,"top","h2_oem",1,1);
linear_extrude(height = 1) {translate([555,410,0]) text("h2_oem",size=5, halign="left");}
heatsink(540,510,0,"top","khadas_oem",1,1);
linear_extrude(height = 1) {translate([555,507,0]) text("khadas_oem",size=5, halign="left");}
heatsink(630,510,0,"top","khadas_fan_oem",1,1);
linear_extrude(height = 1) {translate([645,507,0]) text("khadas_fan_oem",size=5, halign="left");}
heatsink(540,575,0,"top","radxa_oem",1,1);
linear_extrude(height = 1) {translate([555,568,0]) text("radxa_oem",size=5, halign="left");}