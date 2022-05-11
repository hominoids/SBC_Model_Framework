/*
    SBC Library Copyright 2016,2017,2018,2019 Edward A. Kisiel
    hominoid @ www.forum.odroid.com

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
                        memory  - emmc, emmc_plug, sodimm_5.2, sodimm_9.2
                        switch - slide_4x9
                        button - momentary_6x6x9, momentary_6x6x4
                        plug - pwr5.5_7.5x11.5, pwr2.5_5x7.5, rtc_micro, uart_micro, molex_4x1, small_encl_satapwr
                        usb2 - single_vert_a, double_stacked_a, micro
                        usb3 - double_stacked_a
                        network - rj45_single
                        video - hdmi_a, dp-hdmi_a
                        fan - micro, encl_pmw
                        gpio - encl_header_30, encl_header_12, header_40, header_20
                        ic - ic_2.8x2.8, ic_4.7x4.7, ic_5x5, ic_5.75x5.75, ic_6x6, ic_6.75x6.75, ic_7x7, ic_6.7x8.4, ic_11x8, ic_13x8
                        audio - out-in-spdif
                        storage - sata_header, sata_encl_power, sata_encl_header, m.2_header, sdcard
                        combo - rj45-usb2_double, rj45-usb3_double
                        jumper - header_2x1, header_7x1
                        misc - ir_1

*/

use <sbc_library.scad>

linear_extrude(height = 2) {translate([-210,-5,0]) rotate([0,0,90]) text("memory", size=8, halign="right");}
memory(-220,18,0,"top","emmc",0);
linear_extrude(height = 1) {translate([-210,10,0]) text("emmc",size=5, halign="right");}
memory(-220,55,0,"top","emmc_plug",0);
linear_extrude(height = 1) {translate([-210,45,0]) text("emmc_plug",size=5, halign="right");}
memory(-280,78,0,"top","sodimm_5.2",0);
linear_extrude(height = 1) {translate([-210,67,0]) text("sodimm_5.2",size=5, halign="right");}
memory(-280,100,0,"top","sodimm_9.2",0);
linear_extrude(height = 1) {translate([-210,92,0]) text("sodimm_9.2",size=5, halign="right");}


linear_extrude(height = 2) {translate([-178,-5,0]) rotate([0,0,90]) text("switch", size=8, halign="right");}
switch(-185,20,0,"top","slide_4x9",0);
linear_extrude(height = 1) {translate([-190,10,0]) text("slide_4x9",size=5, halign="left");}

linear_extrude(height = 2) {translate([-145,-5,0]) rotate([0,0,90]) text("button", size=8, halign="right");}
button(-150,20,0,"top","momentary_6x6x4",0);
linear_extrude(height = 1) {translate([-155,10,0]) text("momentary_6x6x4",size=5, halign="left");}
button(-150,40,0,"top","momentary_6x6x9",0);
linear_extrude(height = 1) {translate([-155,32,0]) text("momentary_6x6x9",size=5, halign="left");}

linear_extrude(height = 2) {translate([-70,-5,0]) rotate([0,0,90]) text("plug", size=8, halign="right");}
plug(-80,20,0,"top","pwr2.5_5x7.5",0);
linear_extrude(height = 1) {translate([-80,10,0]) text("pwr2.5_5x7.5",size=5, halign="left");}
plug(-80,40,0,"top","pwr5.5_7.5x11.5",0);
linear_extrude(height = 1) {translate([-80,32,0]) text("pwr5.5_7.5x11.5",size=5, halign="left");}
plug(-80,70,0,"top","rtc_micro",0);
linear_extrude(height = 1) {translate([-80,62,0]) text("rtc_micro",size=5, halign="left");}
plug(-80,90,0,"top","uart_micro",0);
linear_extrude(height = 1) {translate([-80,82,0]) text("uart_micro",size=5, halign="left");}
plug(-80,110,0,"top","small_encl_satapwr",0);
linear_extrude(height = 1) {translate([-80,102,0]) text("small_encl_satapwr",size=5, halign="left");}
plug(-80,135,0,"top","molex_4x1",0);
linear_extrude(height = 1) {translate([-80,126,0]) text("molex_4x1",size=5, halign="left");}

