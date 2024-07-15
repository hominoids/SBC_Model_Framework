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

    cm(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask)
    cm_holder(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask)

*/

/*

     CLASS NAME: cm
    DESCRIPTION: creates compute modules as library components
           TODO: CM1,CM3,CM4S SOC location

          USAGE: cm(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                    type = "cm1","cm3","cm3l","cm4s","cm4","cm4l","jetsonnano","soedge"
                   loc_x = x location placement
                   loc_y = y location placement
                   loc_z = z location placement
                    side = "top", "bottom"
              rotation[] = object rotation
                 data[0] = fan size
                 data[1] = cm pcb color
               pcbsize_z = pcb thickness
              enablemask = true produces mask, false produces model
                 mask[0] = true enables component mask
                 mask[1] = mask length
                 mask[2] = mask setback
                 mask[3] = mstyle "default"


     CLASS NAME: cm_holder
    DESCRIPTION: creates compute module holder
           TODO: "cm1","cm3","cm3l","cm4s"

          USAGE: cm_holder(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                           type = "jetsonnano"
                          loc_x = x location placement
                          loc_y = y location placement
                          loc_z = z location placement
                           side = "top", "bottom"
                     rotation[] = object rotation
                        data[0] = cm pcb color
                      pcbsize_z = pcb thickness
                     enablemask = true produces mask, false produces model
                        mask[0] = true enables component mask
                        mask[1] = mask length
                        mask[2] = mask setback
                        mask[3] = mstyle "default"


*/

