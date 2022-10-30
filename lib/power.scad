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
 
// power class
module plug(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask) {
    
    // 2.5mm power plug 7.5mm
    if(type=="pwr2.5_5x7.5") {
        size_x = 5;
        size_y = 7.5;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 4]);
                color("black") translate([2.5,-1,2]) rotate([90,0,0]) 
                cylinder(d=3, h=7, center=true, $fn=30);
            }
            color("white") translate([2.5,3,2]) rotate([90,0,0]) 
            cylinder(d=1, h=2,$fn=30);
        }
    }

    // 5.5mm power plug 7.5mm x 11.5mm
    if(type=="pwr5.5_7.5x11.5") {
        size_x = 7.6;
        size_y = 11.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 9.75]);
                color("black") translate([3.8,10,6.5]) rotate([90,0,0]) 
                cylinder(r=3, h=11, $fn=30);
            }
            color("white") translate([3.8,10,6.5]) rotate([90,0,0]) 
            cylinder(d=1.5, h=9,$fn=30);
        }
    }
    
    // 5.5mm power plug 10mm x 10mm
    if(type=="pwr5.5_10x10") {
        size_x = 10;
        size_y = 13.36;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 10]);
                color("black") translate([5,10,5]) rotate([90,0,0]) 
                cylinder(r=3, h=11, $fn=30);
            }
            color("white") translate([5,10,5]) rotate([90,0,0]) 
            cylinder(d=1.5, h=9,$fn=30);
        }
    }
    
    // 5.5mm power plug 9.5mm x 7mm
    if(type=="pwr5.5_9.5x7") {
        size_x = 9.5;
        size_y = 9.5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 7]);
                color("black") translate([5.7,8.49,3.5]) rotate([90,0,0]) 
                cylinder(d=3.35, h=8.5, $fn=30);
            }
            color("white") translate([5.7,8.5,3.5]) rotate([90,0,0]) 
            cylinder(d=1.4, h=8.5,$fn=30);
        }
    }
    
    // molex power 4x1 connector type
    if(type=="molex_4x1") {
        size_x = 23;
        size_y = 8;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference() {
                union() {                
                    difference () {
                        color("white") translate([0,0,0]) cube([size_x,size_y,10]);
                        color("darkgray") translate([.5,.5,2]) cube([22,7,11]);
                    }
                    color("white") translate([-.9,5.5,0]) rotate([0,0,-45]) 
                    cube([1,4,10]);
                    color("white") translate([23,5,0]) rotate([0,0,45]) 
                    cube([1,4,10]);
                }               
                color("white") translate([-1,0,-.5]) cube([1,9,11]);
                color("white") translate([23,0,-.5]) cube([2,9,11]);
                color("white") translate([-1,8,-.5]) cube([25,3,11]);
                color("white") translate([-1.7,7.5,-.5]) rotate([0,0,-45])
                cube([2.25,4,11]);
                color("white") translate([23.1,6,-.5]) rotate([0,0,45])
                cube([3,4,11]);
            }
            for (i=[3.75:5:20]) {
                color("silver") translate ([i,4,2]) cylinder(d=2,h=7, $fn=30);
            }
        }
    }
    
    // sata small power 4x1 connector type
    if(type=="small_encl_satapwr") {
        size_x = 12.7;
        size_y = 6.6;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            union() {                
                difference () {
                    color("white") translate([0,0,0]) cube([size_x,size_y,8]);
                    color("darkgray") translate([.5,.5,2]) cube([11.7,5.6,11]);
                }
            }               
            for (i=[2.54:2.54:11.7]) {
                color("silver") translate ([i,4,2]) cylinder(d=.67,h=6, $fn=30);
            }
       }
   }
}
