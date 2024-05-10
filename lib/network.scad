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


     CLASS NAME: network
    DESCRIPTION: creates network components
           TODO: 

          USAGE: network(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                         type = "rj45_single", "rj45_single_short", "rj45_reverse_single", "rj45_low_profile1",
                                "rj45_low_profile2", "rj45_double_stacked", "rj45-usb2_double", "rj45-usb3_double"
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

// network class
module network(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];

    // rj45 single socket
    if(type == "rj45_single") {

        size_x = 15.9;
        size_y = 21.3;
        size_z = 13.5;
        size_xm = 16.25;
        size_ym = mlen;
        size_zm = 14;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z) 
            union() {
                difference () {
                    color("lightgray") cube([size_x, size_y, size_z]);
                    color("darkgray") translate([1.5, -1, 1.5]) cube([13, 19.5, 8]);
                    color("darkgray") translate([5.5, -2, 7]) cube([5, 19.5, 5]);
                }
                for(i=[0:7]){ 
                    color("#fee5a6") translate([4+i, 1, 1]) rotate([-70,0,0]) cube([.5, .5, 10]);
                }
                color("green") translate([2, -.1, 10]) cube([3, 2, 2]);
                color("orange") translate([11, -.1, 10]) cube([3, 2, 2]);
            }
        }
    }

    if(type == "rj45_single_short") {

        size_x = 14.4;
        size_y = 12.67;
        size_z = 12;
        size_xm = 15;
        size_ym = mlen;
        size_zm = 12.25;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }

        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z) 
            union() {
                difference () {
                    color("lightgray") cube([size_x, size_y, 12]);
                    color("darkgray") translate([.675, -1, .6]) cube([13, 12, 8]);
                    color("darkgray") translate([4.6755, -2, 6.2]) cube([5, 12, 5]);
                }
                color("green") translate([1, -.1, 9.2]) cube([3, 2, 2]);
                color("orange") translate([10.375, -.1, 9.2]) cube([3, 2, 2]);
                for(i=[0:7]){ 
                    color("#fee5a6") translate([4+i, 1, 1]) rotate([-70,0,0]) cube([.5, .5, 10]);
                }
            }
        }
    }

    if(type == "rj45_reverse_single") {

        size_x = 15.9;
        size_y = 21.3;
        size_z = 13.5;
        size_xm = 16.25;
        size_ym = mlen;
        size_zm = 14;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z) 
            union() {
                difference () {
                    color("lightgray") cube([size_x, size_y, size_z]);
                    color("darkgray") translate([1.5, -1, 4]) cube([13, 19.5, 8]);
                    color("darkgray") translate([5.5, -2, 1.5]) cube([5, 19.5, 5]);
                }
                color("green") translate([2, -.1, 1.5]) cube([3, 2, 2]);
                color("orange") translate([11, -.1, 1.5]) cube([3, 2, 2]);
            }
        }
    }

    if(type == "rj45_low_profile1") {
    
        size_x = 13.5;
        size_y = 12.67;
        size_z = 11.5;
        size_xm = 15;
        size_ym = mlen;
        size_zm = 12.25;
        offset_z = -5.1;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x-1)/2, loc_y-size_ym+back, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x+1)/2, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_x+1)/2, loc_y+size_y-back, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x-1)/2, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-(size_xm-size_x+1)/2, loc_y-size_ym+back, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x+1)/2, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x-1)/2, loc_y+size_y-back, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x-1)/2, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z+offset_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    union() {
                    color("lightgray") translate([0.5, -0.375, 0]) cube([size_x, size_y, 11.375]);
                    color("#353535") translate([0, 1.375, 0.1]) cube([size_x+1, 9.375, size_z]);
                    color("#353535") translate([-1.25, 1.3, 5]) cube([1.25, 2.25, 3.5]);
                    color("#353535") translate([-1.25, 6, 5]) cube([1.25, 1.9, 3.5]);
                    color("#353535") translate([-1.25, 7.5, 5]) cube([1.25, 2, .75]);
                    color("#353535") translate([14.5, 1.3, 5]) cube([1.25, 2.25, 3.5]);
                    color("#353535") translate([14.5, 6, 5]) cube([1.25, 1.9, 3.5]);
                    color("#353535") translate([14.5, 7.5, 5]) cube([1.25, 2, .75]);
                    }
                    color("darkgray") translate([1.3, -1, 2.5]) cube([12, 9.5, 7.25]);
                    color("darkgray") translate([4, -2, .875]) cube([6.675, 12, 2]);
                    color("darkgray") translate([5, -2, -.1]) cube([4.5, 12, 1]);
                    color("darkgray") translate([2, 9.5, 3]) cube([10.5, 5, 8.4]);
                }
                for(i=[0:7]){ 
                    color("#fee5a6") translate([3.5+i, 8.5, 7]) rotate([70, 0, 0]) cube([.5, .5, 8]);
                }
            }
        }
    }

    if(type == "rj45_low_profile2") {

        size_x = 13.5;
        size_y = 12.67;
        size_z = 11.5;
        size_xm = 15;
        size_ym = mlen;
        size_zm = 12.25;
        offset_z = -3.1;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x-1)/2, loc_y-size_ym+back, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x+1)/2, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_x+1)/2, loc_y+size_y-back, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x-1)/2, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-(size_xm-size_x+1)/2, loc_y-size_ym+back, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x+1)/2, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x-1)/2, loc_y+size_y-back, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x-1)/2, loc_z+offset_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }

        if(enablemask == false) {
            place(loc_x, loc_y, loc_z+offset_z, size_x, size_y, rotation, side, pcbsize_z) 
            union() {
                difference () {
                    union() {
                    color("lightgray") translate([0.5, -0.375, 0]) cube([size_x, size_y, 11.375]);
                    color("silver") translate([0, 1.375, 0.1]) cube([size_x+1, 9.375, 11.5]);
                    }
                    color("darkgray") translate([1.3, -1, 2.5]) cube([12, 9.5, 7.25]);
                    color("darkgray") translate([4, -2, .875]) cube([6.675, 12, 2]);
                    color("darkgray") translate([5, -2, -.1]) cube([4.5, 12, 1]);
                    color("darkgray") translate([2, 9.5, 3]) cube([10.5, 5, 8.4]);
                }
                for(i=[0:7]){ 
                    color("#fee5a6") translate([3.5+i, 8.5, 7]) rotate([70,0,0]) cube([.5, .5, 8]);
                }
            }
        }
    }


    if(type == "rj45_double_stacked") {

        size_x = 17.5;
        size_y = 28.8;
        size_z = 25;
        size_xm = 18;
        size_ym = mlen;
        size_zm = 25.5;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }

        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z) 
            union() {
                difference () {
                    color("lightgray") cube([size_x,size_y,size_z]);
                    color("darkgray") translate([2, -1, 3]) cube([13, 19.5, 8]);
                    color("darkgray") translate([6, -2, .5]) cube([5, 19.5, 5]);
                    color("darkgray") translate([2, -1, 14]) cube([13, 19.5, 8]);
                    color("darkgray") translate([6, -2, 19.5]) cube([5, 19.5, 5]);
                }
                color("green") translate([2.5, -.1, .5]) cube([3, 2, 2]);
                color("orange") translate([11.5, -.1, .5]) cube([3, 2, 2]);
                color("green") translate([2.5, -.1, 22.5]) cube([3, 2, 2]);
                color("orange") translate([11.5, -.1, 22.5]) cube([3, 2, 2]);
            }
        }
    }


    // rj-45 and usb2 stacked type
    if(type == "rj45-usb2_double") {

        size_x = 19;
        size_y = 27.5;
        size_z = 31;
        size_xm = 19.5;
        size_ym = mlen;
        size_zm = 31.25;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    color("lightgray") cube([size_x, size_y, size_z]);
                    color("darkgray") translate([3, -1, 19]) cube([13, 19.5, 8]);
                    color("darkgray") translate([7, -2, 24.5]) cube([5, 19.5, 5]);
                    color("dimgray") translate([3, -.1, 1.5]) cube([13, 7.5, 7]);
                    color("dimgray") translate([3, -.1, 10.5]) cube([13, 7.5, 7]);
                }
                color("green") translate([3, -.1, 27.5]) cube([3, 2, 2]);
                color("orange") translate([13, -.1, 27.5]) cube([3, 2, 2]);
                color("white") translate([4, 1, 5]) cube([11, 12.5, 1.5]);
                color("white") translate([4, 1, 14]) cube([11, 12.5, 1.5]);
            }
        }
    }

    // rj-45 and usb3 stacked type
    if(type == "rj45-usb3_double") {
    
        size_x = 19;
        size_y = 27.5;
        size_z = 31;
        size_xm = 19.5;
        size_ym = mlen;
        size_zm = 31.25;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-size_ym+back, loc_y-(size_xm-size_x)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z) 
            union() {
                difference () {
                    color("lightgray") cube([size_x, size_y, size_z]);
                    color("darkgray") translate([3, -1, 19]) cube([13, 19.5, 8]);
                    color("darkgray") translate([7, -2, 24.5]) cube([5, 19.5, 5]);
                    color("dimgray") translate([3, -.1, 1.5]) cube([13, 7.5, 7]);
                    color("dimgray") translate([3, -.1, 10.5]) cube([13, 7.5, 7]);
                }
                color("green") translate([3, -.1, 27.5]) cube([3, 2, 2]);
                color("orange") translate([13, -.1, 27.5]) cube([3, 2, 2]);
                color("royalblue") translate([4, 1, 5]) cube([11, 12.5, 1.5]);
                color("royalblue") translate([4, 1, 14]) cube([11, 12.5, 1.5]);
            }
        }
    }
}
