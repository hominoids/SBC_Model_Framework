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

// heatsink class
module heatsink(type, loc_x, loc_y, loc_z, side, rotation, size_z, pcbsize_z, enablemask, mask) {

    // hardkernel c series heatsink
    if(enablemask ==  false && (type=="hc4_oem" || type=="c4_oem" || type=="c2_oem" || type=="c1+_oem")) {
    
        size_x = 58;
        size_y = 32;
     
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            translate([5.5, -23.5, size_z])
                difference() {
                    union() {        
                        color("gray", .6) cube([40, 32, 10]);
                        if(type=="hc4_oem") {
                            color("gray", .6) translate([39.99, 5, 0]) cube([5.5, 7, 2]);
                            color("gray", .6) translate([45.75, 8.5, 0]) cylinder(d=7, h=2);
                            color("gray", .6) translate([-5.49, 25, 0]) cube([5.5, 7, 2]);
                            color("gray", .6) translate([-5.5, 28.5, 0]) cylinder(d=7, h=2);
                            }
                            else {
                                color("gray", .6) translate([39.99, 0, 0]) cube([5.5, 7, 2]);
                                color("gray", .6) translate([45.75, 3.5, 0]) cylinder(d=7, h=2);
                                color("gray", .6) translate([-5.49, 20, 0]) cube([5.5, 7, 2]);
                                color("gray", .6) translate([-5.5, 23.5, 0]) cylinder(d=7, h=2);
                            }
                        }
                    // center channel and fins
                    color("gray", 1) translate([17.5, -1, 2]) cube([5, 34, 9]);
                    color("gray", 1) translate([1.5, -1, 2]) cube([1.25, 34, 9]);
                    for (i=[3.5:2.25:38]) {
                        color("gray", 1) translate([i, -1, 2]) cube([1.5, 34, 9]);
                    }
                    // fin elevations
                    color("gray", .6) translate([4, -1, 9]) cube([8, 34, 2]);
                    color("gray", .6) translate([28, -1, 9]) cube([8, 34, 2]);
                    color("gray", .6) translate([11, -1, 8]) cube([2, 34, 3]);
                    color("gray", .6) translate([27, -1, 8]) cube([2, 34, 3]);
                    color("gray", .6) translate([13, -1, 7]) cube([2, 34, 4]);
                    color("gray", .6) translate([25, -1, 7]) cube([2, 34, 4]);
                    color("gray", .6) translate([16, -1, 6]) cube([2, 34, 5]);
                    color("gray", .6) translate([22, -1, 6]) cube([2, 34, 5]);
                    // holes
                    if(type=="hc4_oem") {
                        color("gray", .6) translate([45.75, 8.5, -1]) cylinder(d=3, h=4);
                        color("gray", .6) translate([-5.5, 28.5, -1]) cylinder(d=3, h=4);
                        }
                        else {
                            color("gray", .6) translate([45.75, 3.5, -1]) cylinder(d=3, h=4);
                            color("gray", .6) translate([-5.5, 23.5, -1]) cylinder(d=3, h=4);
                        }
                }
    }
    // hardkernel xu4 and n2l heatsink
    if((type=="xu4_oem" || type=="n2l_oem") && enablemask ==  false) {
    
        $fn=60;
        size_x = 58;
        size_y = 40;
        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            translate([5.5, -30, size_z])
                difference() {
                    union() {
                        color("DeepSkyBlue", .6) cube([40, 40, 9.8]);
                        color("DeepSkyBlue", .6) translate([39.99, 6.5, 0]) cube([5.5, 7, 2]);
                        color("DeepSkyBlue", .6) translate([45.5, 10, 0]) cylinder(d=7, h=2);
                        color("DeepSkyBlue", .6) translate([-5.49, 26.5, 0]) cube([5.5, 7, 2]);
                        color("DeepSkyBlue", .6) translate([-5.5, 30, 0]) cylinder(d=7, h=2);
                    }
                    // fins
                    for (i=[1.5:2.25:38.5]) {
                            color("DeepSkyBlue",.6) translate([i,-1,2]) cube ([1.25,42,12]);
                    }
                    // cross opening
                    color("DeepSkyBlue",.6) translate([17.5,-1,2]) cube([5,42,10]);
                    color("DeepSkyBlue",.6) translate([-1,17.5,2]) cube([42,5,10]);
                    // fin elevations
                    color("DeepSkyBlue",.6) translate([4,-1,9]) cube([8,42,2]);
                    color("DeepSkyBlue",.6) translate([28,-1,9]) cube([8,42,2]);
                    color("DeepSkyBlue",.6) translate([11,-1,8]) cube([2,42,3]);
                    color("DeepSkyBlue",.6) translate([27,-1,8]) cube([2,42,3]);
                    color("DeepSkyBlue",.6) translate([13,-1,7]) cube([2.5,42,4]);
                    color("DeepSkyBlue",.6) translate([25,-1,7]) cube([2,42,4]);
                    color("DeepSkyBlue",.6) translate([16,-1,6]) cube([2,42,5]);
                    color("DeepSkyBlue",.6) translate([22,-1,6]) cube([2.5,42,5]);
                    // fan cut out
                    color("DeepSkyBlue",.6) translate([20,20,2]) cylinder(r=18, h=13.5, $fn=100);
                    // holes
                    color("DeepSkyBlue",.6) translate([45.5,10,-1]) cylinder(d=3, h=4);
                    color("DeepSkyBlue",.6) translate([-5.5,30,-1]) cylinder(d=3, h=4);
                }
    }
    
