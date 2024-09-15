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


     CLASS NAME: video
    DESCRIPTION: creates video connectors.
           TODO: dp_horizontal, correct dp_vertical

          USAGE: video(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                       type = "hdmi_a", "hdmi_a_vertical", "dp-hdmi_a", "hdmi_micro", "hdmi_mini", "dp_vertical",
                              "dp_mini"
                      loc_x = x location placement
                      loc_y = y location placement
                      loc_z = z location placement
                       side = "top", "bottom"
                 rotation[] = object rotation
                  pcbsize_z = pcb thickness
                 enablemask = true produces mask, false produces model
                    mask[0] = true enables component mask
                    mask[1] = mask length
                    mask[2] = mask setback
                    mask[3] = mstyle "default"

*/
 
// video class
module video(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];

    // hdmi a type connector
    if(type == "hdmi_a") {

        size_x = 14.5;
        size_y = 11.5;
        size_xm = mstyle == "thruwall" ? 16 : 15;
        size_ym = mlen;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // hdmi opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.5, loc_y+back-size_ym/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a",mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back-size_ym/2, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a",mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y-back-(size_ym-size_y)+size_ym/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a",mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-back-(size_ym-size_y)+size_ym/2, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a",mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y+back-size_ym/2, loc_z, size_xm, size_ym, rotation,side, pcbsize_z) hdmi_open("hdmi_a",mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back-(size_ym-size_y)+size_ym/2, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a",mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.5, loc_y-back-(size_ym-size_y)+size_ym/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a",mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back-size_ym/2, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a",mlen);
            }
        }
        if(enablemask == true && cmask == true && mstyle == "thruwall") {
            // hdmi opening
            if(side == "top" && rotation == 0) {
                place(loc_x-1, loc_y+back-size_ym/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a_thruwall",mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back-size_ym/2, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a_thruwall",mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y-back-(size_ym-size_y)+size_ym/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a_thruwall",mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-back-(size_ym-size_y)+size_ym/2, loc_y-1, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a_thruwall",mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y+back-size_ym/2, loc_z, size_xm, size_ym, rotation,side, pcbsize_z) hdmi_open("hdmi_a_thruwall",mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back-(size_ym-size_y)+size_ym/2, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a_thruwall",mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-1, loc_y-back-(size_ym-size_y)+size_ym/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a_thruwall",mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back-size_ym/2, loc_y-1, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_a_thruwall",mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            translate([0, 0, .75])
            union() {
                difference() {
                    color("silver") cube([size_x, size_y, 5.5]);
                    color("dimgray") translate([.5, -.1, .5]) cube([13.5, 11, 4.5]);
                    color("silver") translate([0, -.1, 0]) rotate ([-90, 0, 0])
                        cylinder(d=4, h=13.5, $fn=30);
                    color("silver") translate([14.5, -.1, 0]) rotate ([-90, 0, 0])
                        cylinder(d=4, h=13.5, $fn=30);
                }
                difference() {
                    union() {
                        color("silver") translate([0, -.1, 0]) rotate ([-90, 0, 0])
                        cylinder(d=4, h=11.5, $fn=30);
                        color("silver") translate([14.5, -.1, 0]) rotate ([-90, 0, 0])
                        cylinder(d=4, h=11.5, $fn=30);
                    }
                    color("silver") translate([0, -.2, 0]) rotate ([-90, 0, 0])
                        cylinder(d=3, h=13.5, $fn=30);
                    color("silver") translate([14.5, -.2, 0]) rotate ([-90, 0, 0])
                        cylinder(d=3, h=13.5, $fn=30);
                    color("silver") translate([-3, -1, -3]) cube([3, 13.5, 7.5]);
                    color("silver") translate([14.5, -1, -3]) cube([3, 13.5, 7.5]);
                    color("silver") translate([-1, -1, -3]) cube([16.5, 13.5, 3]);
                    }
                color("black") translate([2.5, .5, 2.25]) cube([9.25, 10.5, 1.5]);
            }
        }
    }

    // hdmi a type connector
    if(type == "hdmi_a_vertical") {

        size_x = 14.5;
        size_y = 11.5;
        size_xm = 15;
        size_ym = mlen;
        height = 1.75;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // hdmi vertical opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.5, loc_y+back-size_ym/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([-.25, 0, size_xm+height]) rotate([0, 90, 0]) hdmi_open("hdmi_a",mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back-size_ym/2, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) 
                    translate([-.25, 0, size_xm+height]) rotate([0, 90, 0]) hdmi_open("hdmi_a",mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y-back-(size_ym-size_y)+size_ym/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([-.25, 0, size_xm+height]) rotate([0, 90, 0]) hdmi_open("hdmi_a",mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-back-(size_ym-size_y)+size_ym/2, loc_y-.5, loc_z,size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([-.25, 0, size_xm+height]) rotate([0, 90, 0]) hdmi_open("hdmi_a",mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y+back-size_ym/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) 
                    translate([-.25, 0, size_xm+height]) rotate([0, 90, 0]) hdmi_open("hdmi_a",mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back-(size_ym-size_y)+size_ym/2, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([-.25, 0, size_xm+height]) rotate([0, 90, 0]) hdmi_open("hdmi_a",mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.5, loc_y-back-(size_ym-size_y)+size_ym/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([-.25, 0, size_xm+height]) rotate([0, 90, 0]) hdmi_open("hdmi_a",mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back-size_ym/2, loc_y-.5, loc_z,size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([-.25, 0, size_xm+height]) rotate([0, 90, 0]) hdmi_open("hdmi_a",mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            translate([0, 0, size_x+height]) rotate([0, 90, 0])
            union() { 
                difference() {
                    color("silver") cube([size_x, size_y, 5.5]);
                    color("dimgray") translate([.5, -.1, .5]) cube([13.5, 11, 4.5]);
                    color("silver") translate([0, -.1, 0]) rotate ([-90, 0, 0]) 
                        cylinder(d=4, h=13.5, $fn=30);
                    color("silver") translate([14.5, -.1, 0]) rotate ([-90, 0, 0]) 
                        cylinder(d=4, h=13.5, $fn=30);
                }
                difference() {
                    union() {
                        color("silver") translate([0, -.1, 0]) rotate ([-90, 0, 0])
                        cylinder(d=4, h=11.5, $fn=30);
                        color("silver") translate([14.5, -.1, 0]) rotate ([-90, 0, 0])
                        cylinder(d=4, h=11.5, $fn=30);
                    }               
                    color("silver") translate([0, -.2, 0]) rotate ([-90, 0, 0])
                        cylinder(d=3, h=13.5, $fn=30);
                    color("silver") translate([14.5, -.2, 0]) rotate ([-90, 0, 0])
                        cylinder(d=3, h=13.5, $fn=30);
                    color("silver") translate([-3, -1, -3]) cube([3, 13.5, 7.5]);
                    color("silver") translate([14.5, -1, -3]) cube([3, 13.5, 7.5]);
                    color("silver") translate([-1, -1, -3]) cube([16.5, 13.5, 3]);
                    }
                difference() {
                    color("silver") translate([0, 6, 0]) cube([15, 15.75, 5.5]);
                    color("silver") translate([-6, 6, -.25]) rotate([0, 0, 45]) cube([25, 10, 6]);
                }
                color("silver") translate([14.5, 4, 1.75]) cube([height, 17.75, 3.75]);
                color("black") translate([2.5, .5, 2.25]) cube([9.25, 10.5, 1.5]);
            }
        }
    }

    // display port and hdmi stacked
    if(type == "dp-hdmi_a") {

        size_x = 18;
        size_y = 17.75;
        size_xm = 19;
        size_ym = 18;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // dp-hdmi_a opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.5, loc_y-mlen+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, 19.25]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-mlen+back, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, 19.25]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.5, loc_y+mlen-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, 19.25]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+mlen-back, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, 19.25]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.5, loc_y-mlen+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, 19.25]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+mlen-back, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, 19.25]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.5, loc_y+mlen-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, 19.25]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-mlen+back, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, 19.25]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference() {
                    color("silver") translate([0, 0, 0]) cube([size_x, size_y, 19]);
//                        translate([2, -.7, 1.5]) color("dimgray") cube([14.5, 11.5, 5.5]);
//                        translate([1.75, -.7, 1.5]) color("dimgray") hdmi_open("hdmi_a",16);
                    translate([1.75, -.7, 1.5]) {
                        union() {
                            difference() {
                                color("silver") cube([14.5, 11.5, 5.5]);
                                color("silver") translate([-.25, -.1, -.25]) rotate ([-90, 0, 0])
                                    cylinder(d=4, h=13.5, $fn=30);
                                color("silver") translate([15, -.1, -.25]) rotate ([-90, 0, 0])
                                    cylinder(d=4, h=13.5, $fn=30);
                            }
                        }
                    }
                    translate([1.5, -.7, 12.5]) color("dimgray") cube([15, 17.5, 5.5]);
                }         
                translate([1.75,-.7,1.5]){
                    union() {
                        difference() {
                            color("silver") cube([14.5, 11.5, 5.5]);
                            color("dimgray") translate([.5, -.1, .5]) cube([13.5, 11, 4.5]);
                            color("silver") translate([0, -.1, 0]) rotate ([-90, 0, 0])
                                cylinder(d=4, h=13.5, $fn=30);
                            color("silver") translate([14.5, -.1, 0]) rotate ([-90, 0, 0])
                                cylinder(d=4, h=13.5, $fn=30);
                        }
                        difference() {
                            union() {
                                color("silver") translate([0, -.1, 0]) rotate ([-90, 0, 0])
                                cylinder(d=4, h=11.5, $fn=30);
                                color("silver") translate([14.5, -.1, 0]) rotate ([-90, 0, 0])
                                cylinder(d=4, h=11.5, $fn=30);
                            }               
                            color("silver") translate([0, -.2, 0]) rotate ([-90, 0, 0])
                                cylinder(d=3, h=13.5, $fn=30);
                            color("silver") translate([14.5, -.2, 0]) rotate ([-90, 0, 0])
                                cylinder(d=3, h=13.5, $fn=30);
                            color("silver") translate([-3, -1, -3]) cube([3, 13.5, 7.5]);
                            color("silver") translate([14.5, -1, -3]) cube([3, 13.5, 7.5]);
                            color("silver") translate([-1, -1, -3]) cube([16.5, 13.5, 3]);
                            }
                    }
//                        color("black") translate([2.5, .5, 2.25]) cube([9.25, 10.5, 1.5]);
                }
                color("black") translate([2.5, .5, 14.5]) cube([13, 10.5, 1.5]);
                color("silver") translate([0, 0, 12.5]) rotate([0, 45, 0]) cube([2, 17.5, 2]);
                color("silver") translate([-.5, 0, 13]) cube([.6, .5, 4.5]);
                color("silver") translate([17.9, 0, 13]) cube([.6, .5, 4.5]);
                color("silver") translate([2, 0, 18.9]) cube([14, .5, .5]);
            }
        }
    }

    // hdmi micro connector
    if(type == "hdmi_micro") {

        size_x = 6.5;
        size_y = 7.5;
        size_xm = 7.25;
        size_ym = mlen;

        if(enablemask == true && cmask == true && mstyle == "default") {
           // hdmi micro opening
            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y-mlen+6+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_micro", mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-mlen+6+back, loc_y-.75, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_micro", mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.75, loc_y+1.5-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_micro", mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+1.5-back, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_micro", mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.75, loc_y-mlen+6+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_micro", mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+1.5-back, loc_y-.75, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_micro", mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y+1.5-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_micro", mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-mlen+6+back, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_micro", mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)        
            union() {    
                difference () {
                    color("silver") cube([size_x, size_y, 2.9]);
                    color("dimgray") translate([.25, -.25, .25]) cube([size_x-.5, size_y-.5, 2.4]);
                    color("silver") translate([-.5, -.1, 0]) rotate([-90, 0, 0]) 
                        cylinder(d=2.5, h=7.7, $fn=30);
                    color("silver") translate([7, -.1, 0]) rotate([-90, 0, 0]) 
                        cylinder(d=2.5, h=7.7, $fn=30);

                }
                difference() {
                    union() {
                        color("silver") translate([-.5, 0, 0]) rotate([-90, 0, 0]) 
                            cylinder(d=2.5, h=8.5, $fn=30);
                        color("silver") translate([7, 0, 0]) rotate([-90,0,0]) 
                            cylinder(d=2.5, h=8.5, $fn=30);
                    }               
                    color("silver") translate([-.25, -.2, .15]) rotate([-90, 0, 0]) 
                        cylinder(d=1.5, h=8.5, $fn=30);
                    color("silver") translate([6.75, -.2, .15]) rotate([-90, 0, 0]) 
                        cylinder(d=1.5, h=8.5, $fn=30);
                    
                    color("silver") translate([-3, -1, -3]) cube([3, 10.5, 7.5]);
                    color("silver") translate([6.5, -1, -3]) cube([3, 10.5, 7.5]);
                    color("silver") translate([-1, -1, -3]) cube([9, 10.5, 3]);
                    color("silver") translate([-1, 7.5, -3]) cube([9, 6.5, 9]);
                    }
                color("black") translate([1.375, .5, 1]) cube([4, 3.5, 1.2]);
            }
        }
    }

    // hdmi mini connector
    if(type == "hdmi_mini") {

        size_x = 11.2;
        size_y = 8;
        size_xm = 11.5;
        size_ym = mlen;

        if(enablemask == true && cmask == true && mstyle == "default") {
           // hdmi mini opening
            if(side == "top" && rotation == 0) {
                place(loc_x+.125, loc_y-mlen+6+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_mini", mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-mlen+6+back, loc_y-.375, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_mini", mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.5, loc_y+2-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_mini", mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+2-back, loc_y+.125, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_mini", mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.375, loc_y-mlen+6+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_mini", mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+2-back, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_mini", mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y+2-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_mini", mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-mlen+6+back, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("hdmi_mini", mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {    
                difference () {
                    color("silver") cube([size_x, size_y, 3.2]);
                    color("dimgray") translate([.25, -.25, .25]) cube([size_x-.5, size_y-.5, 2.7]);
                    color("silver") translate([-.5, -.1, 0]) rotate ([-90, 0, 0]) 
                        cylinder(d=2.5, h=8.7, $fn=30);
                    color("silver") translate([11.75, -.1, 0]) rotate ([-90, 0, 0]) 
                        cylinder(d=2.5, h=8.7, $fn=30);

                }
                difference() {
                    union() {
                        color("silver") translate([-.5, 0, 0]) rotate ([-90, 0, 0])
                            cylinder(d=2.5, h=8.5, $fn=30);
                        color("silver") translate([11.75, 0, 0]) rotate ([-90, 0, 0])
                            cylinder(d=2.5, h=8.5, $fn=30);
                    }               
                    color("silver") translate([-.25, -.2, .25]) rotate ([-90, 0, 0])
                        cylinder(d=1.25, h=8.5, $fn=30);
                    color("silver") translate([11.4, -.2, 0]) rotate ([-90, 0, 0])
                        cylinder(d=1.25, h=9, $fn=30);

                    color("silver") translate([-3, -1, -3]) cube([3, 10.5, 7.5]);
                    color("silver") translate([11.2, -1, -3]) cube([3, 10.5, 7.5]);
                    color("silver") translate([-1, -1, -3]) cube([13, 10.5, 3]);
                    color("silver") translate([-1, 8, -3]) cube([14, 6.5, 9]);
                    }
                color("black") translate([1.5, .5, 1]) cube([8, 3.5, 1.2]);
            }
        }
    }

    // display port mini connector
    if(type == "dp_mini") {

        size_x = 8.5;
        size_y = 13.65;
        size_xm = 9;
        size_ym = mlen;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // dp mini opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.125, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(rotation == 180) {
                place(loc_x-.375, loc_y+6, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+6, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.675, loc_y, loc_z-1.5, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+6, loc_y-.5, loc_z-1.5, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(side == "bottom" && rotation == 180) {        size_x = 8.5;
        size_y = 13.65;
        size_xm = 9;
        size_ym = mlen;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // dp opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.125, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(rotation == 180) {
                place(loc_x-.375, loc_y+6, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+6, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.675, loc_y, loc_z-1.5, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+6, loc_y-.5, loc_z-1.5, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.375, loc_y+6, loc_z-1.5, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y, loc_z-1.5, size_xm, size_ym, rotation, side) hdmi_open("dp_mini", mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    difference() {
                        color("silver") cube([size_x, size_y, 5.6]);
                        color("silver") translate([-7.5, -1, 1]) rotate([0, 45, 0]) cube([size_x, size_y+2, 5.6]);
                        color("silver") translate([10, -1, -5]) rotate([0, -45, 0]) cube([size_x, size_y+2, 5.6]);
                    }
                    difference() {
                        color("dimgray") translate([.5, -.25, .5]) cube([size_x-1, size_y-.5, 4.6]);
                        color("silver") translate([-6.75, -1, 1]) rotate([0, 45, 0]) cube([size_x, size_y, 5.6]);
                        color("silver") translate([9.4, -1, -5]) rotate([0, -45, 0]) cube([size_x, size_y, 5.6]);
                    }
                }
                color("black") translate([1.5, .5, 2.25]) cube([5.5, size_y-.5, 1.2]);
            }
        }

                place(loc_x-.375, loc_y+6, loc_z-1.5, size_xm, size_ym, rotation, side, pcbsize_z) hdmi_open("dp_mini", mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y, loc_z-1.5, size_xm, size_ym, rotation, side) hdmi_open("dp_mini", mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    difference() {
                        color("silver") cube([size_x, size_y, 5.6]);
                        color("silver") translate([-7.5, -1, 1]) rotate([0, 45, 0]) cube([size_x, size_y+2, 5.6]);
                        color("silver") translate([10, -1, -5]) rotate([0, -45, 0]) cube([size_x, size_y+2, 5.6]);
                    }
                    difference() {
                        color("dimgray") translate([.5, -.25, .5]) cube([size_x-1, size_y-.5, 4.6]);
                        color("silver") translate([-6.75, -1, 1]) rotate([0, 45, 0]) cube([size_x, size_y, 5.6]);
                        color("silver") translate([9.4, -1, -5]) rotate([0, -45, 0]) cube([size_x, size_y, 5.6]);
                    }
                }
                color("black") translate([1.5, .5, 2.25]) cube([5.5, size_y-.5, 1.2]);
            }
        }
    }

    // display port vertical connector
    if(type == "dp_vertical") {

        size_x = 5.5;
        size_y = 11.5;
        size_z = 16.5;
        size_xm = 6.5;
        size_ym = mlen;
        size_zm = 17.5;
        height = 0;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // hdmi vertical opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.5, loc_y-size_y+1.5+back, loc_z-.25+height, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back-size_y+1.5, loc_y-(size_xm-size_x)/2, loc_z-.25+height, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z-.25+height, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-back+size_y, loc_y-.5, loc_z-.25+height, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.5, loc_y-size_y+1.5+back, loc_z-.25+height, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back+size_y, loc_y-(size_xm-size_x)/2, loc_z-.25+height, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z-.25+height, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back-size_y+1.5, loc_y-.5, loc_z,size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() { 
                difference() {
                    difference() {
                        color("silver") translate([0, 0, height]) cube([size_x, size_y, size_z]);
                        color("silver") translate([-4, -1, size_z+height+1.5]) rotate([0,45,0]) cube([5, size_y+2, 5]);
                    }
                    difference() {
                        color("dimgray") translate([.5, -.1, height+.5]) cube([size_x-1, size_y-1, size_z-1]);
                        color("silver") translate([-4, -1, size_z+height+.5]) rotate([0,45,0]) cube([5, size_y+2, 5]);
                    }
                }
                color("black") translate([2, .5, height+2.25]) cube([1.55, 10.5, 11.25]);
            }
        }
    }
}


