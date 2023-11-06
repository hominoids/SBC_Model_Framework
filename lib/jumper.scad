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

// jumper class
module jumper(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    len = mask[1];
    back = mask[2];
    style = mask[3];
    
    // 2x1 type
    if(type=="header_2x1" && enablemask == false) {
        size_x = 5;
        size_y = 2.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            color("#fee5a6") translate ([1,1,2.5]) cube([.64,.64,5]);
            color("#fee5a6") translate ([3.5,1,2.5]) cube([.64,.64,5]);
        }
    }
    // 3x1 type
    if(type=="header_3x1" && enablemask == false) {
        size_x = 7.5;
        size_y = 2.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            color("#fee5a6") translate ([1,1,2.5]) cube([.64,.64,5]);
            color("#fee5a6") translate ([3.5,1,2.5]) cube([.64,.64,5]);
            color("#fee5a6") translate ([6,1,2.5]) cube([.64,.64,5]);
        }
    }
    // 3x2 type
    if(type=="header_3x2" && enablemask == false) {
        size_x = 7.5;
        size_y = 5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:8]) {
                color("#fee5a6") translate ([i,.5,3]) cube([.64,.64,5]);
                color("#fee5a6") translate ([i,3.5,3]) cube([.64,.64,5]);
            }
        }
    }   
    // 5x1 type
    if(type=="header_5x1" && enablemask == false) {
        size_x = 12.5;
        size_y = 2.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:12]) {
                color("#fee5a6") translate ([i,1,3]) cube([.64,.64,5]);
            }
        }
    }       
    // 6x1 type
    if(type=="header_6x1" && enablemask == false) {
        size_x = 15;
        size_y = 2.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:14]) {
                color("#fee5a6") translate ([i,1,3]) cube([.64,.64,5]);
            }
        }
    }       
    // 7x1 type
    if(type=="header_7x1" && enablemask == false) {
        size_x = 17.5;
        size_y = 2.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:16]) {
                color("#fee5a6") translate ([i,1,3]) cube([.64,.64,5]);
            }
        }
    }   
    // 13x1 type
    if(type=="header_13x1" && enablemask == false) {
        size_x = 32.5;
        size_y = 2.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:32]) {
                color("#fee5a6") translate ([i,1,3]) cube([.64,.64,5]);
            }
        }
    }   
}
