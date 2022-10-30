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

// discrete class
module discrete(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask) {
   
    // type ir
    if(type=="ir_1") {
        size_x = 7;
        size_y = 3;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {  
            color("silver") translate([0,0,4]) cube([size_x,size_y,8]);
            color("dimgray") translate([3.5,.5,7.5]) sphere(d=5);
            color("silver") translate ([1,1.25,0]) cube([.64,.5,4]);
            color("silver") translate ([3.25,1.25,0]) cube([.64,.5,4]);
            color("silver") translate ([5.5,1.25,0]) cube([.64,.5,4]);
        }
    }

    // type led surface mount
    if(type=="led_3x1.5") {
        size_x = 3;
        size_y = 1.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("gold") translate([0,0,0]) cube([size_x,size_y,.5]);
    }
}

