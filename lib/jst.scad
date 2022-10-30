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

// JST-PH connector class
module jst_ph(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask) {
    size_x = 2.4+(type*2);
    size_y = 4.5;
    place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
    union() {
        difference() {
            color("white") cube([size_x, size_y, 6]);
            color("white") translate([.5, .5, .5]) cube([size_x-1, size_y-1, 6]);
            color("white") translate([size_x/2-(0.5*type)/2, -.1,.5]) cube([0.5*type, size_y-2, 6]);
        }
        translate([1.95, 0, 0]) union() {
            for(ind=[0:type-1]) {
                color("silver") translate([ind*2, 1.4, .5]) cube([.5, .5, 4]);
            }
        }
    }
}
