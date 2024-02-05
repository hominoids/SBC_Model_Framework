/*
    This file is part of SBC Model Framework https://github.com/hominoids/SBC_Model_Framework
    Copyright 2019,2020,2021,2022,2023,2024 Edward A. Kisiel hominoid@cablemi.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>
    Code released under GPLv3: http://www.gnu.org/licenses/gpl.html


     CLASS NAME: pcie
    DESCRIPTION: creates pcie components
           TODO:

          USAGE: pcie(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                      type = "x1", "x4"
                     loc_x = x location placement
                     loc_y = y location placement
                     loc_z = z location placement
                      side = "top", "bottom"
                rotation[] = object rotation
                 pcbsize_z = pcb thickness
                enablemask = true produces mask, false produces model
                   mask[0] = true enables component mask
                   mask[1] = mask length
                   mask[2] = mask setback
                   mask[3] = mstyle "default"

*/

// pcie class
module pcie(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    // PCIE
    if ((type == "x1" || type == "x4") && enablemask == false) {
        size_x = type == "x1" ? 25 : 39;
        pin = type == "x1" ? 36/2 : 64/2;
        size_y = 8.5;
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference() {
                color("black") cube([size_x, size_y, 11.1]);
                color("dimgrey") translate([1.55, (size_y/2)-.8, 2]) cube([11.5, 1.6, 11]);
                color("dimgrey") translate([15.5, (size_y/2)-.8, 2]) cube([pin-10.5, 1.6, 11]);
            }
            for (i=[1:1:11.5]) {
                color("#fee5a6") translate ([i+1, 2.75, -3]) cube([.5, .7, 13.75]);
                color("#fee5a6") translate ([i+1, 4.75, -3]) cube([.5, .7, 13.75]);
                color("#fee5a6") translate ([i+1, 1.375, -3]) cube([.5, .7, 3.5]);
                color("#fee5a6") translate ([i+1, 6.125, -3]) cube([.5, .7, 3.5]);
            }
            for (i=[16:1:pin+4]) {
                color("#fee5a6") translate ([i, 2.75, -3]) cube([.5, .7, 13.75]);
                color("#fee5a6") translate ([i, 4.75, -3]) cube([.5, .7, 13.75]);
                color("#fee5a6") translate ([i, 1.375, -3]) cube([.5, .7, 3.5]);
                color("#fee5a6") translate ([i, 6.125, -3]) cube([.5, .7, 3.5]);
            }
        }
    }
}
