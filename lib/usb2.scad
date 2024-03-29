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


     CLASS NAME: usb2
    DESCRIPTION: creates usb2 ports.
           TODO:

          USAGE: usb2(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                      type = "micro", "double_stacked_a"
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

                      type = "single_horizontal_a", "single_vertical_a", "single_up_a"
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

// usb 2.0 port class
module usb2(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];
    
    adj = .01;

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

    // usb2 single upward socket
    if(type == "single_up_a") {

        size_x = 5.75;
        size_y = 14;
        size_z = size[1];
        size_xm = 7.25;
        size_ym = 16;

        if(enablemask == true && cmask == true && mstyle == "default") {
            // single vertical usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_x)/2, loc_y-(size_ym-size_y)/2, loc_z+size_z-back, size_x, size_y, 
                    rotation, side, pcbsize_z) cube([size_xm, size_ym, mlen]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-.25-(size_xm-size_x)/2, loc_y-.25+(size_ym-size_y)/2, loc_z+size_z-back, size_x, size_y, 
                    rotation, side, pcbsize_z) cube([size_xm, size_ym, mlen]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+(size_xm-size_x)/2, loc_y+(size_ym-size_y)/2, loc_z+size_z-back, size_x, size_y, 
                    rotation, side, pcbsize_z) cube([size_xm, size_ym, mlen]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+.25+(size_xm-size_x)/2, loc_y+.25-(size_ym-size_y)/2, loc_z+size_z-back, size_x, size_y,
                    rotation, side, pcbsize_z) cube([size_xm, size_ym, mlen]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+(size_xm-size_x)/2, loc_y-(size_ym-size_y)/2, loc_z+size_z-back, size_x, size_y, 
                    rotation, side, pcbsize_z) cube([size_xm, size_ym, mlen]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+.25+(size_xm-size_x)/2, loc_y-.25+(size_ym-size_y)/2, loc_z+size_z-back, size_x, size_y, 
                    rotation, side, pcbsize_z) cube([size_xm, size_ym, mlen]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-(size_xm-size_x)/2, loc_y+(size_ym-size_y)/2, loc_z+size_z-back, size_x, size_y, 
                    rotation, side, pcbsize_z) cube([size_xm, size_ym, mlen]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-.25-(size_xm-size_x)/2, loc_y+.25-(size_ym-size_y)/2, loc_z+size_z-back, size_x, size_y,
                    rotation, side, pcbsize_z) cube([size_xm, size_ym, mlen]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {   
                // usb 2.0 port
                difference () {
                    color("silver") cube([size_x, size_y, size_z]);
                    color("dimgray") translate([.5, .5, .75]) cube([4.75, 13, size[1]+2]);
                }
                color("silver") translate([-.65, 1, size[1]-.5]) cube([.65, 12, .5]);    
                color("silver") translate([size_x-adj, 1, size[1]-.5]) cube([.65, 12, .5]);
                color("silver") translate([1, -.64, size[1]-.5]) cube([3.8, .65, .5]);            
                color("silver") translate([1, 13.99, size[1]-.5]) cube([3.8, .65, .5]);            
                color("white") translate([1, 1.5, .5]) cube([2, 11, size[1]-.5]);
                for(i=[0:2:6]){ 
                    color("#fee5a6") translate([2.75, 3.9+i, adj]) rotate([0,0,0]) cube([.5, .64, 10]);
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
