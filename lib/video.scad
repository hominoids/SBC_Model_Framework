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
 
// video class
module video(x,y,rotation,side,type,pcbsize_z) {
    
    // hdmi a type connector
    if(type=="hdmi_a") {
        size_x = 14.5;
        size_y = 11.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([0,0,.75])
        union() { 
            difference() {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 5.5]);
                color("dimgray") translate([.5,-.1,.5]) cube([13.5, 11, 4.5]);
                color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=13.5,$fn=30);
                color("silver") translate([14.5,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=13.5,$fn=30);
            }
            difference() {
                union() {
                    color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=11.5,$fn=30);
                    color("silver") translate([14.5,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=11.5,$fn=30);
                }               
                color("silver") translate([0,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=3, h=13.5,$fn=30);
                color("silver") translate([14.5,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=3, h=13.5,$fn=30);
                color("silver") translate([-3,-1,-3]) cube([3,13.5,7.5]);
                color("silver") translate([14.5,-1,-3]) cube([3,13.5,7.5]);
                color("silver") translate([-1,-1,-3]) cube([16.5,13.5,3]);
                }
            color("black") translate([2.5,.5,2.25]) cube([9.25,10.5,1.5]);
        }
    }
    
    // hdmi a type connector
    if(type=="hdmi_a_vertical") {
        size_x = 14.5;
        size_y = 11.5;
        height = .4;      
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([0,0,14.5+height]) rotate([0,90,0])
        union() { 
            difference() {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 5.5]);
                color("dimgray") translate([.5,-.1,.5]) cube([13.5, 11, 4.5]);
                color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=13.5,$fn=30);
                color("silver") translate([14.5,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=13.5,$fn=30);
            }
            difference() {
                union() {
                    color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=11.5,$fn=30);
                    color("silver") translate([14.5,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=4, h=11.5,$fn=30);
                }               
                color("silver") translate([0,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=3, h=13.5,$fn=30);
                color("silver") translate([14.5,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=3, h=13.5,$fn=30);
                color("silver") translate([-3,-1,-3]) cube([3,13.5,7.5]);
                color("silver") translate([14.5,-1,-3]) cube([3,13.5,7.5]);
                color("silver") translate([-1,-1,-3]) cube([16.5,13.5,3]);
                }
            difference() {
                color("silver") translate([0,6,0]) cube([15,15.75,5.5]);
                color("silver") translate([-6,6,-.25]) rotate([0,0,45]) cube([25,10,6]);
            }
            color("silver") translate([14.5,4,1.75]) cube([height,17.75,3.75]);
            color("black") translate([2.5,.5,2.25]) cube([9.25,10.5,1.5]);
        }
    }
    
