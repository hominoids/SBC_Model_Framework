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

// compute module holder class
module soc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    size_x = size[0];
    size_y = size[1];
    size_z = size[2];

    if(type == "flat") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            color("dimgray") cube([size_x, size_y, size_z]);
    }
    if(type == "mid-raised") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("silver") cube([size_x, size_y, size_z]);
                color("silver") translate([data[0],data[1],size_z-.01]) rotate([90,0,90]) slot(data[5],data[3],data[4]);
            }
    }
}
