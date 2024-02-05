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


     CLASS NAME: uart
    DESCRIPTION: creates uart ports.
           TODO:

          USAGE: uart(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                      type = "molex_5267", "molex_5268" 
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
                   mask[3] = mstyle "none", "open", "knockout"

*/

// uart class
module uart(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];
    knock_gap = 2;

    // uart micro connector straight
    if(type == "molex_5267") {
        
        size_x = 12.4;
        size_y = 5;
        size_z = 6;
        size_xm = size_x+2;
        size_zm = 6;

        if(enablemask == true && cmask == true && mstyle == "open") {

            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-mlen+back, loc_z+5, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-mlen+back, loc_y+(size_xm-size_x)/2, loc_z+5, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+(size_xm-size_x)/2, loc_y+size_y-back, loc_z+5, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z+5, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+(size_xm-size_x)/2, loc_y-mlen+back, loc_z+5, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y+(size_xm-size_x)/2, loc_z+5, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z+5, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-mlen+back, loc_y-(size_xm-size_x)/2, loc_z+5, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == true && cmask == true && (mstyle == "knockout" || mstyle == "default")) {

            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y, loc_z+5+back, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y+(size_xm-size_x)/2, loc_z+5, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+(size_xm-size_x)/2, loc_y-size_y, loc_z+5+back, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-size_y, loc_y-(size_xm-size_x)/2, loc_z+5+back, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+(size_xm-size_x)/2, loc_y, loc_z+5+back, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-size_y, loc_y+(size_xm-size_x)/2, loc_z+5+back, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_y, loc_z+5+back, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y-(size_xm-size_x)/2, loc_z+5+back, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) knockout(size_xm, size_zm, 1, mlen, 2, "rectangle");
            }
        }
        if(enablemask == false) {
        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference() {
                    union() {
                    
                        difference () {
                            color("white") cube([size_x, size_y, 6]);
                            color("white") translate([.5, .5, 2]) cube([11.5, 4, 6]);
                        }
                        color("white") translate([12, 3.75, .5]) rotate([0, 0, 45]) cube([1, 2, 5.5]);
                        color("white") translate([-0.2, 4, .5]) rotate([0, 0, -45]) cube([1, 2, 5.5]);
                    }
                    color("white") translate([12.4, 0, -.5]) cube([2, 6, 7]);
                    color("white") translate([-1, 0, -.5]) cube([1, 6, 7]);
                    color("white") translate([-1, 5, -.5]) cube([14, 2, 7]);
                    color("white") translate([-0.7, 4.5, -.1]) rotate([0, 0, -45]) cube([1, 2, 7]);
                    color("white") translate([-1, 1.5, 2]) cube([14, 1, 7]);
                }
                for (i=[2.5:2.5:10]) {
                    color("silver") translate ([i, 3, .5]) cube([.6, .6, 5]);
                }
            }
        }
    }
    // uart micro connector right angle
    if(type == "molex_5268") {
        
        size_x = 12.5;
        size_y = 6;
        size_z = 5;
        size_xm = size_x+2;
        size_zm = size_z+.5;

        if(enablemask == true && cmask == true && mstyle == "open") {
            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-mlen+back, loc_z, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-mlen+back, loc_y+(size_xm-size_x)/2, loc_z, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+(size_xm-size_x)/2, loc_y-mlen+back, loc_z, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y+(size_xm-size_x)/2, loc_z, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-mlen+back, loc_y-(size_xm-size_x)/2, loc_z, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == true && cmask == true && (mstyle == "knockout" || mstyle == "default")) {

            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y, loc_z+back, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90,0,0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y+(size_xm-size_x)/2, loc_z, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90,0,0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+(size_xm-size_x)/2, loc_y-4, loc_z+back, size_x, mlen, rotation, side, pcbsize_z)
                     rotate([90,0,0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-4, loc_y-(size_xm-size_x)/2, loc_z+back, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90,0,0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+(size_xm-size_x)/2, loc_y, loc_z+back, size_x, mlen, rotation, side, pcbsize_z)
                     rotate([90,0,0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-4, loc_y+(size_xm-size_x)/2, loc_z+back, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90,0,0]) knockout(size_xm, size_zm, 1, mlen, 2, "rectangle");
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y-4, loc_z+back, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90,0,0]) knockout(size_xm, size_zm, 1, mlen, 2, "rectangle");
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y-(size_xm-size_x)/2, loc_z+back, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90,0,0]) knockout(size_xm, size_zm, knock_gap, mlen, 2, "rectangle");
            }
        }
        if(enablemask == false) {
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            rotate([0,0,0]) translate([0, 0, 0]) union() {
                difference() {
                    union() {

                        difference () {
                            color("white") cube([size_x, size_y, size_z]);
                            color("white") translate([.5, -2, .5]) cube([size_x-1, size_y, size_z-1]);
                        }
                        color("white") translate([0, 5, 3.925]) rotate([90, 45, 0]) cube([.75, 1.5, 5]);
                        color("white") translate([11.9675, 5, 3.40625]) rotate([90, -45, 0]) cube([.75, 1.5, 5]);
                    }
                    color("white") translate([-1, 6.5, 4]) rotate([90, 45, 0]) cube([1, 4, 7]);
                    color("white") translate([-1, 4, 1]) rotate([90, 0, 0]) cube([14, 1, 7]);
                }
                for (i=[2.5:2.5:10]) {
                    color("silver") translate ([i, 0, 2.38]) cube([.6, 5, .6]);
                }
            }
        }
    }
}