    // hardkernel xu4q and n2lq heatsink
    if((type == "xu4q_oem"  || type =="n2lq_oem") && enablemask ==  false) {

        $fn=60;
        size_x = 58;
        size_y = 40;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        translate([5.5,-30,size_z])
        difference() {
            union() {
                color("DeepSkyBlue",.6) cube([40, 40, 25]);
                color("DeepSkyBlue",.6) translate([39.99,6.5,0]) cube([5.5,7,2]);
                color("DeepSkyBlue",.6) translate([45.5,10,0]) cylinder(d=7, h=2);
                color("DeepSkyBlue",.6) translate([-5.49,26.5,0]) cube([5.5,7,2]);
                color("DeepSkyBlue",.6) translate([-5.5,30,0]) cylinder(d=7, h=2);
            }
            // fins
            for (i=[1.25:3.5:38.5]) {
                    color("DeepSkyBlue",.6) translate([i,-1,2]) cube ([2.5,42,25]);
            }
            for (i=[7.5:8:38.5]) {
                    color("DeepSkyBlue",.6) translate([-1,i,2]) cube ([42,1.5,25]);
            }
            // holes
            color("DeepSkyBlue",.6) translate([45.5,10,-1]) cylinder(d=3, h=4);
            color("DeepSkyBlue",.6) translate([-5.5,30,-1]) cylinder(d=3, h=4);
        }

    }
    // hardkernel n1 heatsink
    if((type == "n1_oem" || type == "40mm_active") && enablemask ==  false) {
        $fn=60;
        size_x = 58;
        size_y = 40;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        translate([5.5,-30,size_z])
        difference() {
            union() {
                color("white",.6) cube([40, 40, 9.8]);
                color("white",.6) translate([39.99,6.5,0]) cube([5.5,7,2]);
                color("white",.6) translate([45.5,10,0]) cylinder(d=7, h=2);
                color("white",.6) translate([-5.49,26.5,0]) cube([5.5,7,2]);
                color("white",.6) translate([-5.5,30,0]) cylinder(d=7, h=2);
            }
            // fins
            for (i=[1.5:2.25:38.5]) {
                    color("white",.6) translate([i,-1,2]) cube ([1.25,42,12]);
            }
            // cross opening
            color("white",.6) translate([17.5,-1,2]) cube([5,42,10]);
            color("white",.6) translate([-1,17.5,2]) cube([42,5,10]);
            // fin elevations
            color("white",.6) translate([4,-1,9]) cube([8,42,2]);
            color("white",.6) translate([28,-1,9]) cube([8,42,2]);
            color("white",.6) translate([11,-1,8]) cube([2,42,3]);
            color("white",.6) translate([27,-1,8]) cube([2,42,3]);
            color("white",.6) translate([13,-1,7]) cube([2.5,42,4]);
            color("white",.6) translate([25,-1,7]) cube([2,42,4]);
            color("white",.6) translate([16,-1,6]) cube([2,42,5]);
            color("white",.6) translate([22,-1,6]) cube([2.5,42,5]);
            // fan cut out
            color("white",.6) translate([20,20,2]) cylinder(r=18, h=13.5, $fn=100);
            // holes
            color("white",.6) translate([45.5,10,-1]) cylinder(d=3, h=4);
            color("white",.6) translate([-5.5,30,-1]) cylinder(d=3, h=4);
        }
    }
    
    // h3/h3+ hk heatsink
    if(type=="h3_oem" && enablemask ==  false) {
        size_x = 77;
        size_y = 72;                
        size_z = 27;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        difference() {
            union() {        
                color("gray",.6) translate([0,0,3]) cube([size_x,size_y,size_z]);
                }
            // center channel and fins
            color("gray",1) translate([13,-1,5]) cube([2,size_y+2,size_z]);
            color("gray",1) translate([47,-1,5]) cube([2,size_y+2,size_z]);
            for (i=[1:3.75:size_y]) {
                color("gray",1) translate([-1,i,5]) cube([size_x+2,3,size_z]);
            }
            // holes
            color("gray",.6) translate([30,14,-1]) cylinder(d=3, h=7);
            color("gray",.6) translate([73,14,-1]) cylinder(d=3, h=7);
            color("gray",.6) translate([30,51,-1]) cylinder(d=3, h=7);
            color("gray",.6) translate([73,51,-1]) cylinder(d=3, h=7);
            color("gray",.6) translate([26,10,5]) cube([8,8,size_z]);
            color("gray",.6) translate([69,10,5]) cube([8.2,8,size_z]);
            color("gray",.6) translate([26,47,5]) cube([8,8,size_z]);
            color("gray",.6) translate([69,47,5]) cube([8.2,8,size_z]);
            
        }
    }

