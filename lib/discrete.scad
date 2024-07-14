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


     CLASS NAME: discrete
    DESCRIPTION: creates discrete components
           TODO: 

          USAGE: discrete(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                          type = "ir_dual", "ir_3"
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

                          type = "ir_1", "ir_2"
                         loc_x = x location placement
                         loc_y = y location placement
                         loc_z = z location placement
                          side = "top", "bottom"
                    rotation[] = object rotation
                       size[2] = height
                     pcbsize_z = pcb thickness
                    enablemask = true produces mask, false produces model
                       mask[0] = true enables component mask
                       mask[1] = mask length
                       mask[2] = mask setback
                       mask[3] = mstyle "default"

                          type = "capacitor"
                         loc_x = x location placement
                         loc_y = y location placement
                         loc_z = z location placement
                          side = "top", "bottom"
                    rotation[] = object rotation
                       size[0] = diameter
                       size[2] = height
                     pcbsize_z = pcb thickness
                    enablemask = true produces mask, false produces model

                          type = "led"
                         loc_x = x location placement
                         loc_y = y location placement
                         loc_z = z location placement
                          side = "top", "bottom"
                    rotation[] = object rotation
                       size[0] = diameter
                       size[2] = height
                       data[0] = style "default"
                       data[1] = led color
                     pcbsize_z = pcb thickness
                    enablemask = true produces mask, false produces model

*/

// discrete class
module discrete(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];
    pcolor = "#fee5a6";
    adj = .01;
    $fn = 90;

    // type ir
    if(type=="ir_1") {

        size_x = 7;
        size_y = 3;
        size_z = size[2];
        size_xm = 5;
        size_ym = 3.5;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+size_x/2, loc_y+back, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back, loc_y-1.5, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-1.5, loc_y-.5-back, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-back, loc_y+3.5, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-1.5, loc_y+back, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back, loc_y-1.5, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+size_x/2, loc_y-.5-back, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y+3.5, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("silver") translate([0, 0, size_z]) cube([size_x, size_y, 8]);
                color("dimgray") translate([3.5, .5, size_z+3.5]) sphere(d=5);
                color("silver") translate ([1, 1.25, 0]) cube([.64, .5, size_z+adj]);
                color("silver") translate ([3.25, 1.25, 0]) cube([.64, .5, size_z+adj]);
                color("silver") translate ([5.5, 1.25, 0]) cube([.64, .5, size_z+adj]);
            }
        }
    }

    if(type=="ir_2") {

        size_x = 5;
        size_y = 3;
        size_z = size[2];
        size_xm = 5;
        size_ym = 3.5;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+size_x/2, loc_y+back, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back, loc_y-2.5, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-1.5, loc_y-.5-back, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-back, loc_y+3.5, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-1.5, loc_y+back, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back, loc_y-2.5, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+size_x/2, loc_y-.5-back, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y+3.5, loc_z+size_z+3.5, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("#353535") translate([0, 0, size_z]) cube([size_x, size_y, 6]);
                color("dimgray") translate([2.5, .5, size_z+3.5]) sphere(d=4);
                color("silver") translate ([.5, 1.25, 0]) cube([.64, .5, size_z+adj]);
                color("silver") translate ([2.25, 1.25, 0]) cube([.64, .5, size_z+adj]);
                color("silver") translate ([3.86, 1.25, 0]) cube([.64, .5, size_z+adj]);
            }
        }
    }

    if(type=="ir_3") {

        size_x = 4.75;
        size_y = 6;
        size_xm = 4;
        size_ym = 4;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([size_x/2,0,5.25]) rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([1.625,0,5.25]) rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([1.625,0,5.25]) rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-back, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([size_x/2,0,5.25]) rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([1.625,0,5.25]) rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([1.625,0,5.25]) rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([size_x/2,0,5.25]) rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([size_x/2,0,5.25]) rotate([90, 0, 0]) cylinder(d=size_xm, h=mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("#353535") translate([0, 0, 0]) cube([size_x, size_y, 7.5]);
                color("gray") translate([size_x/2, -2, 5.25]) rotate([270,0,0]) cylinder(d=4, h=2);
                color("gray") translate([size_x/2, -2, 5.25]) sphere(d=4);
            }
        }
    }

    if(type=="ir_dual") {

        size_x = 6.5;
        size_y = 2;
        size_xm = 3;
        size_ym = 6.5;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+size_x/2, loc_y+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([-3.25,0,1.75]) rotate([90, 0, 0]) slot(size_xm, size_ym, mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back, loc_y-1.75, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([-5.25,0,1.75]) rotate([90, 0, 0]) slot(size_xm, size_ym, mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-1.5, loc_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([-5,4.5,1.75]) rotate([90, 0, 0]) slot(size_xm, size_ym, mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-4.5-back, loc_y+3.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([-3.25,0,1.75]) rotate([90, 0, 0]) slot(size_xm, size_ym, mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-1.75, loc_y+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([-5.25,0,1.75]) rotate([90, 0, 0]) slot(size_xm, size_ym, mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-4.5-back, loc_y+.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([-3.25,0,1.75]) rotate([90, 0, 0]) slot(size_xm, size_ym, mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+size_x/2, loc_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([-3.25,4.5,1.75]) rotate([90, 0, 0]) slot(size_xm, size_ym, mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y+3.25, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                      translate([-3.25,0,1.75]) rotate([90, 0, 0]) slot(size_xm, size_ym, mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("silver") translate([0, 0, 0]) cube([size_x, size_y, 3.25]);
                color("dimgray") translate([1.5, .5, 1.75]) sphere(d=3);
                color("dimgray") translate([5, .5, 1.75]) sphere(d=3);
            }
        }
    }

    // can capacitor
    if(type=="capacitor" && enablemask == false) {

        size_x = size[0];
        size_y = size[0];
        height = size[2];

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color("dimgray") cylinder(d=size_x+.5, h=.5);
            color("silver") translate([0, 0, .5]) cylinder(d=size_x+.5, h=.5);
            color("silver") translate([0, 0, 1]) cylinder(d=size_x, h=height-1);
            color(pcolor) translate([-size_x/3, -.32, -3.2]) cube([.64, .64, 3.3]);
            color(pcolor) translate([(size_x/2)-(size_x/4), -.32, -3.2]) cube([.64, .64, 3.3]);
        }
    }
    // led
    if(type=="led" && enablemask == false) {

        size_x = size[0];
        size_y = size[0];
        height = size[2];
        style = data[0];
        lcolor = data[1];

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color(lcolor, .6) cylinder(d=size_x+1, h=.5);
            color(lcolor, .6) translate([0, 0, .4]) cylinder(d=size_x, h=height-size_x/2-.6);
            color(lcolor, .6) translate([0, 0, height-size_x/2]) sphere(d=size_x);
            color(pcolor) translate([-size_x/3, -.32, -3.2]) cube([.64,.64,3.3]);
            color(pcolor) translate([(size_x/2)-(size_x/4), -.32, -3.2]) cube([.64, .64, 3.3]);
        }
    }
}
