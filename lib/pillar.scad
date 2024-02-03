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


     CLASS NAME: pillar
    DESCRIPTION: creates pillars
           TODO: add other genders and styles

          USAGE: pillar(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                        type = "hex", "round"
                       loc_x = x location placement
                       loc_y = y location placement
                       loc_z = z location placement
                        side = "top", "bottom"
                  rotation[] = object rotation
                     size[0] = outside dia
                     size[1] = inside dia
                     size[2] = height
                     data[1] = body color
                   pcbsize_z = pcb thickness
                  enablemask = true produces mask, false produces model
                     mask[0] = true enables component mask
                     mask[1] = mask length
                     mask[2] = mask setback
                     mask[3] = mstyle "default"

*/

// pillar class
module pillar(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    // type hex
    if(type=="hex" && enablemask == false) {

        size_x = size[0];
        size_y = size[1];
        size_z = size[2];
        pcolor = data[1];

        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            difference() {
                color(pcolor) rotate([rotation]) cylinder(d=size_x*2/sqrt(3), h=size_z, $fn=6);
                color(pcolor) translate([0, 0, -.1]) rotate([rotation]) cylinder(d=size_y, h=size_z+.2);
            }
        }
    }
    // type hex
    if(type=="round" && enablemask == false) {

        size_x = size[0];
        size_y = size[1];
        size_z = size[2];
        pcolor = data[1];

        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            difference() {
                color(pcolor) rotate([rotation]) cylinder(d=size_x, h=size_z, $fn=60);
                color(pcolor) translate([0, 0, -.1]) rotate([rotation]) cylinder(d=size_y, h=size_z+.2);
            }
        }
    }
}