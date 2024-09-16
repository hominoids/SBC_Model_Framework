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


     CLASS NAME: power
    DESCRIPTION: creates power delivery related components
           TODO: add other styles

          USAGE: power(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                       type = "pwr2.5_5x7.5", "pwr5.5_7.5x11.5", "pwr5.5_10x10", "pwr2.5_8.5x5.5", "pwr5.5_9.5x7.5", "pj-202ah", 
                              "molex_4x1", "small_encl_satapwr"
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
 
// power class
module power(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];

    // 2.5mm power plug 5 x 7.5mm
    if(type == "pwr2.5_5x7.5") {

        size_x = 5;
        size_y = 7.5;
        size_xm = 5;
        size_ym = mlen;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+(size_x/2), loc_y+back, loc_z+2, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+.25+back, loc_y-1.5, loc_z+2, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-1.5, loc_y-.75-back, loc_z+2, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-.75-back, loc_y+2.5, loc_z+2, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-1.5, loc_y+back, loc_z+2, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-.75-back, loc_y-1.5, loc_z+2, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+2.5, loc_y-.75-back, loc_z+2, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y+2.5, loc_z+2, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }

        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    color("silver") cube([size_x, size_y, 4]);
                    color("black") translate([size_x/2, -1, 2]) rotate([90, 0, 0])
                        cylinder(d=3, h=7, center=true, $fn=30);
                }
                color("white") translate([2.5, 3, 2]) rotate([90, 0, 0]) 
                    cylinder(d=1, h=2, $fn=30);
            }
        }
    }

    // 5.5mm power plug 7.5mm x 11.5mm
    if(type=="pwr5.5_7.5x11.5") {

        size_x = 7.6;
        size_y = 11.5;
        size_xm = 7;
        size_ym = mlen;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+3.75, loc_y+back, loc_z+6.5, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+.25+back, loc_y-3.25, loc_z+6.5, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-3.5, loc_y+4.5-back, loc_z+6.5, size_xm, size_xm, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+4.5-back, loc_y+3.75, loc_z+6.5, size_xm, size_xm, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-3.5, loc_y+back, loc_z+6.5, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+3.5-back, loc_y-3.25, loc_z+6.5, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+3.75, loc_y+4.5-back, loc_z+6.5, size_xm, size_xm, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y+3.75, loc_z+6.5, size_xm, size_xm, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
        }
        if(enablemask == true && cmask == true && mstyle == "thruwall") {
            if(side == "top" && rotation == 0) {
                place(loc_x-.5, loc_y+back, loc_z, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) cube([size_x+1, 11.25, mlen]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    color("silver") cube([size_x, size_y, 9.75]);
                    color("black") translate([3.8, 10, 6.5]) rotate([90, 0, 0])
                        cylinder(r=3, h=11, $fn=30);
                }
                color("white") translate([3.8, 10, 6.5]) rotate([90, 0, 0])
                    cylinder(d=1.5, h=9, $fn=30);
            }
        }
    }

    // 5.5mm power plug 10mm x 10mm
    if(type == "pwr5.5_10x10") {

        size_x = 10;
        size_y = 13.36;
        size_xm = 10.5;
        size_ym = mlen;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-.25, loc_y-mlen+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_xm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-mlen+back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_xm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_xm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_xm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.25, loc_y-mlen+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_xm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_xm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_xm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-mlen+back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_xm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    color("silver") cube([size_x, size_y, 10]);
                    color("black") translate([5, 10, 5]) rotate([90, 0, 0])
                    cylinder(r=3, h=11, $fn=30);
                }
                color("white") translate([5, 10, 5]) rotate([90, 0, 0])
                cylinder(d=1.5, h=9, $fn=30);
            }
        }
    }

    // 2.5mm power plug 8.5mm x 5.5mm
    if(type == "pwr2.5_8.5x5.5") {

        size_x = 8.5;
        size_y = 9.55;
        size_xm = 9;
        size_ym = mlen;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-.25, loc_y-mlen+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 6]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-mlen+back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 6]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 6]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 6]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.25, loc_y-mlen+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 6]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 6]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 6]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-mlen+back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 6]);
            }

        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    color("black") cube([size_x, size_y, 5.5]);
                    color("#353535") translate([5.7, 8.49, 2.75]) rotate([90, 0, 0])
                    cylinder(d=3.35, h=8.5, $fn=30);
                }
                color("white") translate([5.7, 8.5, 2.75]) rotate([90, 0, 0])
                cylinder(d=1.4, h=8.5, $fn=30);
            }
        }
    }

    // 5.5mm power plug 9.5mm x 7.5mm
    if(type == "pwr5.5_9.5x7.5") {

        size_x = 9.5;
        size_y = 9.5;
        size_z = 7.5;
        size_xm = 10;
        size_ym = mlen;
        size_zm = 7.75;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-.25, loc_y-mlen+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-mlen+back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.25, loc_y-mlen+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-mlen+back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }

        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    color("black") cube([size_x, size_y, size_z]);
                    color("#353535") translate([5.5, 8.49, size_z/2]) rotate([90, 0, 0])
                    cylinder(d=5.5, h=8.5, $fn=30);
                }
                color("white") translate([5.5, 8.5, size_z/2]) rotate([90, 0, 0])
                cylinder(d=2.1, h=8.5, $fn=30);
            }
        }
    }

    // PJ-202AH power plug
    if(type == "pj-202ah") {

        size_x = 9;
        size_y = 14.4;
        size_z = 11;
        size_xm = 10;
        size_ym = mlen;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-.25, loc_y-mlen+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_z+.5]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-mlen+back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_z+.5]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_z+.5]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_z+.5]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.25, loc_y-mlen+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_z+.5]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_z+.5]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_z+.5]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-mlen+back, loc_y-.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_z+.5]);
            }

        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    union() {
                        difference() {
                            color("#252525") cube([size_x, size_y, size_z]);
                            color("#252525") translate([-1, 3.5, 6.5]) cube([size_x+2, size_y, size_z]);
                        }
                        color("#252525") translate([size_x/2, size_y, 6.5]) rotate([90, 0, 0])
                            cylinder(d=8, h=11.1, $fn=30);
                    }
                    color("#454545") translate([size_x/2, 8.49, 6.5]) rotate([90, 0, 0])
                        cylinder(d=6.5, h=8.5, $fn=30);
                }

                color("white") translate([size_x/2, 8.5, 6.5]) rotate([90, 0, 0])
                    cylinder(d=2, h=8.5, $fn=30);
            }
        }
    }

    // molex power 4x1 connector type
    if(type=="molex_4x1" && enablemask == false) {

        size_x = 23;
        size_y = 8;

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference() {
                union() {
                    difference () {
                        color("white") cube([size_x, size_y, 10]);
                        color("darkgray") translate([.5, .5, 2]) cube([22, 7, 11]);
                    }
                    color("white") translate([-.9, 5.5, 0]) rotate([0, 0, -45]) cube([1, 4, 10]);
                    color("white") translate([23, 5, 0]) rotate([0, 0, 45]) cube([1, 4, 10]);
                }
                color("white") translate([-1, 0, -.5]) cube([1, 9, 11]);
                color("white") translate([23, 0, -.5]) cube([2, 9, 11]);
                color("white") translate([-1, 8, -.5]) cube([25, 3, 11]);
                color("white") translate([-1.7, 7.5, -.5]) rotate([0, 0, -45])
                cube([2.25, 4, 11]);
                color("white") translate([23.1, 6, -.5]) rotate([0, 0, 45]) cube([3, 4, 11]);
            }
            for (i=[3.75:5:20]) {
                color("silver") translate ([i, 4, -3.2]) cylinder(d=2, h=13, $fn=30);
            }
        }
    }

    // sata small power 4x1 connector type
    if(type=="small_encl_satapwr" && enablemask == false) {

        size_x = 12.7;
        size_y = 6.6;

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            union() {
                difference () {
                    color("white") cube([size_x, size_y, 8]);
                    color("darkgray") translate([.5, .5, 2]) cube([11.7, 5.6, 11]);
                }
            }
            for (i=[2.54:2.54:11.7]) {
                color("silver") translate ([i, 4, 2]) cylinder(d=.67, h=6, $fn=30);
            }
       }
   }
}