    // display port and hdmi stacked
    if(type=="dp-hdmi_a") {
        size_x = 18;
        size_y = 17.75;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference() {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 19]);
                translate([2,-.7,1.5]) color("dimgray") cube([14.5, 11.5, 5.5]);
                translate([1.5,-.7,12.5]) color("dimgray") cube([15, 17.5, 5.5]);
            }         
            translate([2,-.7,1.5]){
                difference() {
                    color("silver") translate([0,0,0]) cube([14.5, 11.5, 5.5]);
                    color("dimgray") translate([.5,-.1,.5]) cube([13.5, 11, 4.5]);
                    color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                        cylinder(d=4, h=13.5,$fn=30);
                    color("silver") translate([14.5,-.1,0]) rotate ([-90,0,0]) 
                        cylinder(d=4, h=13.5,$fn=30);
                }
                difference() {
                    union() {
                        color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                        cylinder(d=4, h=11.5,$fn=30);
                        color("silver") translate([14.5,-.1,0]) rotate ([-90,0,0]) 
                        cylinder(d=4, h=11.5,$fn=30);
                    }               
                    color("silver") translate([0,-.2,0]) rotate ([-90,0,0]) 
                        cylinder(d=3, h=13.5,$fn=30);
                    color("silver") translate([14.5,-.2,0]) rotate ([-90,0,0]) 
                        cylinder(d=3, h=13.5,$fn=30);
                    color("silver") translate([-3,-1,-3]) cube([3,13.5,7.5]);
                    color("silver") translate([14.5,-1,-3]) cube([3,13.5,7.5]);
                    color("silver") translate([-1,-1,-3]) cube([16.5,13.5,3]);
                    }
                color("black") translate([2.5,.5,2.25]) cube([9.25,10.5,1.5]);
            }
            color("black") translate([2.5,.5,14.5]) cube([13,10.5,1.5]);
            color("silver") translate([0,0,12.5]) rotate([0,45,0]) cube([2,17.5,2]);
            color("silver") translate([-.5,0,13]) cube([.6,.5,4.5]);
            color("silver") translate([17.9,0,13]) cube([.6,.5,4.5]);
            color("silver") translate([2,0,18.9]) cube([14,.5,.5]);
        }
    }
    
    // hdmi micro connector
    if(type=="hdmi_micro") {
        size_x = 6.5;
        size_y = 7.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)        
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 2.9]);
                color("dimgray") translate([.25,-.25,.25]) cube([size_x-.5, size_y-.5, 2.4]);
                color("silver") translate([-.5,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=7.7,$fn=30);
                color("silver") translate([7,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=7.7,$fn=30);

            }
            difference() {
                union() {
                    color("silver") translate([-.5,0,0]) rotate ([-90,0,0]) 
                        cylinder(d=2.5, h=8.5,$fn=30);
                    color("silver") translate([7,0,0]) rotate ([-90,0,0]) 
                        cylinder(d=2.5, h=8.5,$fn=30);
                }               
                color("silver") translate([-.25,-.2,.15]) rotate ([-90,0,0]) 
                    cylinder(d=1.5, h=8.5,$fn=30);
                color("silver") translate([6.75,-.2,.15]) rotate ([-90,0,0]) 
                    cylinder(d=1.5, h=8.5,$fn=30);
                
                color("silver") translate([-3,-1,-3]) cube([3,10.5,7.5]);
                color("silver") translate([6.5,-1,-3]) cube([3,10.5,7.5]);
                color("silver") translate([-1,-1,-3]) cube([9,10.5,3]);
                color("silver") translate([-1,7.5,-3]) cube([9,6.5,9]);
                }
            color("black") translate([1.375,.5,1]) cube([4,3.5,1.2]);
        }
    }
    
    // hdmi mini connector
    if(type=="hdmi_mini") {
        size_x = 11.2;
        size_y = 8;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)        
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 3.2]);
                color("dimgray") translate([.25,-.25,.25]) cube([size_x-.5, size_y-.5, 2.7]);
                color("silver") translate([-.5,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=8.7,$fn=30);
                color("silver") translate([11.75,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=8.7,$fn=30);

            }
            difference() {
                union() {
                    color("silver") translate([-.5,0,0]) rotate ([-90,0,0]) 
                        cylinder(d=2.5, h=8.5,$fn=30);
                    color("silver") translate([11.75,0,0]) rotate ([-90,0,0]) 
                        cylinder(d=2.5, h=8.5,$fn=30);
                }               
                color("silver") translate([-.25,-.2,.25]) rotate ([-90,0,0]) 
                    cylinder(d=1.25, h=8.5,$fn=30);
                color("silver") translate([11.4,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=1.25, h=9,$fn=30);
                
                color("silver") translate([-3,-1,-3]) cube([3,10.5,7.5]);
                color("silver") translate([11.2,-1,-3]) cube([3,10.5,7.5]);
                color("silver") translate([-1,-1,-3]) cube([13,10.5,3]);
                color("silver") translate([-1,8,-3]) cube([14,6.5,9]);
                }
            color("black") translate([1.5,.5,1]) cube([8,3.5,1.2]);
        }
    }
    
    // display port mini connector
    if(type=="dp_mini") {
        size_x = 8.5;
        size_y = 13.65;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)        
        union() {    
            difference () {
                difference() {
                    color("silver") translate([0,0,0]) cube([size_x, size_y, 5.6]);
                    color("silver") translate([-7.5,-1,1]) rotate([0,45,0]) cube([size_x, size_y+2, 5.6]);
                    color("silver") translate([10,-1,-5]) rotate([0,-45,0]) cube([size_x, size_y+2, 5.6]);                    
                }
                difference() {
                    color("dimgray") translate([.5,-.25,.5]) cube([size_x-1, size_y-.5, 4.6]);
                    color("silver") translate([-6.75,-1,1]) rotate([0,45,0]) cube([size_x, size_y, 5.6]);
                    color("silver") translate([9.4,-1,-5]) rotate([0,-45,0]) cube([size_x, size_y, 5.6]);
                }
            }
            color("black") translate([1.5,.5,2.25]) cube([5.5,size_y-.5,1.2]);
        }
    }
    
    // mipi csi port
    if(type=="mipi_csi") {
        size_x = 21;
        size_y = 3;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference() {
                color("white") cube([size_x, size_y, 5]);
                color("white") translate([-1,-1,3.5]) cube([23,3.5,5]);
                color("white") translate([-1,-1,3.5]) cube([3,5,5]);
                color("white") translate([19,-1,3.5]) cube([3,5,5]);
            }
            difference() {
                color("black") translate([-1,0,3.5]) cube([23,3.5,1]);
                color("dimgrey") translate([2,2.9,3.49]) cube([17,3,2]);
            }
        }
    }
    // mipi dsi port
    if(type=="mipi_dsi") {
        size_x = 10;
        size_y = 3;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") cube([size_x, 1.5, 2]);
            color("saddlebrown") translate([0,1.5,0]) cube([size_x, 1.5, 2]);
        }
    }
}
