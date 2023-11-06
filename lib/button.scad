/*
    This file is part of SBC Model Framework https://github.com/hominoids/SBC_Model_Framework
    Copyright 2016,2017,2018,2019,2020,2021,2022 Edward A. Kisiel hominoid@cablemi.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    Code released under GPLv3: http://www.gnu.org/licenses/gpl.html


*/
 
// button class
module button(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    len = mask[1];
    back = mask[2];
    style = mask[3];
    
    // tall button type
    if(type=="momentary_6x6x9") {
    
        size_x = 6;
        size_y = 6;
        size_xm = 5;
        size_ym = 5;
   
        if(enablemask == true && cmask == true && style == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+size_x/2, loc_y+size_y/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+13);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+size_x/2, loc_y-size_y/3, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+13);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-size_x/3, loc_y-size_y/3, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+13);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-size_x/3, loc_y+size_y/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+13);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-size_x/3, loc_y+size_y/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+13);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-size_x/3, loc_y-size_y/3, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+13);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+size_x/2, loc_y-size_y/3, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+13);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+size_x/2, loc_y+size_y/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+13);
            }    
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {
                    color("silver") cube([size_x, size_y, 3.5]);
                    color("black") translate([3, 3, 3.5]) cylinder(r=1.6, h=9, $fn=30);
                    color("black") translate([1, 1, 3.5]) sphere(d=1);
                    color("black") translate([1, 5, 3.5]) sphere(d=1);
                    color("black") translate([5, 1, 3.5]) sphere(d=1);
                    color("black") translate([5, 5, 3.5]) sphere(d=1);
                }
        }
    }
    
    if(type=="momentary_6x6x4") {
    
        size_x = 6;
        size_y = 6;
        size_xm = 5;
        size_ym = 5;
   
        if(enablemask == true && cmask == true && style == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+size_x/2, loc_y+size_y/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+size_x/2, loc_y-size_y/3, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-size_x/3, loc_y-size_y/3, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-size_x/3, loc_y+size_y/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-size_x/3, loc_y+size_y/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-size_x/3, loc_y-size_y/3, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+size_x/2, loc_y-size_y/3, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+size_x/2, loc_y+size_y/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cylinder(d = size_xm, h = len+6.5);
            }    
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {
                    color("silver") cube([size_x, size_y, 3.5]);
                    color("black") translate([3, 3, 3.5]) cylinder(r=1.6, h=2.5, $fn=30);
                    color("black") translate([1, 1, 3.5]) sphere(d=1);
                    color("black") translate([1, 5, 3.5]) sphere(d=1);
                    color("black") translate([5, 1, 3.5]) sphere(d=1);
                    color("black") translate([5, 5, 3.5]) sphere(d=1);
                }
        }
    }

    if(type == "momentary_6x6x4_90") {
    
        size_x = 6;
        size_y = 6;
        size_xm = 5;
        size_ym = 3.5;
   
        if(enablemask == true && cmask == true && style == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+size_x/2, loc_y+back, loc_z+3, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back, loc_y-size_y/3, loc_z+3, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-size_x/3, loc_y-back, loc_z+3, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-back, loc_y+size_y/2, loc_z+3, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-size_x/3, loc_y+back, loc_z+3, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back, loc_y-size_y/3, loc_z+3, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+size_x/2, loc_y-back, loc_z+3, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = len+6.5);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y+size_y/2, loc_z+3, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d = size_xm, h = len+6.5);
            }    
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, 3.5, rotation, side, pcbsize_z)
                union() {
                    color("silver") cube([size_x, 3.5, size_y]);
                    color("black")  rotate([90, 0, 0]) translate([3, 3, -.01]) cylinder(r=1.6, h=2.5, $fn=30);
                    color("black") translate([1, 0, 1]) sphere(d=1);
                    color("black") translate([1, 0, 5]) sphere(d=1);
                    color("black") translate([5, 0, 1]) sphere(d=1);
                    color("black") translate([5, 0, 5]) sphere(d=1);
                }
        }
    }
    
    if(type == "momentary_4x2x1_90") {
    
        size_x = 4;
        size_y = 2;
        size_xm = 4;
        size_ym = 4;
   
        if(enablemask == true && cmask == true && style == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+.5, loc_y+back, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) slot(2, 3, len);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back, loc_y-.5, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) slot(2, 3, len);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.5, loc_y-size_y-back, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) slot(2, 3, len);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-size_y-back, loc_y+.5, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) slot(2, 3, len);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.5, loc_y+back, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) slot(2, 3, len);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-size_y-back, loc_y-.5, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) slot(2, 3, len);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+.5, loc_y-size_y-back, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) slot(2, 3, len);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y+.5, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) slot(2, 3, len);
            }    
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {    
                    color("silver") cube([size_x, size_y, 2]);
                    color("white") translate([1, -.9, .5]) cube([2, 1.5, 1]);
                }
        }
    }

    if(type == "momentary_4x2x1") {
    
        size_x = 4;
        size_y = 2;
        size_xm = 4;
        size_ym = 4;
   
        if(enablemask == true && cmask == true && style == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+.5, loc_y+1, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      slot(2, 3, len);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+1, loc_y-.5, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      slot(2, 3, len);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.5, loc_y-size_y-1, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      slot(2, 3, len);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-size_y-1, loc_y+.5, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      slot(2, 3, len);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.5, loc_y+1, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([0, 0, 0]) slot(2, 3, len);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-size_y-1, loc_y-.5, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([0, 0, 0]) slot(2, 3, len);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+.5, loc_y-size_y-1, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([0, 0, 0]) slot(2, 3, len);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+1, loc_y+.5, loc_z+1, size_xm, size_ym, rotation, side, pcbsize_z)
                      slot(2, 3, len);
            }    
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {    
                    color("silver") cube([size_x, size_y, 2]);
                    color("white") translate([1, .5, 1.5]) cube([2, 1, 1.5]);
                }
        }
    }
    
    if(type=="momentary_7x3x3_90") {
    
        size_x = 7;
        size_y = 3;                
        size_xm = 7;
        size_ym = 3;
   
        if(enablemask == true && cmask == true && style == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+1, loc_y+back, loc_z+1.65, size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) slot(2.5, 5, len);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back, loc_y-1, loc_z+1.65, size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) slot(2.5, 5, len);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-1, loc_y-back, loc_z+1.65, size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) slot(2.5, 5, len);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-back, loc_y+1, loc_z+1.65, size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) slot(2.5, 5, len);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-1, loc_y+back, loc_z+1.65, size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) slot(2.5, 5, len);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back, loc_y-1, loc_z+1.65, size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) slot(2.5, 5, len);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+1, loc_y-back, loc_z+1.65, size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) slot(2.5, 5, len);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y+1, loc_z+1.65, size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) slot(2.5, 5, len);
            }    
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {    
                    color("silver") cube([size_x, size_y, 3.5]);
                    color("black") translate([1.5, -1.4, 1]) cube([4, 1.5, 1.5]);
                }
        }
    }
    if(type=="momentary_4.5x3.5x2.5_90") {
    
        size_x = 4.5;
        size_y = 2.5;
        size_z = 3.5;                
        size_xm = 4.5;
        size_ym = 3.5;

        if(enablemask == true && cmask == true && style == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+(size_x/2), loc_y+back, loc_z+(size_z/2), size_xm, size_ym, rotation, side, pcbsize_z)
                      rotate([90, 0, 0]) cylinder(d=3.5, h=len);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back, loc_y-(size_x/2), loc_z+(size_z/2), size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) cylinder(d=3.5, h=len);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_x/2), loc_y-back, loc_z+(size_z/2), size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) cylinder(d=3.5, h=len);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-back, loc_y+(size_x/2), loc_z+(size_z/2), size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) cylinder(d=3.5, h=len);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-(size_x/2), loc_y+back, loc_z+(size_z/2), size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) cylinder(d=3.5, h=len);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back, loc_y-(size_x/2), loc_z+(size_z/2), size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) cylinder(d=3.5, h=len);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x+(size_x/2), loc_y-back, loc_z+(size_z/2), size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) cylinder(d=3.5, h=len);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y+(size_x/2), loc_z+(size_z/2), size_xm, size_ym, rotation, side, pcbsize_z)
                     rotate([90, 0, 0]) cylinder(d=3.5, h=len);
            }    
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("silver") translate([0,0,0]) cube([size_x,size_y,3.5]);
                color("black") translate([2.25,0.01,1.75]) rotate([90, 0, 0]) cylinder(r=1,h=1,$fn=30);
            }
        }
    }
}
