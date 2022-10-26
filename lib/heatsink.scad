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
module heatsink(x,y,rotation,side,type,pcbsize_z,soc1size_z) {
    
    // hardkernel c series heatsink
    if(type=="hc4_oem" || type=="c4_oem" || type=="c2_oem" || type=="c1+_oem") {
        size_x = 58;
        size_y = 32;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([5.5,-23.5,soc1size_z])
        difference() {
            union() {        
                color("gray",.6) cube([40,32,10]);
                if(type=="hc4_oem") {
                    color("gray",.6) translate([39.99,5,0]) cube([5.5,7,2]);
                    color("gray",.6) translate([45.75,8.5,0]) cylinder(d=7, h=2);
                    color("gray",.6) translate([-5.49,25,0]) cube([5.5,7,2]);
                    color("gray",.6) translate([-5.5,28.5,0]) cylinder(d=7, h=2);
                    }
                    else {
                        color("gray",.6) translate([39.99,0,0]) cube([5.5,7,2]);
                        color("gray",.6) translate([45.75,3.5,0]) cylinder(d=7, h=2);
                        color("gray",.6) translate([-5.49,20,0]) cube([5.5,7,2]);
                        color("gray",.6) translate([-5.5,23.5,0]) cylinder(d=7, h=2);
                    }
                }
            // center channel and fins
            color("gray",1) translate([17.5,-1,2]) cube([5,34,9]);
            color("gray",1) translate([1.5,-1,2]) cube([1.25,34,9]);
            for (i=[3.5:2.25:38]) {
                color("gray",1) translate([i,-1,2]) cube([1.5,34,9]);
            }
            // fin elevations
            color("gray",.6) translate([4,-1,9]) cube([8,34,2]);
            color("gray",.6) translate([28,-1,9]) cube([8,34,2]);
            color("gray",.6) translate([11,-1,8]) cube([2,34,3]);
            color("gray",.6) translate([27,-1,8]) cube([2,34,3]);
            color("gray",.6) translate([13,-1,7]) cube([2,34,4]);
            color("gray",.6) translate([25,-1,7]) cube([2,34,4]);
            color("gray",.6) translate([16,-1,6]) cube([2,34,5]);
            color("gray",.6) translate([22,-1,6]) cube([2,34,5]);
            // holes
            if(type=="hc4_oem") {
                color("gray",.6) translate([45.75,8.5,-1]) cylinder(d=3, h=4);
                color("gray",.6) translate([-5.5,28.5,-1]) cylinder(d=3, h=4);
                }
                else {
                    color("gray",.6) translate([45.75,3.5,-1]) cylinder(d=3, h=4);
                    color("gray",.6) translate([-5.5,23.5,-1]) cylinder(d=3, h=4);
                }
        }
    }
    // hardkernel xu4 heatsink
    if(type=="xu4_oem") {
        $fn=60;
        size_x = 58;
        size_y = 40;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([5.5,-30,soc1size_z])
        difference() {
            union() {
                color("DeepSkyBlue",.6) cube([40, 40, 9.8]);
                color("DeepSkyBlue",.6) translate([39.99,6.5,0]) cube([5.5,7,2]);
                color("DeepSkyBlue",.6) translate([45.5,10,0]) cylinder(d=7, h=2);
                color("DeepSkyBlue",.6) translate([-5.49,26.5,0]) cube([5.5,7,2]);
                color("DeepSkyBlue",.6) translate([-5.5,30,0]) cylinder(d=7, h=2);
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
    
    // hardkernel xu4q heatsink
    if(type=="xu4q_oem") {
        $fn=60;
        size_x = 58;
        size_y = 40;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([5.5,-30,soc1size_z])
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
    if(type=="n1_oem" || type=="40mm_active") {
        $fn=60;
        size_x = 58;
        size_y = 40;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([5.5,-30,soc1size_z])
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
    
    // hardkernel n2 heatsink
    if(type=="n2_oem") {
        size_x = 90;
        size_y = 90;                
        place(x,y,size_x,size_y,rotation,side,type,-3)
        color("gray") import("Odroid-N2_Heatsink.stl", convexity=3);
    }
    
    // hardkernel n2+ heatsink
    if(type=="n2+_oem") {
        size_x = 90;
        size_y = 90;                
        place(x,y,size_x,size_y,rotation,side,type,-3)
        color("gray") import("Odroid-N2+_Heatsink.stl", convexity=3);
    }
    
    // hardkernel m1 heatsink
    if(type=="m1_oem") {
        size_x = 90;
        size_y = 122;                
        place(x,y,size_x,size_y,rotation,side,type,-3)
        color("gray") translate([-.5,0,3]) rotate([0,0,0]) import("Odroid-M1_Heatsink.stl", convexity=3);
    }
    
    // hardkernel h2 heatsink
    if(type=="h2_oem") {
        size_x = 90;
        size_y = 90;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z+soc1size_z)
        color("gray") import("Odroid-H2_Heatsink.stl", convexity=3);
    }
    
    // khadas heatsink without fan
    if(type=="khadas_oem") {
        size_x = 82;
        size_y = 48;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("gray",.6) import("Khadas_Heatsink.stl", convexity=3);
    }
    
    // khadas heatsink with fan
    if(type=="khadas_fan_oem") {
        size_x = 82;
        size_y = 48;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("gray",.6) import("Khadas_Heatsink_Fan.stl", convexity=3);
    }
    
    // radxa heatsink
    if(type=="radxa_oem") {
        size_x = 82;
        size_y = 56;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z+soc1size_z)
        color("gray",.6) import("Radxa_Heatsink.stl", convexity=3);
    }
}