module cm(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    fsize = data[0];
    pcbcolor = data[1];
    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];
    size_x = 67.6;
    size_y = type == "cm1" ? 30 : 31;
    size_z = 1;
    $fn=90;

    if(type == "cm1" || type == "cm3" || type == "cm3l" || type == "cm3+" || type == "cm4s") {

        if(enablemask == true && cmask == true && mstyle == "default") {

        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {  
                    difference () {
                        union() {
                            color(pcbcolor) cube([size_x,size_y,size_z]);
                            color("#fee5a6") translate([3, 27, .99]) cylinder(d=5, h=.2);
                            color("#fee5a6") translate([3, 27, -.01]) cylinder(d=5, h=.2);
                            color("#fee5a6") translate([64.6, 27, .99]) cylinder(d=5, h=.2);
                            color("#fee5a6") translate([64.6, 27, -.01]) cylinder(d=5,h =.2);
                        }
                        color(pcbcolor) translate([15.75+.5, -1, -1]) rotate([0, 0, 90]) slot(1, 5, 3);
                        color(pcbcolor) translate([0, 21, -1]) cylinder(d=3, h=3);
                        color(pcbcolor) translate([size_x, 21, -1]) cylinder(d=3, h=3);
                        color(pcbcolor) translate([3, 27, -1]) cylinder(d=2.3, h=3);
                        color(pcbcolor) translate([64.6, 27, -1]) cylinder(d=2.3, h=3);
                    }
                    for (i=[0:.5:14.5]) {
                        color("#fee5a6") translate ([i+.5, 0, -.24]) cube([.25, 2, .25]);
                        color("#fee5a6") translate ([i+.5, 0, .99]) cube([.25, 2, .25]);
                    }
                    for (i=[16.75:.5:66.5]) {
                        color("#fee5a6") translate ([i+.5, 0, -.24]) cube([.25, 2, .25]);
                        color("#fee5a6") translate ([i+.5, 0, .99]) cube([.25, 2, .25]);
                    }
                }
        }
    }
    if(type == "cm4" || type == "cm4l") {

        pcbcolor = data[1];
        size_x = 55;
        size_y = 40;
        size_z = 1.2;

        if(enablemask == true && cmask == true && mstyle == "default") {

        }
        if(enablemask == false) {

                place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {  
                    difference () {
                        union() {
                            color(pcbcolor) slab([size_x, size_y, size_z],3);
                            color("#fee5a6") translate([3.5, 3.5, -.01]) cylinder(d=5, h=size_z+.2);
                            color("#fee5a6") translate([3.5, size_y-3.5, -.01]) cylinder(d=5, h=size_z+.2);
                            color("#fee5a6") translate([size_x-3.5, 3.5, -.01]) cylinder(d=5, h=size_z+.2);
                            color("#fee5a6") translate([size_x-3.5, size_y-3.5, -.01]) cylinder(d=5, h=size_z+.2);
                        }
                        //color(pcbcolor) translate([-1, 18.5, -1]) cube([7.5, 11, 3]);
                        color(pcbcolor) translate([2.56, 31, -1]) cylinder(d=1.5, h=3);
                        color(pcbcolor) translate([3.5, 3.5, -1]) cylinder(d=2.5, h=3);
                        color(pcbcolor) translate([3.5, size_y-3.5, -1]) cylinder(d=2.5, h=3);
                        color(pcbcolor) translate([size_x-3.5, 3.5, -1]) cylinder(d=2.5, h=3);
                        color(pcbcolor) translate([size_x-3.5, size_y-3.5, -1]) cylinder(d=2.5, h=3);
                    }
                    pcbsoc("raised", 25, 10, 0, "top", 0, [13,13,1.25], data, size_z, false, [false,10,2,"default"]);
                    if(type == "cm4") {
                        ic("generic", 20.9, 27, 0, "top", 0, [13, 11.75, .8], ["dimgrey"], size_z, false, [false,10,2,"default"]);
                    }
                    ic("generic", 42.5, 9.5, 0, "top", 0, [10, 15, .8], ["dimgrey"], size_z, false, [false,10,2,"default"]);
                    ic("generic", 38, 30.5, 0, "top", 0, [7, 7, 1.5], ["dimgrey"], size_z, false, [false,10,2,"default"]);
                    ic("generic", 4.5, 9.25, 0, "top", 0, [5.25, 5.25, .8], ["dimgrey"], size_z, false, [false,10,2,"default"]);
                    ic("generic", 8.75, 21, 0, "top", 0, [11, 14, .8], ["dimgrey"], size_z, false, [false,10,2,"default"]);
                    antenna("ipex", 1.315, 29.675, 0, "top", 0, [0,0,0], [0], size_z, false, [false,10,2,"default"]);
                }
        }
    }

    if(type == "jetsonnano") {

        size_x = 70;
        size_y = 45;

        if(enablemask == true && cmask == true) {

            size_x = 58;
            size_y = 40;

            if(mstyle == "open" || mstyle == "default") {

                xoffset = 6.5;
                yoffset = 4.5;
                zoffset = 9.5;
                size_xm = 60;
                size_ym = 42;

                if(side == "top" && rotation == 0) {
                    place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([xoffset-(size_xm-size_x)/2, yoffset-(size_ym-size_y)/2, zoffset-back]) cube([size_xm, size_ym, mlen]);
                }
            }
            if(mstyle == "fan_open" || mstyle == "fan_1" || mstyle == "fan_2" || mstyle == "fan_hex") {

                xoffset = 16.25;
                yoffset = 6;
                zoffset = 26.5;
                size_xm = 60;
                size_ym = 42;

                place(loc_x, loc_y, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([(40-fsize)/2+xoffset-(size_xm-size_x)/2, (40-fsize)/2+yoffset-(size_ym-size_y)/2, zoffset-back]) 
                        heatsink_mask(fsize, mlen, mstyle);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {

                    color("#151515") translate([0, 0, 7]) cube([size_x, size_y, 1.4]);
                    color("black") translate([37, -1, 6]) cube([1, 5, 4]);
                    color("dimgray") translate([-1, 18, 6]) cube([3, 4, 4]);
                    color("dimgray") translate([size_x-2, 18, 6]) cube([3, 4, 4]);
                    color("dimgray") translate([size_x-3, size_y-3, 6]) cylinder(d=3, h=3);
                    color("dimgray") translate([3, size_y-3, 6]) cylinder(d=3, h=3);

                }
                for (i=[2:.5:36]) {
                    color("gold") translate ([i+.5, 0, 6.8]) cube([.25, 2, .25]);
                    color("gold") translate ([i+.5, 0, 8.4]) cube([.25, 2, .25]);
                }
                for (i=[37.5:.5:67]) {
                    color("gold") translate ([i+.5, 0, 6.8]) cube([.25, 2, .25]);
                    color("gold") translate ([i+.5, 0, 8.4]) cube([.25, 2, .25]);
                }
                color("dimgrey") translate([20, 13, 8.3]) cube([14, 14, 1.2]);
                difference() {
                    color("black") translate([6.5, 4.5, 9.5]) cube([58, 40, 16]);
                    color("dimgrey") translate([0, 25.375, 13.5]) rotate([90, 2.5, 90]) linear_extrude(70) {
                        polygon(points = [[0,0], [-.5,13], [4,13], [3.5,0]]);}
                    color("dimgrey") translate([0, 20.675, 13.5]) rotate([90, -2.5, 90]) linear_extrude(70) {
                        polygon(points = [[0,0], [-.5,13], [4,13], [3.5,0]]);}
                    color("dimgrey") translate([0, 30.5, 13.5]) rotate([90, 5, 90]) linear_extrude(70) {
                        polygon(points = [[0,0], [-.5,13], [4,13], [3.5,0]]);}
                    color("dimgrey") translate([0, 15.25, 13.5]) rotate([90, -5, 90]) linear_extrude(70) {
                        polygon(points = [[0,0], [-.5,13], [4,13], [3.5,0]]);}
                    color("dimgrey") translate([0, 35, 13.5]) rotate([90, 10, 90]) linear_extrude(70) {
                        polygon(points = [[0,0], [-.5,10.5], [4,10.5], [3.5,0]]);}
                    color("dimgrey") translate([0, 10.5, 13]) rotate([90, -10, 90]) linear_extrude(70) {
                        polygon(points = [[0,0], [-.5,10.5], [4,10.5], [3.5,0]]);}
                    color("dimgrey") translate([0, 36.5, 20]) cube([70, 10, 4]);
                    color("dimgrey") translate([0, 1.5, 20]) cube([70, 10, 4]);
                    color("dimgrey") translate([0, 39.5, 13]) rotate([90, 10, 90]) linear_extrude(70) {
                        polygon(points = [[0,0], [0,10.5], [3,10.5], [3,0]]);}
                    color("dimgrey") translate([0, 6.5, 12.5]) rotate([90, -10, 90]) linear_extrude(70) {
                        polygon(points = [[0,0], [0,10.5], [3,10.5], [3,0]]);}
                    color("dimgrey") translate([19, 9, 22]) cylinder(d=3, h=5);
                    color("dimgrey") translate([51, 9, 22]) cylinder(d=3, h=5);
                    color("dimgrey") translate([19, 41, 22]) cylinder(d=3, h=5);
                    color("dimgrey") translate([51, 41, 22]) cylinder(d=3, h=5);

                }
                difference() {
                    union() {
                        color("silver") translate([size_x-3, size_y-3, 0]) cylinder(d=5.2, h=7, $fn=6);
                        color("silver") translate([3, size_y-3, 0]) cylinder(d=5.2, h=7, $fn=6);
                    }
                    color("silver") translate([size_x-3, size_y-3, -.1]) cylinder(d=3, h=13);
                    color("silver") translate([3, size_y-3, -.1]) cylinder(d=3, h=13);
                }
            }
        }
    }


    if(type == "soedge") {

        if(enablemask == true && cmask == true && mstyle == "default") {

        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {  
                    difference () {
                        color(pcbcolor) cube([size_x,size_y,size_z]);
                        color(pcbcolor) translate([15.75+.5, -1, -1]) rotate([0, 0, 90]) slot(1, 5, 3);
                        color(pcbcolor) translate([0, 21, -1]) cylinder(d=3, h=3);
                        color(pcbcolor) translate([size_x, 21, -1]) cylinder(d=3, h=3);
                    }
                    for (i=[0:.5:14.5]) {
                        color("#fee5a6") translate ([i+.5, 0, -.24]) cube([.25, 2, .25]);
                        color("#fee5a6") translate ([i+.5, 0, .99]) cube([.25, 2, .25]);
                    }
                    for (i=[16.75:.5:66.5]) {
                        color("#fee5a6") translate ([i+.5, 0, -.24]) cube([.25, 2, .25]);
                        color("#fee5a6") translate ([i+.5, 0, .99]) cube([.25, 2, .25]);
                    }
                    ic("generic", 28.5, 9.5, 0, "top", 0, [14.5, 14.5, .8], ["dimgrey"], size_z, false, [false,10,2,"default"]);
                    ic("generic", 47.5, 6, 0, "top", 0, [13.5, 8.5, .8], ["dimgrey"], size_z, false, [false,10,2,"default"]);
                    ic("generic", 47.5, 18, 0, "top", 0, [13.5, 8.5, .8], ["dimgrey"], size_z, false, [false,10,2,"default"]);
                    ic("generic", 8.5, 14, 0, "top", 0, [7, 7, .8], ["dimgrey"], size_z, false, [false,10,2,"default"]);
                    button("momentary_4x2x1", 22.5, 26.5, 0, "top", 0, [7, 7, .8], ["0"], size_z, false, [false,10,2,"default"]);
                    memory("emmc_plug", 18, 26.5, 0, "bottom", 0, [7, 7, .8], ["0"], size_z, false, [false,10,2,"default"]);
                }
        }
    }

}



module cm_holder(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    // jetson nano
    if(type == "jetsonnano") {
        size_x = 73;
        size_y = 6.5;
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference () {
                color("dimgray") cube([size_x, size_y, 9.2]);
                color("dimgray") translate([1.5, -1, 5.7]) cube([70, 3, 5]);
                color("dimgray") translate([3.5, -1, 5.7]) cube([28.5, 5.25, .92]);
                color("dimgray") translate([34.5, -1, 5.7]) cube([35, 5.25, .92]);
            }
            for (i=[2:.5:31]) {
                color("gold") translate ([i+.5, 2, 5.7]) cube([.25, 2, .25]);
            }
            for (i=[34:.5:69]) {
                color("gold") translate ([i+.5, 2, 5.7]) cube([.25, 2, .25]);
            }
        }
    }
}

