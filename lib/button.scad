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
    // tall button type
    if(type=="momentary_6x6x9") {
        size_x = 6;
        size_y = 6;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color("silver") translate([0,0,0]) cube([size_x,size_y,3.5]);
            color("black") translate([3,3,3.5]) cylinder(r=1.6,h=9,$fn=30);
            color("black") translate([1,1,3.5]) sphere(d=1);
            color("black") translate([1,5,3.5]) sphere(d=1);
            color("black") translate([5,1,3.5]) sphere(d=1);
            color("black") translate([5,5,3.5]) sphere(d=1);
        }
    }
    if(type=="momentary_6x6x4") {
        size_x = 6;
        size_y = 6;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color("silver") translate([0,0,0]) cube([size_x,size_y,3.5]);
            color("black") translate([3,3,3.5]) cylinder(r=1.6,h=2.5,$fn=30);
            color("black") translate([1,1,3.5]) sphere(d=1);
            color("black") translate([1,5,3.5]) sphere(d=1);
            color("black") translate([5,1,3.5]) sphere(d=1);
            color("black") translate([5,5,3.5]) sphere(d=1);
        }
    }
    if(type=="momentary_6x6x4_90") {
        size_x = 6;
        size_y = 6;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        rotate([90, 0, 0]) union() {
            color("silver") translate([0,0,0]) cube([size_x,size_y,3.5]);
            color("black") translate([3,3,3.5]) cylinder(r=1.6,h=2.5,$fn=30);
            color("black") translate([1,1,3.5]) sphere(d=1);
            color("black") translate([1,5,3.5]) sphere(d=1);
            color("black") translate([5,1,3.5]) sphere(d=1);
            color("black") translate([5,5,3.5]) sphere(d=1);
        }
    }
    if(type=="momentary_4x2x1") {
        size_x = 4;
        size_y = 2;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {    
            color("silver") translate([0,0,0]) cube([size_x, size_y, 2]);
            color("white") translate([1,size_y,.5]) cube([2, 1.5, 1]);
        }
    }
    if(type=="momentary_7x3x3_90") {
        size_x = 7;
        size_y = 3;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {    
            color("silver") translate([0,0,0]) cube([size_x, size_y, 3]);
            color("black") translate([1.5,-1.4,.5]) cube([4, 1.5, 1.5]);
        }
    }
}
