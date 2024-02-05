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


     CLASS NAME: fan
    DESCRIPTION: creates fan support components
           TODO: 

          USAGE: fan(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                     type = "fan_micro", "encl_pmw", "encl_pmw_h"
                    loc_x = x location placement
                    loc_y = y location placement
                    loc_z = z location placement
                     side = "top", "bottom"
               rotation[] = object rotation
                pcbsize_z = pcb thickness
               enablemask = true produces mask, false produces model
                  mask[0] = component mask true, false
                  mask[1] = mask length
                  mask[2] = mask setback
                  mask[3] = mstyle "default"

*/

// fan class
module fan(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    // micro connector type
    if(type=="fan_micro" && enablemask == false) {
        size_x = 7.5;
        size_y = 3.75;
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference () {
                color("white") cube([size_x, size_y, 4.75]);
                color("darkgray") translate([1.5, .5, 1]) cube([4.5, 2.75, 6]);
                color("white") translate([-.5, .75, -.5]) cube([1, 2.5, 6]);
                color("white") translate([7, .75, -.5]) cube([1, 2.5, 6]);
                color("darkgray") translate([2.25, -.5, 1]) cube([3, 2, 6]);
            }
            color("silver") translate ([2.75, 2, .5]) cube([.6, .6, 4]);
            color("silver") translate ([4.5, 2, .5]) cube([.6, .6, 4]);
        }
    }

    // pmw-standard connector type
    if(type=="encl_pmw" && enablemask == false) {
        size_x = 11.6;
        size_y = 4.3;
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference () {
                color("white") cube([size_x, size_y, 7]);
                color("darkgray") translate([.5, .5, 1]) cube([10.5, 3, 8]);
                //color("white") translate([-.5, .75, -.5]) cube([1, 2.5, 6]);
                //color("white") translate([11, .75, -.5]) cube([1, 2.5, 6]);
                color("darkgray") translate([2.25, -.5, 1]) cube([7.5, 2, 8]);
            }
            for (i=[2:2.54:11.7]) {
                color("silver") translate ([i, 2.54, 2]) cylinder(d=.67, h=5, $fn=30);
            }
        }
    }

    // pmw-standard connector type horizontal and 45 degrees
    if(type=="encl_pmw_h" && enablemask == false) {
        size_x = 11.6;
        size_y = 4.3;
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        translate([11.6, 0, 5]) rotate([-90, 0, -45])
        union() {  
            difference () {
                color("white") cube([size_x, size_y, 4]);
                color("darkgray") translate([.5, .5, 1]) cube([10.5, 3, 8]);
                //color("white") translate([-.5, .75, -.5]) cube([1, 2.5, 6]);
                //color("white") translate([11, .75, -.5]) cube([1, 2.5, 6]);
                color("darkgray") translate([2.25, -.5, 1]) cube([7.5, 2, 8]);
            }
            for (i=[2:2.54:11.7]) {
                color("silver") translate ([i, 2.54, 2]) cylinder(d=.67, h=2, $fn=30);
            }
        }
    }
}

