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


     CLASS NAME: terminal
    DESCRIPTION: creates terminal blocks
           TODO: add other styles

          USAGE: terminal(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask)

                          type = "screw", "barrier"
                         loc_x = x location placement
                         loc_y = y location placement
                         loc_z = z location placement
                          side = "top", "bottom"
                    rotation[] = object rotation
                       size[0] = #row
                       size[1] = size_y
                       size[2] = size_z
                       data[0] = pitch
                       data[1] = body color
                       data[2] = offset z
                     pcbsize_z = pcb thickness
                    enablemask = true produces mask, false produces model
                       mask[0] = true enables component mask
                       mask[1] = mask length
                       mask[2] = mask setback
                       mask[3] = mstyle "default"

*/

// terminal block class
module terminal(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];
    pcolor = "#fee5a6";

    // type screw terminal block
    if(type=="screw") {

        pitch = data[0];
        hcolor = data[1];
        row = size[0];
        size_x = pitch * row;
        size_y = size[1];
        size_z = size[2];
        $fn = 90;
        screw_d = pitch-1;
        size_xm = size_x+2;
        size_ym = size_y+.5;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0, back, 3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2+0.75/2:pitch-(.75/row):size_x]) {
                        translate([r, size_y/2, size_z-back]) cylinder(d=screw_d, h=mlen);
                    }
                }
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y-2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0, back, 3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2+0.75/2:pitch-(.75/row):size_x]) {
                        translate([r, size_y/2, size_z-back]) cylinder(d=screw_d, h=mlen);
                    }
                }
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([2,1+back,3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2+0.75/2:pitch-(.75/row):size_x]) {
                        translate([r+2, size_y/2+.5, size_z-back]) cylinder(d=screw_d, h=mlen);
                    }
                }
            }
            if(side == "top" && rotation == 270) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0,.5+back,3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2+0.75/2:pitch-(.75/row):size_x]) {
                        translate([r, size_y/2+.5, size_z-back]) cylinder(d=screw_d, h=mlen);
                    }
                }
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([2, back, 3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2+0.75/2:pitch-(.75/row):size_x]) {
                        translate([r+2, size_y/2, size_z-back]) cylinder(d=screw_d, h=mlen);
                    }
                }
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([2, .5+back, 3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2+0.75/2:pitch-(.75/row):size_x]) {
                        translate([r+2, size_y/2+.5, size_z-back]) cylinder(d=screw_d, h=mlen);
                    }
                }
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0, 1+back, 3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2+0.75/2:pitch-(.75/row):size_x]) {
                        translate([r, size_y/2+.5, size_z-back]) cylinder(d=screw_d, h=mlen);
                    }
                }
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0, back, 3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2+0.75/2:pitch-(.75/row):size_x]) {
                        translate([r, size_y/2, size_z-back]) cylinder(d=screw_d, h=mlen);
                    }
                }
            }
        }
        if(enablemask == false) {

            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference() {
                    union() {
                        color(hcolor) cube([size_x, size_y, size_z/2]);
                        color(hcolor) translate([0, 0, (size_z/2)-.01]) cube([size_x, size_y, size_z/2]);
                    }
                    color(hcolor) translate([-1, -3, 6.99]) rotate([-15, 0, 0]) cube([size_x+2, 3, 10]);
                    color(hcolor) translate([-1, size_y, 6.99]) rotate([15, 0, 0]) cube([size_x+2, 3, 10]);
                    for(r=[.75/2+pitch/2:pitch-(.75/row):size_x]) {
                        color(hcolor) translate([r, size_y/2, size_z-3]) cylinder(d=screw_d, h=4);
                    }
                    for(r=[.75:pitch-(.75/row):size_x]) {
                        color(hcolor) translate([r, -1, 1]) cube([pitch-.75,5,4]);
                    }
                }
                for(r=[pitch/2+0.75/2:pitch-(.75/row):size_x]) {
                    color(pcolor) translate([r-.32, size_y/2, -3.2]) cube([.64, .64, 3.3]);
                    difference() {
                        color("silver") translate([r, size_y/2, size_z-2.5]) cylinder(d=screw_d, h=2);
                        color("silver") translate([r-.5, size_y/2-screw_d/2, size_z-1.25]) cube([1,4,1]);
                    }
                }
                for(r=[.75:pitch-(.75/row):size_x-0.75]) {
                    color("silver") translate([r, .5, 1]) cube([pitch-.75, 4, .25]);
                    color("silver") translate([r, .5, 4.5]) cube([pitch-.75, 4, .5]);
                }
            }
        }
    }

    // type barrier terminal block
    if(type=="barrier") {

        pitch = data[0];
        hcolor = data[1];
        z_offset = data[2];
        row = size[0];
        size_x = pitch * row;
        size_y = size[1];
        size_z = size[2];
        $fn = 90;
        pitch_adj = .75;
        screw_d = pitch-2*pitch_adj;
        size_xm = size_x+2;
        size_ym = size_y+.5;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0,back,z_offset]) rotate([90, 0, 0]) cube([size_x, size_z-z_offset, mlen]);
                }
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y-2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0,back,z_offset]) rotate([90, 0, 0]) cube([size_x, size_z-z_offset, mlen]);
                }
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([2,1+back,z_offset]) rotate([90, 0, 0]) cube([size_x, size_z-z_offset, mlen]);
                }
            }
            if(side == "top" && rotation == 270) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0,1+back,z_offset]) rotate([90, 0, 0]) cube([size_x, size_z-z_offset, mlen]);
                }
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([2, back, z_offset]) rotate([90, 0, 0]) cube([size_x, size_z-z_offset, mlen]);
                }
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([2, 1+back, z_offset]) rotate([90, 0, 0]) cube([size_x, size_z-z_offset, mlen]);
                }
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0, 1+back, z_offset]) rotate([90, 0, 0]) cube([size_x, size_z-z_offset, mlen]);
                }
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0, back, z_offset]) rotate([90, 0, 0]) cube([size_x, size_z-z_offset, mlen]);
                }
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                union() {
                    color(hcolor) cube([size_x, size_y, z_offset]);
                    color(hcolor) translate([0, size_y-1, z_offset]) cube([size_x, 1, size_z-z_offset]);
                    for(r=[0:pitch-(pitch_adj/row):size_x]) {
                        color(hcolor) translate([r, 0, z_offset]) cube([pitch_adj,size_y,size_z-z_offset]);
                    }
                }
                for(r=[pitch/2+pitch_adj/2:pitch-(pitch_adj/row):size_x]) {
                    color(pcolor) translate([r-.32, screw_d, -3.2]) cube([.64, .64, 3.3]);
                    difference() {
                        color("silver") translate([r, screw_d/2, z_offset]) cylinder(d=screw_d, h=2);
                        color("silver") translate([r-0.5,0,z_offset+1.25]) cube([1,screw_d,1]);
                    }
                }
            }
        }
    }
}
