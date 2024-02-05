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

                          type = "gtb"
                         loc_x = x location placement
                         loc_y = y location placement
                         loc_z = z location placement
                          side = "top", "bottom"
                    rotation[] = object rotation
                       size[0] = #positions
                       size[1] = body depth
                       size[2] = height
                       data[0] = pitch
                       data[1] = body color
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

    // type green terminal block
    if(type=="gtb") {

        pitch = data[0];
        hcolor = data[1];
        rows = size[0];
        size_x = pitch * rows;
        size_y = size[1];
        height = size[2];
        pcolor = "#fee5a6";

        adj = .01;
        $fn = 90;
        size_xm = size_x+2;
        size_ym = size_y+.5;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0, back, 3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2:pitch:size_x]) {
                        translate([r, 4.15, height-back]) cylinder(d=3.7, h=mlen);
                    }
                }
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y-2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0, back, 3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2:pitch:size_x]) {
                        translate([r, 4.15, height-back]) cylinder(d=3.7, h=mlen);
                    }
                }
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([2,1+back,3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2:pitch:size_x]) {
                        translate([r+2, 4.5, height-back]) cylinder(d=3.7, h=mlen);
                    }
                }
            }
            if(side == "top" && rotation == 270) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0,.5+back,3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2:pitch:size_x]) {
                        translate([r, 4.5, height-back]) cylinder(d=3.7, h=mlen);
                    }
                }
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([2, back, 3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2:pitch:size_x]) {
                        translate([r+2, 4.15, height-back]) cylinder(d=3.7, h=mlen);
                    }
                }
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([2, .5+back, 3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2:pitch:size_x]) {
                        translate([r+2, 4.5, height-back]) cylinder(d=3.7, h=mlen);
                    }
                }
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0, 1+back, 3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2:pitch:size_x]) {
                        translate([r, 4.5, height-back]) cylinder(d=3.7, h=mlen);
                    }
                }
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                union() {
                    translate([0, back, 3]) rotate([90, 0, 0]) slot(5, size_x, mlen);
                    for(r=[pitch/2:pitch:size_x]) {
                        translate([r, 4.15, height-back]) cylinder(d=3.7, h=mlen);
                    }
                }
            }
        }
        if(enablemask == false) {

            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)        
            union() {
                difference() {
                    union() {
                        color(hcolor) cube([size_x, size_y, height/2]);
                        color(hcolor) translate([0, 0, (height/2)-.01]) cube([size_x, size_y, height/2]);
                    }
                    color(hcolor) translate([-1, -3, 6.99]) rotate([-15, 0, 0]) cube([(pitch*rows)+2, 3, 10]);
                    color(hcolor) translate([-1, 8, 10]) rotate([15, 0, 0]) cube([(pitch*rows)+2, 3, 10]);
                    for(r=[pitch/2:pitch:size_x]) {
                        color(hcolor) translate([r, 4.15, height-3]) cylinder(d=3.7, h=4);
                    }
                    for(r=[.75:pitch:size_x]) {
                        color(hcolor) translate([r, -1, 1]) cube([3.5,5,4]);
                    }
                }
                for(r=[pitch/2:pitch:size_x]) {
                    color(pcolor) translate([r, 4.15, -3.2]) cube([.64, .64, 3.3]);
                    difference() {
                        color("silver") translate([r, 4.15, height-2.5]) cylinder(d=3.7, h=2);
                        color("silver") translate([r-.5, 4.15-(4.15/2), height-1.25]) cube([1,4,1]);
                    }
                }
                for(r=[1:pitch:size_x]) {
                    color("silver") translate([r, .5, 1]) cube([3, 4, .25]);
                    color("silver") translate([r, .5, 4.5]) cube([3, 4, .5]);
                }
            }
        }
    }
}
