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


     CLASS NAME: usbc
    DESCRIPTION: creates usbc ports.
           TODO:

          USAGE: usbc(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                      type = "single_horizontal", "single_vertical" 
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


// usbc port class
module usbc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];
    $fn=90;

    // usbc horizontal type
    if(type == "single_horizontal") {

        size_x = 9;
        size_xm = 10;
        size_y = 7;
        dia = 3.5;
        diam = 4.5;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // single horizontal usbc opening
            if(side == "top" && rotation == 0) {
                place(loc_x+(size_x-size_xm)/2, loc_y+back, loc_z-.125+diam/2, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back, loc_y-(size_x-size_xm)/2, loc_z-.125+diam/2, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_x-size_xm)/2, loc_y-3-back, loc_z-.375+diam/2, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-3-back, loc_y+(size_x-size_xm)/2, loc_z+diam/2, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-(size_x-size_xm)/2, loc_y+back, loc_z-.125+diam/2, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-3-back, loc_y-(size_x-size_xm)/2, loc_z+diam/2, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+(size_x-size_xm)/2, loc_y-3-back, loc_z+diam/2, size_x-(size_x-size_xm), mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y+(size_x-size_xm)/2, loc_z-.125+diam/2, size_x, mlen, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(diam, size_xm, mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            rotate([90, 0, 0])  translate([dia/2, dia/2, -size_y]) union() {
                difference () {
                    color("silver")
                    hull() {
                        cylinder(d=dia, h=size_y);
                        translate([size_x-dia, 0, 0]) cylinder(d=dia, h=size_y);
                        }
                    color("silver") translate([0,0,1])
                    hull() {
                        cylinder(d=3, h=size_y+.2);
                        translate([size_x-dia, 0, 0]) cylinder(d=3, h=size_y+.2);
                        }
                }
                color("black") translate([0, -1.2/2, .1]) cube([5.5, 1.2, 6]);
            }
        }
    }

    // usbc vertical type
    if(type == "single_vertical") {

        size_x = 9;
        size_y = 7;
        size_xm = 10;
        size_ym = 7;
        dia = 3.5;
        diam = 4;
        height = .5;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // single vertical usbc opening
            if(side == "top" && rotation == 0) {
                place(loc_x-(diam-dia)/2+diam/2, loc_y+back, loc_z+size_xm, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 90, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back, loc_y-dia+(diam-dia)+height, loc_z+size_xm, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 90, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-dia+(diam-dia)+height, loc_y-2-back, loc_z+size_xm, mlen, size_xm, rotation, side, pcbsize_z)
                    rotate([90, 90, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-2-back, loc_y-(diam-dia)/2+diam/2, loc_z+size_xm, mlen, size_xm, rotation, side, pcbsize_z)
                    rotate([90, 90, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-dia+(diam-dia)+height, loc_y+back, loc_z+size_xm, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 90, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back, loc_y-dia+(diam-dia)+height, loc_z+size_xm, size_xm, size_y, rotation, side, pcbsize_z)
                    rotate([90, 90, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(diam-dia)/2+diam/2, loc_y-2-back, loc_z+size_xm, mlen, size_xm, rotation, side, pcbsize_z)
                    rotate([90, 90, 0]) slot(diam, size_xm, mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y-(diam-dia)/2+diam/2, loc_z+size_xm, size_xm, mlen, rotation, side, pcbsize_z)
                    rotate([90, 90, 0]) slot(diam, size_xm, mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            rotate([90, 90 ,0])  translate([-size_y-.25-height, dia/2, -size_y])
            union() {
                difference () {
                    color("silver")
                    hull() {
                        cylinder(d=dia,h=size_y);
                        translate([size_x-dia, 0, 0]) cylinder(d=dia, h=size_y);
                        }
                    color("silver") translate([0 ,0, 1])
                    hull() {
                        cylinder(d=3, h=size_y+.2);
                        translate([size_x-dia, 0, 0]) cylinder(d=3, h=size_y+.2);
                        }
                }
                color("black") translate([0, -1.2/2, 1]) cube([5.5, 1.2, 6]);
            }
        }
    }
}