linear_extrude(height = 2) {translate([-10,-5,0]) rotate([0,0,90]) text("usb2", size=8, halign="right");}
usb2(-20,20,0,"top","micro",0);
linear_extrude(height = 1) {translate([-20,10,0]) text("micro",size=5, halign="left");}
usb2(-20,40,0,"top","single_vert_a",0);
linear_extrude(height = 1) {translate([-20,32,0]) text("single_vert_a",size=5, halign="left");}
usb2(-20,80,0,"top","double_stacked_a",0);
linear_extrude(height = 1) {translate([-20,72,0]) text("double_stacked_a",size=5, halign="left");}

linear_extrude(height = 2) {translate([35,-5,0]) rotate([0,0,90]) text("usb3", size=8, halign="right");}
usb3(25,20,0,"top","double_stacked_a",0);
linear_extrude(height = 1) {translate([20,10,0]) text("double_stacked_a",size=5, halign="left");}

linear_extrude(height = 2) {translate([95,-5,0]) rotate([0,0,90]) text("network", size=8, halign="right");}
network(85,20,0,"top","rj45_single",0);
linear_extrude(height = 1) {translate([80,10,0]) text("rj45_single",size=5, halign="left");}

linear_extrude(height = 2) {translate([125,-5,0]) rotate([0,0,90]) text("video", size=8, halign="right");}
video(120,20,0,"top","hdmi_a",0);
linear_extrude(height = 1) {translate([120,10,0]) text("hdmi_a",size=5, halign="left");}
video(120,50,0,"top","dp-hdmi_a",0);
linear_extrude(height = 1) {translate([120,42,0]) text("dp-hdmi_a",size=5, halign="left");}

linear_extrude(height = 2) {translate([160,-5,0]) rotate([0,0,90]) text("fan", size=8, halign="right");}
fan(155,20,0,"top","micro",0);
linear_extrude(height = 1) {translate([155,10,0]) text("micro",size=5, halign="left");}
fan(155,40,0,"top","encl_pmw",0);
linear_extrude(height = 1) {translate([155,32,0]) text("encl_pmw",size=5, halign="left");}

linear_extrude(height = 2) {translate([200,-5,0]) rotate([0,0,90]) text("gpio", size=8, halign="right");}
gpio(195,20,0,"top","encl_header_12",0);
linear_extrude(height = 1) {translate([195,10,0]) text("encl_header_12",size=5, halign="left");}
gpio(195,40,0,"top","encl_header_30",0);
linear_extrude(height = 1) {translate([195,32,0]) text("encl_header_30",size=5, halign="left");}
gpio(195,60,0,"top","header_20",0);
linear_extrude(height = 1) {translate([195,52,0]) text("header_20",size=5, halign="left");}
gpio(195,80,0,"top","header_40",0);
linear_extrude(height = 1) {translate([195,72,0]) text("header_40",size=5, halign="left");}

linear_extrude(height = 2) {translate([257,-5,0]) rotate([0,0,90]) text("audio", size=8, halign="right");}
audio(250,20,0,"top","out-in-spdif",0);
linear_extrude(height = 1) {translate([250,10,0]) text("out-in-spdif",size=5, halign="left");}
audio(250,40,0,"top","jack_3.5",0);
linear_extrude(height = 1) {translate([250,30,0]) text("jack_3.5",size=5, halign="left");}

linear_extrude(height = 2) {translate([300,-5,0]) rotate([0,0,90]) text("storage", size=8, halign="right");}
storage(295,20,0,"top","sdcard",0);
linear_extrude(height = 1) {translate([295,10,0]) text("sdcard",size=5, halign="left");}
storage(295,40,0,"top","sata_header",0);
linear_extrude(height = 1) {translate([295,32,0]) text("sata_header",size=5, halign="left");}
storage(295,60,0,"top","sata_encl_header",0);
linear_extrude(height = 1) {translate([295,52,0]) text("sata_encl_header",size=5, halign="left");}
storage(295,80,0,"top","m.2_header",0);
linear_extrude(height = 1) {translate([295,72,0]) text("m.2_header",size=5, halign="left");}
storage(295,100,0,"top","sata_encl_power",0);
linear_extrude(height = 1) {translate([295,92,0]) text("sata_encl_power",size=5, halign="left");}

