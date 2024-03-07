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


     CLASS NAME: audio
    DESCRIPTION: creates audio components.
           TODO: 

          USAGE: audio(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                       type = "audio_micro"
                      loc_x = x location placement
                      loc_y = y location placement
                      loc_z = z location placement
                       side = "top", "bottom"
                 rotation[] = object rotation
                  pcbsize_z = pcb thickness
                 enablemask = true produces mask, false produces model
                    mask[0] = component mask true, false
                    mask[1] = length
                    mask[2] = set back
                    mask[3] = mstyle "default"

                       type = "jack_3.5", "jack_3.5-2
                      loc_x = x location placement
                      loc_y = y location placement
                      loc_z = z location placement
                       side = "top", "bottom"
                 rotation[] = object rotation
                    size[0] = body size_x
                    size[1] = body size_y
                    size[2] = body size_z
                    data[0] = neck diameter
                    data[1] = z adjustment
                  pcbsize_z = pcb thickness
                 enablemask = true produces mask, false produces model
                    mask[0] = component mask true, false
                    mask[1] = length
                    mask[2] = set back
                    mask[3] = mstyle "default"

                       type = "mic_round"
                      loc_x = x location placement
                      loc_y = y location placement
                      loc_z = z location placement
                       side = "top", "bottom"
                 rotation[] = object rotation
                    size[0] = body diameter
                    size[1] = 
                    size[2] = body height
                  pcbsize_z = pcb thickness
                 enablemask = true produces mask, false produces model
                    mask[0] = component mask true, false
                    mask[1] = length
                    mask[2] = set back
                    mask[3] = mstyle "default"

                       type = "out-in-spdif"
                      loc_x = x location placement
                      loc_y = y location placement
                      loc_z = z location placement
                       side = "top", "bottom"
                 rotation[] = object rotation
                  pcbsize_z = pcb thickness
                 enablemask = true produces mask, false produces model
                    mask[0] = component mask true, false
                    mask[1] = length
                    mask[2] = set back
                    mask[3] = mstyle "default"

*/
 
module audio(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];
    adj = .01;
    $fn = 90;

    // out in and spdif stacked type
    if(type == "out-in-spdif") {

        size_x = 12.7;
        size_y = 21.5;
        size_z = 35;
        size_xm = 13;
        size_ym = mlen;
        size_zm = 35.5;

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
                        union() {
                            color("silver") cube([size_x, size_y, size_z]);
                            color("black") translate([6.35, -3.2, 17]) rotate([-90, 0, 0])
                                cylinder(d=8, h=6.25);
                            color("black") translate([6.35, -3.2, 29]) rotate([-90, 0, 0])
                                cylinder(d=8, h=6.25);
                            color("dimgray") translate([1.85, -2.0, 2]) cube([9, 2, 9]);
                        }
                        color("dimgray") translate([6.35, -3.25, 17]) rotate([-90, 0, 0])
                                cylinder(d=3.75, h=9);
                        color("dimgray") translate([6.35, -3.25, 29]) rotate([-90, 0, 0])
                                cylinder(d=3.75, h=9);
                        difference() {
                            color("dimgray") translate([2.85, -2.1, 3]) cube([7, 9, 7]);
                            color("dimgray") translate([1.85, -2, 3]) rotate([0, 45, 0]) cube([1.5, 9, 1.5]);
                            color("dimgray") translate([8.75, -2, 3]) rotate([0, 45, 0]) cube([1.5, 9, 1.5]);
                        }
                   }
                }
        }
    }

    // 3.5mm jack type
    if(type == "jack_3.5" || type == "jack_3.5-2") {

        size_x = size[0];
        size_y = size[1];
        size_z = size[2];
        size_xm = size_x+1;
        size_ym = size_y;
        size_zm = size_z+1;
        bdiam = data[0];
        badj = data[1];

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-.5, loc_y-2.5+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    union() {
                        cube([size_xm, 2.5, size_zm]);
                        translate([size_xm/2, 2, (size_z/2)+badj]) rotate([90, 0, 0]) cylinder(d=bdiam+1, h=mlen);
                        }
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-2.5+back, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    union() {
                        cube([size_xm, 2.5, size_zm]);
                        translate([size_xm/2, 2, (size_z/2)+badj]) rotate([90, 0, 0]) cylinder(d=bdiam+1, h=mlen);
                        }
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.5, loc_y+2.5-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    union() {
                        cube([size_xm, 2.5, size_zm]);
                        translate([size_xm/2, 2, (size_z/2)+badj]) rotate([90, 0, 0]) cylinder(d=bdiam+1, h=mlen);
                        }
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+2.5-back, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    union() {
                        cube([size_xm, 2.5, size_zm]);
                        translate([size_xm/2, 2, (size_z/2)+badj]) rotate([90, 0, 0]) cylinder(d=bdiam+1, h=mlen);
                        }
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.5, loc_y-2.5+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    union() {
                        cube([size_xm, 2.5, size_zm]);
                        translate([size_xm/2, 2, (size_z/2)+badj]) rotate([90, 0, 0]) cylinder(d=bdiam+1, h=mlen);
                        }
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+2.5-back, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    union() {
                        cube([size_xm, 2.5, size_zm]);
                        translate([size_xm/2, 2, (size_z/2)+badj]) rotate([90, 0, 0]) cylinder(d=bdiam+1, h=mlen);
                        }
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.5, loc_y+2.5-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    union() {
                        cube([size_xm, 2.5, size_zm]);
                        translate([size_xm/2, 2, (size_z/2)+badj]) rotate([90, 0, 0]) cylinder(d=bdiam+2, h=mlen);
                        }
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-2.5+back, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    union() {
                        cube([size_xm, 2.5, size_zm]);
                        translate([size_xm/2, 2, (size_z/2)+badj]) rotate([90, 0, 0]) cylinder(d=bdiam+1, h=mlen);
                        }
            }    
        }
        if(enablemask == false) {                     
            if(type == "jack_3.5") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {  
                    difference () {
                        union() {
                            color("silver") cube([size_x, 2, size_z]);
                            color("black") translate([0, 2-adj, 0]) cube([size_x, size_y, size_z]);
                            color("black") translate([size_x/2, -2, (size_z/2)+badj]) rotate([-90, 0, 0]) cylinder(d=bdiam, h=6.25);
                            }
                        color("dimgray") translate([size_x/2, -2.5, (size_z/2)+badj]) rotate([-90, 0, 0]) cylinder(d=3.5, h=6);
                    }
                }
            }
            if(type == "jack_3.5-2") {
                size_x = 6.5;
                size_y = 13.5;        
                place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                difference () {
                    union() {  
                        color("dimgray") cube([size_x,size_y,3]);
                        color("dimgray") translate([0,size_y-5.6,0]) cube([size_x,5.6,4]);
                        color("dimgray") translate([size_x/2,0,2.25]) rotate([270,0,0]) cylinder(d=6, h=size_y);
                    }
                    color("gray") translate([size_x/2,-1,2.25]) rotate([270,0,0]) cylinder(d=3, h=size_y+.01);
                }    
            }
        }
    }

    // audio micro connector type
    if(type == "audio_micro") {

        size_x = 7.5;
        size_y = 3.75;
        size_z = 4.75;
        size_xm = 7.5;
        size_ym = mlen;
        size_zm = 4;

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
            translate([size_xm, size_y+1.5, 3.75]) rotate([-90, 0, 180])
            union() {
                difference () {
                    color("white") cube([size_x, size_y, size_z]);
                    color("darkgray") translate([1.5, .5, 1]) cube([4.5, 2.75, 6]);
                    color("white") translate([-.5, .75, -.5]) cube([1, 2.5, 6]);
                    color("white") translate([7, .75, -.5]) cube([1, 2.5, 6]);
                    color("darkgray") translate([2.25, -.5, 1]) cube([3, 2, 6]);
                }
                color("silver") translate ([2.75, 2, .5]) cube([.6, .6, 4]);
                color("silver") translate ([4.5, 2, .5]) cube([.6, .6, 4]);
            }
        }
    }

    // mic_round type
    if(type == "mic_round" && enablemask == false) {

        size_x = size[0];
        size_y = size[0];
        size_z = size[2];

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {  
            color("silver") cylinder(d=size_x, h=size_z);
            color("#353535") translate ([0, 0, size_z-.01]) cylinder(d=size_x-.5, h=.15);
        }
    }
}
