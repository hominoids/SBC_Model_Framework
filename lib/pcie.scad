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

// pcie class
module pcie(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    len = mask[1];
    back = mask[2];
    style = mask[3];
    
    
    // PCIE-X4
    if (type=="x4" && enablemask == false) {
        size_x = 38.8;
        size_y = 8.5;
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference() {
                color("black") cube([size_x, size_y, 11.1]);
                color("dimgrey") translate([1.55,(size_y/2)-.8,2]) cube([11.5,1.6,11]);
                color("dimgrey") translate([16.5,(size_y/2)-.8,2]) cube([20.3,1.6,11]);
            }
            for (i=[1:1:11.5]) {
                color("#fee5a6") translate ([i+1,2.75,2.5]) cube([.5,1,8.25]);
                color("#fee5a6") translate ([i+1,4.75,2.5]) cube([.5,1,8.25]);
            }
            for (i=[17:1:36.5]) {
                color("#fee5a6") translate ([i,2.75,2.5]) cube([.5,1,8.25]);
                color("#fee5a6") translate ([i,4.75,2.5]) cube([.5,1,8.25]);
            }
        }
    }
}