/* 
     CLASS NAME: hdmi_open
    DESCRIPTION: creates video connector masks.
           TODO:
          USAGE: hdmi_open(hdmi_style,mlen)

                           hdmi_style = "hdmi_a", "hdmi_micro", "hdmi_mini", "dp_mini"
*/
module hdmi_open(hdmi_style,mlen) {

    if(hdmi_style == "hdmi_a") {
        union() { 
            difference() {
                translate([.25, -5, 1]) cube([15, mlen, 5.75]);
                translate([0.5, -5.2, .5]) rotate ([-90, 0, 0]) cylinder(d=3, h=13.5, $fn=30);
                translate([15, -5.2, .5]) rotate ([-90, 0, 0]) cylinder(d=3, h=13.5, $fn=30);
            }
            translate([2, -5, .5]) cube([11.5, mlen, .5]);
        }
    }
    if(hdmi_style == "hdmi_a_thruwall") {
        union() { 
            difference() {
                translate([.25, -5, 1]) cube([16, mlen, 6.25]);
                translate([0.5, -5.2, .5]) rotate ([-90, 0, 0]) cylinder(d=3, h=13.5, $fn=30);
                translate([16, -5.2, .5]) rotate ([-90, 0, 0]) cylinder(d=3, h=13.5, $fn=30);
            }
            translate([2, -5, .25]) cube([12.5, mlen, .75]);
        }
    }
    if(hdmi_style == "hdmi_micro") {
        union() { 
            difference() {
                translate([-.25, -6, -.01]) cube([7, mlen, 3.15]);
                translate([-.25, -6.2, 0]) rotate ([-90, 0, 0]) cylinder(d=1.5, h=9.5, $fn=30);
                translate([6.75, -6.2, 0]) rotate ([-90, 0, 0]) cylinder(d=1.5, h=9.5, $fn=30);
            }
        }
    }
    if(hdmi_style == "hdmi_mini") {
        union() {
            difference() {
                translate([-.25, -6, -.01]) cube([11.5, mlen, 3.5]);
                translate([-1, -6.2, -.5]) rotate ([-90, 0, 0]) cylinder(d=3, h=10, $fn=30);
                translate([12.25, -6.2, -.5]) rotate ([-90, 0, 0]) cylinder(d=3, h=10, $fn=30);
            }
        }
    }
    if(hdmi_style=="dp_mini") {
        size_x = 9;
        size_y = 8;
        union() {
            difference() {
                translate([-.25, -6, 0]) cube([size_x, mlen, 5.75]);
                translate([-7.5, -7, 1]) rotate([0, 45, 0]) cube([size_x, size_y+2, 5.6]);
                translate([10, -7, -5]) rotate([0, -45, 0]) cube([size_x, size_y+2, 5.6]);
            }
        }
    }
}
