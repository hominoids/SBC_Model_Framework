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

// storage class
module storage(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    len = mask[1];
    back = mask[2];
    style = mask[3];
    
    // micro sd card style 1
    if (type == "microsdcard") {
    
        size_x = 13.2;
        size_y = 14.1;
        size_xm = 13.5;
        size_ym = len;
   
        if(enablemask == true && cmask == true && style == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-.125, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+back, loc_y-.125, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.125, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.125, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.125, loc_y-size_ym+back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-.125, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.125, loc_y+size_y-back, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-size_ym+back, loc_y-.125, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }    
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {
                    for(loc_x = [.8:1.2:12]) {
                        color("#fee5a6") translate([loc_x, 0, 0]) cube([0.7, 13.5, 0.4]);
                    }
                    difference() {
                        color("silver") cube([size_x, size_y, 1.4]);
                        color("silver") translate([1, -.01, -1]) cube([9.6, 3.8, 5]);
                        color("silver") translate([0.2, -.1, 0.2]) cube([12.8, 13.7, 1]);
                    }
                }
        }
    }

    // micro sdcard style 2
    if(type == "microsdcard2") {
    
        size_x = 11.5;
        size_y = 5.5;        
        size_xm = 12;
        size_ym = len;
        size_zm = len;
        
        if(enablemask == true && cmask == true &&  (style == "default" || style == "slot")) {
            if(side == "top" && rotation == 0) {
                place(loc_x-.25, loc_y-len+back, loc_z+.25, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-len+back, loc_y-.25, loc_z+.25, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.25, loc_y+len-2.5-back, loc_z+.25, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+len-2.5-back, loc_y-.25, loc_z+.25, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.25, loc_y-len+back, loc_z+.25, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+len-2.5-back, loc_y-.25, loc_z+.25, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.25, loc_y+len-2.5-back, loc_z+.25, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-len+back, loc_y-.25, loc_z+.25, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, len, 2]);
            }
        
        }
        if(enablemask == true && cmask == true && style == "block") {
            if(side == "top" && rotation == 0) {
                place(loc_x-.25, loc_y-18+back, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-18+back, loc_y-.25, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.25, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.25, loc_y-18+back, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-.25, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-18+back, loc_y-.25, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
        }
        if(enablemask == false) { 
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {
                    difference () {
                        color("silver") cube([size_x, size_y, 2.5]);
                        color("black") translate([.5, -.5, .75]) cube([10.5, 5.5, 1]);
                    }
                }
        }
    }

    // micro sd card style 3
    if(type=="microsdcard3" || type=="microsdcard3_i") {
    
        size_x = 11.5;
        size_y = 5.5;
        size_xm = 12;
        size_ym = len;
        size_zm = len;
        
        if(enablemask == true && cmask == true && (style == "default" || style == "slot")) {
            // micro sdcard storage
             if(side == "top" && rotation == 0) {
                place(loc_x-.25, loc_y-len+back, loc_z+1.5, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 2]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-len+back, loc_y-.25, loc_z+1.5, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 2]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z+1.5, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 2]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.25, loc_z+1.5, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 2]);
            }
           if(side == "bottom" && rotation == 0) {
                place(loc_x-.25, loc_y-len+back, loc_z+1.5, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 2]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-.25, loc_z+1.5, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 2]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z+1.5, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 2]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-len+back, loc_y-.25, loc_z+1.5, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, 2]);
            }
        }
        if(enablemask == true && cmask == true && style == "block") {
            if(side == "top" && rotation == 0) {
                place(loc_x-.25, loc_y-18+back, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-18+back, loc_y-.25, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.25, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.25, loc_y-18+back, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y-.25, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.25, loc_y+size_y-back, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-18+back, loc_y-.25, loc_z, size_xm, 18, rotation, side, pcbsize_z)
                    cube([size_xm, 18, size_zm]);
            }
        }
        if(enablemask == false) {         
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {
                    difference () {
                        color("silver") cube([size_x, size_y, 3.5]);
                        color("black") translate([.5, -.5, 2]) cube([10.5, 5.5, 1]);
                    }
                }
        }
    }

    // sata single header type
    if(type=="sata_header" && enablemask == false) {
    
        size_x = 16;
        size_y = 4;
                      
        place(loc_x,loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {  
            difference () {
                union() {
                    color("dimgray") cube([size_x, size_y, 3]);
                    color("dimgray") translate([14, 0, 3]) cube([2, 4, 5]);
                    color("dimgray") translate([2, 1, 3]) cube([10, 2, 5]);
                }
                color("dimgray") translate([3, 0, 3]) cube([10, 2, 6]);
                color("dimgray") translate([13, 1, 3]) cube([2, 2, 6]);
                color("dimgray") translate([2, -1, -1]) cube([10, 6, 2.5]);
            }
            for (i=[1:1.27:8]) {
                color("gold") translate ([i+2.75, 1.75, 2.5]) cube([.84, .25, 5]);
            }           
        }
    }
    
    // sata and power enclosed verticle recepticle
    if(type=="sata_power_vrec" && enablemask == false) { 
      
        size_x = 40.43;
        size_y = 3.5; 
               
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        translate([38.3, 0, 0]) rotate([90, 0, 180])
        union() {
            difference() {
                union() {                
                    difference () {
                        color("black") translate([2.12, 0, 0]) cube([36.19, 8.5, 3.5]);
                        //color("black") translate([4.12, -1, -2]) cube([32.19, 4, 7]);
                    }
                    // side bottom
                    color("black") translate([0, 0, -.75]) cube([2.12, 1.5, 5]);
                    color("black") translate([38.31, 0, -.75]) cube([2.12, 1.5, 5]);
                    // side towers
                    color("black") translate([0, 1.499, .75]) cube([2.12, 8.5, 2]);
                    color("black") translate([38.31, 1.499, .75]) cube([2.12, 8.5, 2]);
                }
                // tower point trim
                color("black") translate([-1, 8.17, .69]) rotate ([0, 0, 45])
                cube([4.12, 4, 6]);
                color("black") translate([41.43, 8.17, .69]) rotate ([0, 0, 45])
                cube([2.12, 4, 6]);
                color("black") translate([0, 8.17, 4]) rotate ([-45, 0, 0])
                cube([3.12,4,2]);
                color("black") translate([37.31, 8.17, 4]) rotate ([-45, 0, 0])
                cube([3.12, 4, 2]);
                
                color("black") translate([0, 8.17, -3.25]) rotate ([45, 0, 0])
                cube([2.12, 6, 2]);
                color("black") translate([38.31, 8.17, -3.25]) rotate ([45, 0, 0])
                cube([3.12, 6, 2]);
                // connector cut outs
                color("dimgray") translate([3.5, 5.67, 2]) cube([21.5, 6, 1.15]);
                color("dimgray") translate([23.56, 5.67, .4]) cube([1.45, 6, 2.15]);
                color("dimgray") translate([27.01, 5.67, 2]) cube([10, 6, 1.15]);
                color("dimgray") translate([27.01, 5.67, .4]) cube([1.45, 6, 2.15]);
                
            }
            // pins
            for (i=[1:1.27:8]) {
                color("gold") translate ([i+28.25, 3.5, 2.25]) rotate([-90, 0, 0]) cube([.84, .25, 5]);
            }           
            for (i=[1:1.27:20]) {
                color("gold") translate ([i+3.25, 3.5, 2.25]) rotate([-90, 0, 0]) cube([.84, .25, 5]);
            }           
        }
    }
    
    // sata and power enclosed right angle
    if(type=="sata_encl_power") {
     
        size_x = 40.43;
        size_y = 12.87;
        size_xm = 42.5;
        size_zm = 7.5;
   
        if(enablemask == true && cmask == true && style == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-1, loc_y+14, loc_z+3, size_xm, len, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(size_zm, size_xm, len);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-1, loc_y+14, loc_z+3, size_xm, len, rotation, side, pcbsize_z)
                    rotate([90,0,0]) slot(size_zm, size_xm, len);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-1, loc_y+8, loc_z+3, size_xm, len, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(size_zm, size_xm, len);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+1, loc_y+8, loc_z+3, size_xm, len, rotation, side, pcbsize_z)
                    rotate([90, 0, 0]) slot(size_zm, size_xm, len);
            }
        
        }
        if(enablemask == false) {         
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {
                    difference() {
                        union() {                
                            difference () {
                                color("black") translate([2.12, 0, 0]) cube([36.19, 11.17, 4.3]);
                                color("black") translate([4.12, -1, -2]) cube([32.19, 4, 7]);
                            }
                            color("black") cube([2.12, 5.67, 4]);
                            color("black") translate([38.31, 0, 0]) cube([2.12, 5.67, 4]);
                            color("black") translate([0, 8, 1]) cube([2.12, 5.5, 2.55]);
                            color("black") translate([38.31, 8, 1]) cube([2.12, 5.5, 2.55]);
                        }
                        color("black") translate([1.12, 5.67,-.5]) cube([38.19, 5.7, 1]);
                        color("black") translate([-1, 11.17, .69]) rotate ([0, 0, 45])
                            cube([4.12, 4, 6]);
                        color("black") translate([41.43, 11.17, .69]) rotate ([0, 0, 45])
                            cube([2.12, 4, 6]);
                        color("black") translate([0, 11.17, 4]) rotate ([-45, 0, 0])
                            cube([3.12, 4, 2]);
                        color("black") translate([37.31, 11.17, 4]) rotate ([-45, 0, 0])
                            cube([3.12, 4,2]);
                        color("dimgray") translate([3.32, 5.67, 2.5]) cube([21.58, 6, 1.15]);
                        color("dimgray") translate([23.56, 5.67, 1.15]) cube([1.45, 6, 2.15]);
                        color("dimgray") translate([27.01, 5.67, 2.5]) cube([10, 6, 1.15]);
                        color("dimgray") translate([27.01, 5.67, 1.15]) cube([1.45, 6, 2.15]);
                        
                    }
                }
        }
    }
    
    // sata enclosed header style
    if(type=="sata_encl_header" && enablemask == false) {
    
        size_x = 16.9;
        size_y = 6.45;
        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {  
            difference () {
                union() {
                    color("dimgray") cube([size_x, size_y, 3]);
                    color("dimgray") translate([14, 1.25, 3]) cube([2, 4, 5]);
                    color("dimgray") translate([2, 2.25, 3]) cube([10, 2, 5]);
                }
                color("dimgray") translate([3, 1.25, 3]) cube([10, 2, 6]);
                color("dimgray") translate([13, 2.25, 3]) cube([2, 2, 6]);
                color("dimgray") translate([2, -1, -1]) cube([12, 8, 2.5]);
            }
            for (i=[1:1.27:8]) {
                color("gold") translate ([i+2.75, 3, 2.5]) cube([.84, .25, 5]);
            }
            color("dimgray") translate([0, 0, 3]) cube([16.9, 1, 5]);
            color("dimgray") translate([0, 0, 3]) cube([1, 6.45, 5]);
            color("dimgray") translate([15.9, 0, 3]) cube([1, 6.45, 5]);
            color("dimgray") translate([0, 5.45, 3]) cube([16.9, 1, 5]);
        }
    }
    
    // m.2 header style
    if(type=="m.2_header" && enablemask == false) {
    
        size_x = 22;
        size_y = 6.5;     
                   
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {  
            difference () {
                color("dimgray") cube([size_x, size_y, 5.2]);
                color("dimgray") translate([.88, -1, 2.48]) cube([20.15, 3.5, 2]);
                color("dimgray") translate([17.65, -1, 2.48]) cube([3.35, 5.25, .92]);
                color("dimgray") translate([.88, -1, 2.48]) cube([15.65, 5.25, .92]);
            }
            for (i=[.88:.5:3]) {
                color("gold") translate ([i+17.2, 2, 2.48]) cube([.25, 2, .25]);
            }
            for (i=[.88:.5:15]) {
                color("gold") translate ([i+.88, 2, 2.48]) cube([.25, 2, .25]);
            }
        }
        
    }
    
    // m.2 mounting stud
    if(type=="m.2_stud" && enablemask == false) {
    
        size_x = 0;
        size_y = 0;
                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        difference () {
            color("silver") cylinder(d=4, h=2.5);
            color("silver") translate([0, 0, -1]) cylinder(d=2, h=5);
        }
    }
}
