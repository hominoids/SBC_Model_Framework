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

// JST connector class
module jst(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {    
    
    // JST-XH connector class
    if(type == "xh") {
    
        size_x = 2.45+(data[0]*2.5);
        size_y = 5.75;

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference() {
                color("white") cube([size_x, size_y, 7]);
                color("white") translate([.5, .5, .5]) cube([size_x-1, size_y-1, 7]);
                color("white") translate([2, -.1,2.875]) cube([1.5, size_y-2, 5]);
                color("white") translate([size_x-3.5, -.1,2.875]) cube([1.5, size_y-2, 5]);
                color("white") translate([-.1,1,6]) cube([size_y-2,0.25*data[0],7]);
                color("white") translate([size_x-2,1,6]) cube([size_y-2,0.25*data[0],7]);
            }
            translate([2.45-.64/2, 0, 0]) union() {
                for(ind=[0:data[0]-1]) {
                    color("silver") translate([ind*2.5, 2.4, .5]) cube([.64, .64, 4]);
                }
            }
        }
    }


    // JST-SH connector class
    if(type == "sh") {
    
        size_x = 1+(data[0]);
        size_y = 2.9;

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference() {
                color("white") cube([size_x, size_y, 4.25]);
                color("white") translate([.25, .25, .25]) cube([size_x-.5, size_y-.5, 4.25]);
            }
            difference() {
                color("white") translate([-.4, 0, 2.75]) cube([.5, 1, 1.5]);
                color("white") translate([-1, .5, 2.25]) cube([1, 1, 1.5]);            
            }
            difference() {
                color("white") translate([size_x-.1, 0, 2.75]) cube([.5, 1, 1.5]);
                color("white") translate([size_x, .5, 2.25]) cube([1, 1, 1.5]);            
            }
            translate([1, 0, 0]) union() {
                for(ind=[0:data[0]-1]) {
                    color("silver") translate([(ind*1)-.125, 1, .5]) cube([.25, .25, 3.5]);
                }
            }
        }
    }

    // JST-PH connector type
    if(type == "ph") {
    
        size_x = 2.4+(data[0]*2);
        size_y = 4.5;
        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference() {
                color("white") cube([size_x, size_y, 6]);
                color("white") translate([.5, .5, .5]) cube([size_x-1, size_y-1, 6]);
                color("white") translate([size_x/2-(0.5*data[0])/2, -.1,.5]) cube([0.5*data[0], size_y-2, 6]);
            }
            translate([1.95, 0, 0]) union() {
                for(ind=[0:data[0]-1]) {
                    color("silver") translate([ind*2, 1.4, .5]) cube([.5, .5, 4]);
                }
            }
        }
    }
}
