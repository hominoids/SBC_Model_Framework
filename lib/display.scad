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

// display class
module display(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    len = mask[1];
    back = mask[2];
    style = mask[3];
    
    // type lcd_2.2
    if(type == "lcd_2.2") {
    
        size_x = 56;
        size_y = 38;
        size_xm = 45;
        size_ym = 34;
        
        if(enablemask == true && cmask == true && style == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+4, loc_y+1, loc_z+4, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, len]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+7, loc_y+1, loc_z+4, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, len]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {
                    difference() {
                        union() {
                            color("white") cube([size_x, size_y, 1.5]);
                            color("grey") translate([1, 1, 1.5]) cube([size_x-2, size_y-2, 1.85]);
                            }
                        color("black") translate([54.5, 4, -.01]) cube([2, 30, 4]);
                    }
                    color("dimgrey") translate([4.25, .9, 3.35]) cube([45, 34, .25]);
                }
        }
    }
}
