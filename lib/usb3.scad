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


     CLASS NAME: usb3
    DESCRIPTION: creates usb3 ports.
           TODO:

          USAGE: usb3(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                      type = "single_horizontal_a", "double_stacked_a", "double_stacked_usb3-usbc"
                             "double_stacked_usb3-usb2"
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
 
                       type = "single_vertical_a"
                      loc_x = x location placement
                      loc_y = y location placement
                      loc_z = z location placement
                       side = "top", "bottom"
                 rotation[] = object rotation
                    size[1] = size_y
                  pcbsize_z = pcb thickness
                 enablemask = true produces mask, false produces model
                    mask[0] = true enables component mask
                    mask[1] = mask length
                    mask[2] = mask setback
                    mask[3] = mstyle "default"

*/

// usb 3.0 port class
module usb3(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];

    // usb3 single horizontal type
    if(type == "single_horizontal_a") {

        size_x = 14;
        size_y = 14;
        size_xm = mstyle == "thruwall" ? 17 : 16;
        size_zm = mstyle == "thruwall" ? 8.75 : 7.75;
        loc_z_adj = mstyle == "thruwall" ? loc_z-.75 : loc_z;

        if(enablemask == true && cmask == true  && (mstyle == "default" || mstyle == "thruwall")) {
            // single horizontal usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-mlen+back, loc_z_adj, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-mlen+back, loc_y+(size_xm-size_x)/2, loc_z_adj, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+(size_xm-size_x)/2, loc_y+size_y-back, loc_z_adj, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z_adj, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+(size_xm-size_x)/2, loc_y-mlen+back, loc_z_adj, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y+(size_xm-size_x)/2, loc_z_adj, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z_adj, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-mlen+back, loc_y-(size_xm-size_x)/2, loc_z_adj, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    color("silver") cube([size_x, size_y, 7]);
                    color("dimgray") translate([.5, -.1, 1]) cube([size_x-1, size_y-.5, 5.5]);
                }
                color("royalblue") translate([2, 1, 4]) cube([10, size[1]-1, 1.5]);
                color("silver") translate([-.65, 0, 1]) cube([.65, .5, 5]);
                color("silver") translate([13.99, 0, 1]) cube([.65, .5, 5]);
                color("silver") translate([1, 0, 6.99]) cube([11.5, .5, .65]);
                for(i=[0:2:6]){
                    color("#fee5a6") translate([4+i, 1.5, 4.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                }
            }
        }
    }

    // usb3 single vertical socket
    if(type == "single_vertical_a") {

        size_x = 5.75;
        size_y = size[1];
        size_xm = 7.5;
        size_zm = 14.75;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // single vertical usb opening
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
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                // usb 3.0 port
                difference () {
                    color("silver") cube([size_x, size_y, 14]);
                    color("dimgray") translate([.5, -1, .75]) cube([4.75, size[1]-2, 13]);
                }
                color("silver") translate([-.65, 0, 1]) cube([.65, .5, 12]);
                color("silver") translate([size_x, 0, 1]) cube([.65, .5, 12]);
                color("silver") translate([1, 0, 14]) cube([3.8, .5, .65]);
                color("royalblue") translate([1, 0, 1.5]) cube([2, size[1]-.5, 11]);
                for(i=[0:2:6]){
                    color("#fee5a6") translate([2.75, .5, 4.4+i]) rotate([-90,0,0]) cube([.5, .64, 10]);
                }
            }
        }
    }

    // usb3 double stacked type
    if(type == "double_stacked_a") {

        size_x = 13.25;
        size_y = 17.5;
        size_xm = 14.75;
        size_zm = 16.25;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // single horizontal usb opening
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
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {    
                difference () {
                    color("silver") cube([size_x, size_y, 15.5]);
                    color("dimgray") translate([1, -.1, 1]) cube([11.25, 15.5, 13.5]);
                }
                color("silver") translate([0, 0, 6.75]) cube([size_x, size_y, 2]);
                color("royalblue") translate([1.5, 1, 12]) cube([10, 12.5, 1.5]);
                color("royalblue") translate([1.5 ,1, 4]) cube([10, 12.5, 1.5]);
                color("silver") translate([-.65, 0, 1]) cube([.65, .5, 5]);
                color("silver") translate([size_x, 0, 1]) cube([.65, .5, 5]);
                color("silver") translate([-.65, 0, 9]) cube([.65, .5, 5]);
                color("silver") translate([size_x, 0, 9]) cube([.65, .5, 5]);
                color("silver") translate([1, 0, 15.5]) cube([11.5, .5, .65]);
                for(i=[0:2:6]){
                    color("#fee5a6") translate([3.25+i, 1.5, 4.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                    color("#fee5a6") translate([3.25+i, 1.5, 12.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                }
            }
        }
    }

    // usb3 double stacked type
    if(type == "double_stacked_usb3-usb2") {

        size_x = 13.25;
        size_y = 17.5;
        size_xm = 14.75;
        size_zm = 16.25;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // single horizontal usb opening
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
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {    
                difference () {
                    color("silver") cube([size_x, size_y, 15.5]);
                    color("dimgray") translate([1, -.1, 1]) cube([11.25, 15.5, 13.5]);
                }
                color("silver") translate([0, 0, 6.75]) cube([size_x, size_y, 2]);
                color("royalblue") translate([1.5, 1, 12]) cube([10, 12.5, 1.5]);
                color("white") translate([1.5 ,1, 4]) cube([10, 12.5, 1.5]);
                color("silver") translate([-.65, 0, 1]) cube([.65, .5, 5]);
                color("silver") translate([size_x, 0, 1]) cube([.65, .5, 5]);
                color("silver") translate([-.65, 0, 9]) cube([.65, .5, 5]);
                color("silver") translate([size_x, 0, 9]) cube([.65, .5, 5]);
                color("silver") translate([1, 0, 15.5]) cube([11.5, .5, .65]);
                for(i=[0:2:6]){
                    color("#fee5a6") translate([3.25+i, 1.5, 4.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                    color("#fee5a6") translate([3.25+i, 1.5, 12.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                }
            }
        }
    }

    // usb2-usb3 double stacked type
    if(type == "double_stacked_usb2-usb3") {

        size_x = 13.25;
        size_y = 17.5;
        size_xm = 14.75;
        size_zm = 16.25;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // single horizontal usb opening
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
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {    
                difference () {
                    color("silver") cube([size_x, size_y, 15.5]);
                    color("dimgray") translate([1, -.1, 1]) cube([11.25, 15.5, 13.5]);
                }
                color("silver") translate([0, 0, 6.75]) cube([size_x, size_y, 2]);
                color("white") translate([1.5, 1, 12]) cube([10, 12.5, 1.5]);
                color("royalblue") translate([1.5 ,1, 4]) cube([10, 12.5, 1.5]);
                color("silver") translate([-.65, 0, 1]) cube([.65, .5, 5]);
                color("silver") translate([size_x, 0, 1]) cube([.65, .5, 5]);
                color("silver") translate([-.65, 0, 9]) cube([.65, .5, 5]);
                color("silver") translate([size_x, 0, 9]) cube([.65, .5, 5]);
                color("silver") translate([1, 0, 15.5]) cube([11.5, .5, .65]);
                for(i=[0:2:6]){
                    color("#fee5a6") translate([3.25+i, 1.5, 4.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                    color("#fee5a6") translate([3.25+i, 1.5, 12.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                }
            }
        }
    }

    // usb3 and usbc double stacked type
    if(type == "double_stacked_usb3-usbc") {
        
        $fn = 90;
        size_x = 13.25;
        size_y = 17.5;                
        size_xm = 14.75;
        size_zm = 16.25;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // single horizontal usb opening
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
                    union() {
                        cube([size_xm, mlen, size_zm]);
                        translate([1.375,0,2]) rotate([270,0,0]) slot(7, 12, mlen);
                    }
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
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    color("silver") cube([size_x, size_y, 15.5]);
                    color("dimgray") translate([1, -.1, 8.75]) cube([11.25, 15.5, 6.5]);
                    color("silver") translate([0, 0, 1])
                    rotate([90, 0, 0])  translate([4, 1, -7]) hull() {
                        cylinder(d=3, h=7+.2);
                        translate([9-3.5, 0, 0]) cylinder(d=3, h=7+.2);
                        }
                }
                color("silver") translate([0, 0, 6.75]) cube([13.25, 17.5, 2]);
                color("royalblue") translate([1.5, 1, 12]) cube([10, 12.5, 1.5]);
                color("silver") translate([-.65, 0, 1]) cube([.65, .5, 5]);
                color("silver") translate([13.25, 0, 1]) cube([.65, .5, 5]);
                color("silver") translate([-.65, 0, 9]) cube([.65, .5, 5]);
                color("silver") translate([13.25, 0, 9]) cube([.65, .5, 5]);
                color("silver") translate([1, 0, 15.5]) cube([11.5, .5, .65]);
                color("black") rotate([90, 0, 0])  translate([4, 1.25, -7]) cube([5.5, 1.2, 6]);
                for(i=[0:2:6]){
                    color("#fee5a6") translate([3.25+i, 1.5, 12.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                }
            }
        }
    }
}