linear_extrude(height = 2) {translate([360,-5,0]) rotate([0,0,90]) text("combo", size=8, halign="right");}
combo(350,20,0,"top","rj45-usb2_double",0);
linear_extrude(height = 1) {translate([350,10,0]) text("rj45-usb2_double",size=5, halign="left");}
combo(350,70,0,"top","rj45-usb3_double",0);
linear_extrude(height = 1) {translate([350,60,0]) text("srj45-usb3_double",size=5, halign="left");}

linear_extrude(height = 2) {translate([415,-5,0]) rotate([0,0,90]) text("jumper", size=8, halign="right");}
jumper(410,20,0,"top","header_2x1",0);
linear_extrude(height = 1) {translate([410,10,0]) text("header_2x1",size=5, halign="left");}
jumper(410,40,0,"top","header_7x1",0);
linear_extrude(height = 1) {translate([410,32,0]) text("header_7x1",size=5, halign="left");}

linear_extrude(height = 2) {translate([460,-5,0]) rotate([0,0,90]) text("misc", size=8, halign="right");}
misc(455,20,0,"top","ir_1",0);
linear_extrude(height = 1) {translate([455,10,0]) text("ir_1",size=5, halign="left");}

linear_extrude(height = 2) {translate([480,-5,0]) rotate([0,0,90]) text("ic", size=8, halign="right");}
ic(475,20,0,"top","ic_2.8x2.8",0);
linear_extrude(height = 1) {translate([475,10,0]) text("ic_2.8x2.8",size=5, halign="left");}
ic(475,40,0,"top","ic_3x3",0);
linear_extrude(height = 1) {translate([475,30,0]) text("ic_3x3",size=5, halign="left");}
ic(475,60,0,"top","ic_3.7x3.7",0);
linear_extrude(height = 1) {translate([475,50,0]) text("ic_3.7x3.7",size=5, halign="left");}
ic(475,80,0,"top","ic_4.7x4.7",0);
linear_extrude(height = 1) {translate([475,70,0]) text("ic_4.7x4.7",size=5, halign="left");}
ic(475,100,0,"top","ic_5x5",0);
linear_extrude(height = 1) {translate([475,90,0]) text("ic_5x5",size=5, halign="left");}
ic(475,120,0,"top","ic_5.75x5.75",0);
linear_extrude(height = 1) {translate([475,110,0]) text("ic_5.75x5.75",size=5, halign="left");}
ic(475,140,0,"top","ic_6x6",0);
linear_extrude(height = 1) {translate([475,130,0]) text("ic_6x6",size=5, halign="left");}
ic(475,160,0,"top","ic_6.4x6.4",0);
linear_extrude(height = 1) {translate([475,150,0]) text("ic_6.4x6.4",size=5, halign="left");}
ic(475,180,0,"top","ic_6.75x6.75",0);
linear_extrude(height = 1) {translate([475,170,0]) text("ic_6.75x6.75",size=5, halign="left");}
ic(475,200,0,"top","ic_7x7",0);
linear_extrude(height = 1) {translate([475,190,0]) text("ic_7x7",size=5, halign="left");}
ic(475,220,0,"top","ic_6.7x8.4",0);
linear_extrude(height = 1) {translate([475,210,0]) text("ic_6.7x8.4",size=5, halign="left");}
ic(475,240,0,"top","ic_11x8",0);
linear_extrude(height = 1) {translate([475,230,0]) text("ic_11x8",size=5, halign="left");}
ic(475,260,0,"top","ic_13x8",0);
linear_extrude(height = 1) {translate([475,250,0]) text("ic_13x8",size=5, halign="left");}