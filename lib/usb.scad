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


    DESCRIPTION: creates usb ports.
           TODO:

          USAGE: usb2(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                        type = "micro", "double_stacked_a" 
                        type = "single_horizontal_a", "single_vertical_a"
                        size[1] = size_y
                        enablemask = true produces mask, false produces model
                        mask[0] = true enables component mask
                        mask[1] = mask length
                        mask[2] = mask setback
                        mask[3] = mstyle "default"

          USAGE: usb3(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                        type = "single_horizontal_a", "double_stacked_a", "double_stacked_usb3-usbc"
                               "double_stacked_usb3-usb2" 
                        type = "single_vertical_a"
                        size[1] = size_y
                        enablemask = true produces mask, false produces model
                        mask[0] = true enables component mask
                        mask[1] = mask length
                        mask[2] = mask setback
                        mask[3] = mstyle "default"

          USAGE: usbc(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                        type = "single_horizontal_a", "single_vertical_a" 
                        enablemask = true produces mask, false produces model
                        mask[0] = true enables component mask
                        mask[1] = mask length
                        mask[2] = mask setback
                        mask[3] = mstyle "default"


*/

// usb 2.0 port class
module usb2(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];

    // usb2 micro otg
    if(type == "micro") {

        size_x = 7.5;
        size_y = 4.5;
        dia =3.75;
        size_xm = 8.5;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // micro usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y+back, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(dia, size_xm, mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back, loc_y+(size_xm-size_x)/2, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(dia, size_xm, mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+(size_xm-size_x)/2, loc_y-back, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(dia, size_xm, mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-back, loc_y-(size_xm-size_x)/2, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(dia, size_xm, mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+(size_xm-size_x)/2, loc_y+back, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(dia, size_xm, mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back, loc_y+(size_xm-size_x)/2, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(dia, size_xm, mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y-back, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(dia, size_xm, mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y-(size_xm-size_x)/2, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(dia, size_xm, mlen);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    color("silver") cube([size_x, size_y, 3]);
                    color("dimgray") translate([.25,-.1, .5]) cube([7, 3.5, 2.25]);
                    color("silver") translate([0,-.1, 0]) rotate ([-90, 0, 0]) 
                        cylinder(d=2.5, h=6.5, $fn=30);
                    color("silver") translate([7.375, -.1, 0]) rotate ([-90, 0, 0]) 
                        cylinder(d=2.5, h=6.5, $fn=30);

                }
                difference() {
                    union() {
                        color("silver") translate([0, -.1, 0]) rotate ([-90, 0, 0])
                        cylinder(d=2.5, h=4.5, $fn=30);
                        color("silver") translate([7.375, -.1, 0]) rotate ([-90, 0, 0])
                        cylinder(d=2.5, h=4.5, $fn=30);
                    }
                    color("silver") translate([.125, -.2, 0]) rotate ([-90, 0, 0])
                        cylinder(d=1.5, h=6.5, $fn=30);
                    color("silver") translate([7.375, -.2, 0]) rotate ([-90, 0, 0])
                        cylinder(d=1.5, h=6.5, $fn=30);

                    color("silver") translate([-3, -1, -3]) cube([3, 6.5, 7.5]);
                    color("silver") translate([7.5, -1, -3]) cube([3, 6.5, 7.5]);
                    color("silver") translate([0, -1, -3]) cube([9, 6.5, 3]);
                    color("silver") translate([-1, -1, -3]) cube([9, 6.5, 3]);
                    }
                color("black") translate([1.5, .5, 1.25]) cube([4, 3.5, 1]);
            }
        }
    }

    if(type == "single_horizontal_a") {
        
        size_x = 14;
        size_y = size[1];
        size_xm = 16;
        size_zm = 7.75;

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
        if(enablemask == true && cmask == true && mstyle == "m1s") {
            // single horizontal usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.75, loc_y-mlen+back, loc_z+1, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    color("silver") cube([size_x, size_y, 7]);
                    color("dimgray") translate([.5,-.1, 1]) cube([size_x-1, size_y-.5, 5.5]);
                }
                color("white") translate([2, 1, 4]) cube([10, size_y-1.5, 1.5]);
                color("silver") translate([-.65, 0, 1]) cube([.65, .5, 5]);    
                color("silver") translate([13.99, 0, 1]) cube([.65, .5, 5]);
                color("silver") translate([1, 0, 6.99]) cube([11.5, .5, .65]);
                for(i=[0:2:6]){
                    color("#fee5a6") translate([4+i, 1.5, 4.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                }
            }
        }
    }

    // usb2 single vertical socket
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
                // usb 2.0 port
                difference () {
                    color("silver") cube([size_x, size_y, 14]);
                    color("dimgray") translate([.5, -1, .75]) cube([4.75, size[1]-2, 13]);
                }
                color("silver") translate([-.65, 0, 1]) cube([.65, .5, 12]);    
                color("silver") translate([size_x, 0, 1]) cube([.65, .5, 12]);
                color("silver") translate([1, 0, 14]) cube([3.8, .5, .65]);            
                color("white") translate([1, 0, 1.5]) cube([2, size[1]-.5, 11]);
                for(i=[0:2:6]){ 
                    color("#fee5a6") translate([2.75, .5, 4.4+i]) rotate([-90,0,0]) cube([.5, .64, 10]);
                }
            }
        }
    }

    // usb2 double stacked sockets
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
                color("white") translate([1.5, 1, 12]) cube([10, 12.5, 1.5]);
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
}

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
        size_xm = 16;
        size_zm = 7.75;

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
        if(enablemask == true && mstyle == "m1s") {
            // single horizontal usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.5, loc_y-mlen+back, loc_z+.25, size_x, mlen, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm+1]);
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
                place(loc_x-(size_x-size_xm)/2, loc_y-3-back, loc_z+diam/2, size_x, mlen, rotation, side, pcbsize_z)
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
        diam = 3.75;
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
