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


     CLASS NAME: battery
    DESCRIPTION: creates batteries and support components.
           TODO: 

          USAGE: battery(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                         type = "bat_hold_1", "rtc_micro"
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

module battery(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    // type battery holder 1
    if(type == "bat_hold_1" && enablemask == false) {

        size_x = 22;
        size_y = 16;

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference() {
                union() {
                    color("LightYellow") cube([size_x, size_y, 6]);
                    color("LightYellow") translate([-3.2499, 4.5, 0]) cube([3.25, 7, 6]);
                    color("LightYellow") translate([21.999, 4.5, 0]) cube([3.25, 7, 6]);
                }
                color("LightYellow") translate([11, 8, 2]) cylinder(d=20, h=5, $fn=360);
                color("LightYellow") translate([-3.259, 5, 5]) cube([28.6, 5.5, 3]);
                color("LightYellow") translate([-3.25, 5.5, 5]) cube([28.5, 5.5, 3]);

                color("LightYellow") translate([-4.251, 5, -1]) cube([2, 6, 8]);
                color("LightYellow") translate([.5, 5, 2]) cube([1, 6, 8]);

                color("LightYellow") translate([24.25, 5, -1]) cube([2, 6, 8]);
                color("LightYellow") translate([20, 5, 2]) cube([1, 6, 8]);

                color("LightYellow") translate([22, 15, -1]) rotate([0, 0, 45]) cube([2, 2, 8]);

                /* bottom cut outs */
                color("LightYellow") translate([7, 2.5, -1]) cylinder(d=2.5, h=4, $fn=360);
                color("LightYellow") translate([3.75, 1.25, -1]) cube([3.5, 2.5, 3.75]);
                color("LightYellow") translate([15, 2.5, -1]) cylinder(d=2.5, h=4, $fn=360);
                color("LightYellow") translate([15, 1.25, -1]) cube([3.3,2.5,3.75]);
                color("LightYellow") translate([7, 13.5, -1]) cylinder(d=2.5, h=4, $fn=360);
                color("LightYellow") translate([3.75, 12.25, -1]) cube([3.5, 2.5, 3.75]);
                color("LightYellow") translate([15, 13.5, -1]) cylinder(d=2.5, h=4, $fn=360);
                color("LightYellow") translate([15, 12.25, -1]) cube([3.3, 2.5, 3.75]);
            }
            color("Gold") translate([-2.25199, 5, 0]) cube([1, 6, 6]);
            color("Gold") translate([0, 5, 0]) cube([1, 6, 6]);
            color("Gold") translate([-2.25199, 5, 5]) cube([3, 6, 1]);

            color("Gold") translate([20.99, 5, 2]) cube([1, 6, 4]);
            color("Gold") translate([23.251, 5, 0]) cube([1, 6, 6]);
            color("Gold") translate([21, 5, 5]) cube([3, 6, 1]);

            /* right contacts */
            color("Gold") translate([15, 6, 2.5]) rotate([0, 5, 0]) cube([6, 1, .5]);
            color("Gold") translate([15, 9, 2.5]) rotate([0, 5, 0]) cube([6, 1, .5]);
            color("Gold") translate([20.5, 5, 2]) cube([1, 6, .5]);

            /* left contacts */
            color("Gold") translate([1.5, 6, 2.5]) rotate([0, 5, 0]) cube([.5, 1, 3]);
            color("Gold") translate([2, 6, 5]) rotate([0, 5, 0]) cube([.5,1 , .5]);
            color("Gold") translate([1.5, 9, 2.5]) rotate([0 ,5, 0]) cube([.5, 1, 3]);
            color("Gold") translate([2, 9, 5]) rotate([0, 5, 0]) cube([.5, 1, .5]);
            color("Gold") translate([1, 5, 2]) cube([1, 6, .5]);
        }
    }

    // rtc micro connector type
    if(type == "rtc_micro" && enablemask == false) {
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
            color("silver") translate([2.75, 2, .5]) cube([.6, .6, 4]);
            color("silver") translate([4.5, 2, .5]) cube([.6, .6, 4]);
        }
    }
}