    if(type=="m1s_oem" && enablemask ==  false) {
        $fn=60;
        size_x = 40;
        size_y = 40;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,pcbsize_z+size_z)
        difference() {
            union() {
                color("grey",.6) cube([40, 40, 8.35]);
                color("grey",.6) translate([5.15,39.99,0]) cube([6.2,4.16,2]);
                color("grey",.6) translate([8.25,44.15,0]) cylinder(d=6.2, h=2);
                color("grey",.6) translate([29.4,-4.14,0]) cube([6.2,4.16,2]);
                color("grey",.6) translate([32.55,-4.15,0]) cylinder(d=6.2, h=2);
            }
            // fins
            for (i=[1.35:2.25:38.5]) {
                    color("grey",.6) translate([-1,i,2]) cube ([42,1.25,12]);
            }
            // cross opening
            color("grey",.6) translate([-1,17.5,2]) cube([42,4.8,10]);
            // fin elevations
            color("grey",.6) translate([-1,16,6.11]) cube([42,8,3]);

            // holes
            color("grey",.6) translate([8.25,44.15,-1]) cylinder(d=3, h=4);
            color("grey",.6) translate([32.55,-4.15,-1]) cylinder(d=3, h=4);
        }
    }
    
    if(type=="atomicpi" && enablemask ==  false) {
        $fn=60;
        size_x = 70;
        size_y = 64;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z+size_z)
        difference() {
            color("grey",.8) cube([size_x, size_y, 32]);
            color("grey",.8) translate([-1,-1,-1]) cube([72,16,3.5]);
            color("grey",.8) translate([-1,size_y-15,-1]) cube([72,16,3.5]);
            // fins
            for (i=[1.5:4.5:size_y]) {
                    color("silver",.6) translate([-1,i,11]) cube ([72,2.75,22]);
            }
        }
    }
    
    // hardkernel n2 heatsink
    if(type=="n2_oem" && enablemask ==  false) {
        size_x = 90;
        size_y = 90;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,-3)
            color("gray") import("./lib/Odroid-N2_Heatsink.stl", convexity=3);
    }
    
    // hardkernel n2+ heatsink
    if(type=="n2+_oem" && enablemask ==  false) {
        size_x = 90;
        size_y = 90;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,-3)
            color("gray") import("./lib/Odroid-N2+_Heatsink.stl", convexity=3);
    }
    
    // hardkernel m1 heatsink
    if(type=="m1_oem" && enablemask ==  false) {
        size_x = 90;
        size_y = 122;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,-3)
            color("gray") translate([-.5,0,3]) import("./lib/Odroid-M1_Heatsink.stl", convexity=3);
    }
    
    // hardkernel h2 heatsink
    if(type=="h2_oem" && enablemask ==  false) {
        size_x = 90;
        size_y = 90;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,pcbsize_z+size_z)
        color("gray") import("./lib/Odroid-H2_Heatsink.stl", convexity=3);
    }
    
    // khadas heatsink without fan
    if(type=="khadas_oem" && enablemask ==  false) {
        size_x = 82;
        size_y = 48;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("gray",.6) import("./lib/Khadas_Heatsink.stl", convexity=3);
    }
    
    // khadas heatsink with fan
    if(type=="khadas_fan_oem" && enablemask ==  false) {
        size_x = 82;
        size_y = 48;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("gray",.6) import("./lib/Khadas_Heatsink_Fan.stl", convexity=3);
    }
    
    // radxa heatsink
    if(type=="radxa_oem" && enablemask ==  false) {
        size_x = 82;
        size_y = 56;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,pcbsize_z+size_z)
        color("gray",.6) import("./lib/Radxa_Heatsink.stl", convexity=3);
    }
    
    // RPi5 heatsink
    if(type=="rpi5_oem" && enablemask ==  false) {
        size_x = 58;
        size_y = 32;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side,pcbsize_z+size_z)

        difference() {
            union() {        
                color("lightgray",.6) linear_extrude(height = 2) import("lib/rpi5_oem.dxf");
                translate([6,2.5,2-.01])color("lightgray",.6) cube([20,40,8]);
                difference() {
                    union() {
                        translate([27,11.75,2-.01])color("black",.6) cube([30,30,8]);
                        translate([27,11.75,10-.01])color("lightgray",.6) cube([30,30,.25]);
                    }
                    translate([42,26.75,2-.01])color("black",.6) cylinder(d=21, h=9);
                    translate([31,39,2-.01])color("black",.6) cylinder(d=3, h=9);
                    translate([54,14,2-.01])color("black",.6) cylinder(d=3, h=9);
                    translate([54,39,2-.01])color("black",.6) cylinder(d=3, h=9);
                    }
                }
            // fins
            for (i=[4.75:3.5:25]) {
                color("lightgray",.6) translate([i,-1,2]) cube([1.75,44,8]);
            }
            for (i=[5.35:4.625:40]) {
                color("lightgray",.6) translate([-1,i,3]) cube([28,2,8]);
            }
        } 
    }}
