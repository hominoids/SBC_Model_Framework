/*
    This file is part of SBC Model Framework https://github.com/hominoids/SBC_Model_Framework
    Copyright 2022,2023,2024,2025 Edward A. Kisiel hominoid@cablemi.com

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


*/


/*
           NAME: db
    DESCRIPTION: creates dsub connectors
           TODO: 25 pin

          USAGE: db(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                      type = "db9"
                     loc_x = x location placement
                     loc_y = y location placement
                     loc_z = z location placement
                      side = "top", "bottom"
                rotation[] = object rotation
                   data[0] = "male","female"
                 pcbsize_z = pcb thickness
                enablemask = true produces mask, false produces model
                   mask[0] = true enables component mask
                   mask[1] = mask length
                   mask[2] = mask setback
                   mask[3] = mstyle "default"

*/

module db(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];
    size_x = 16;
    size_y = 0;
    gender = data[0];

    adj = .01;
    $fn = 90;

    if(type == "db9") {
        if(enablemask == true && cmask == true && mstyle == "default") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            translate([8,back,6.5]) rotate([90,0,0]) union() {
                hull() {
                    translate([-7,3,-5]) cylinder(d=3, h=11+mlen);
                    translate([7,3,-5]) cylinder(d=3, h=11+mlen);
                    translate([-6.25,-3,-5]) cylinder(d=3, h=11+mlen);
                    translate([6.25,-3,-5]) cylinder(d=3, h=11+mlen);
                }
                // mount holes
                translate([-12.5,0,-5]) cylinder(d=3.5, h=11+mlen);
                translate([12.5,0,-5]) cylinder(d=3.5, h=11+mlen);
            }
        }
    }
    if(enablemask == false) {
        if(type == "db9") {
            if(gender =="female") {
                place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                translate([8,0,6.5]) rotate([90,0,0]) difference() {
                    union() {
                        color("silver") hull() {
                            translate([-6.5,2.5,-5]) cylinder(d=3, h=11);
                            translate([6.5,2.5,-5]) cylinder(d=3, h=11);
                            translate([-5.75,-2.5,-5]) cylinder(d=3, h=11);
                            translate([5.75,-2.5,-5]) cylinder(d=3, h=11);
                        }
                        color("black") hull() {
                            translate([-6,2.25,-6]) cylinder(d=3, h=12.25);
                            translate([6,2.25,-6]) cylinder(d=3, h=12.25);
                            translate([-5.25,-2.25,-6]) cylinder(d=3, h=12.25);
                            translate([5.25,-2.25,-6]) cylinder(d=3, h=12.25);
                        }
                    // mount plate
                    translate([-15.5,-6.5,-.25]) slab([31,13,.5], 2);
                    // rear pins
                    color("silver") translate([-5.48,1.4,-8]) cylinder(d=1.5, h=9);
                    color("silver") translate([-2.74,1.4,-8]) cylinder(d=1.5, h=9);
                    color("silver") translate([0,1.4,-8]) cylinder(d=1.5, h=9);
                    color("silver") translate([2.74,1.4,-8]) cylinder(d=1.5, h=9);
                    color("silver") translate([5.48,1.4,-8]) cylinder(d=1.5, h=9);
                    color("silver") translate([-4.12,-1.4,-8]) cylinder(d=1.5, h=9);
                    color("silver") translate([-1.38,-1.4,-8]) cylinder(d=1.5, h=9);
                    color("silver") translate([1.36,-1.4,-8]) cylinder(d=1.5, h=9);
                    color("silver") translate([4,-1.4,-8]) cylinder(d=1.5, h=9);

                    }
                    // mount holes
                    color("silver") translate([-12.5,0,-3]) cylinder(d=3.2, h=6);
                    color("silver") translate([12.5,0,-3]) cylinder(d=3.2, h=6);
                    // pin holes
                    color("silver") translate([-5.48,1.4,-9]) cylinder(d=1, h=16);
                    color("silver") translate([-2.74,1.4,-9]) cylinder(d=1, h=16);
                    color("silver") translate([0,1.4,-9]) cylinder(d=1, h=16);
                    color("silver") translate([2.74,1.4,-9]) cylinder(d=1, h=16);
                    color("silver") translate([5.48,1.4,-9]) cylinder(d=1, h=16);
                    color("silver") translate([-4.12,-1.4,-9]) cylinder(d=1, h=16);
                    color("silver") translate([-1.38,-1.4,-9]) cylinder(d=1, h=16);
                    color("silver") translate([1.36,-1.4,-9]) cylinder(d=1, h=16);
                    color("silver") translate([4,-1.4,-9]) cylinder(d=1, h=16);
                }
            }
            if(gender =="male") {
                place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                translate([8,0,6.5]) rotate([90,0,0]) 
                union() {
                    difference() {
                        union() {
                            color("silver") hull() {
                                translate([-6.5,2.5,-5]) cylinder(d=3, h=11);
                                translate([6.5,2.5,-5]) cylinder(d=3, h=11);
                                translate([-5.75,-2.5,-5]) cylinder(d=3, h=11);
                                translate([5.75,-2.5,-5]) cylinder(d=3, h=11);
                            }
                            color("black") hull() {
                                translate([-6,2.25,-6]) cylinder(d=3, h=6.25);
                                translate([6,2.25,-6]) cylinder(d=3, h=6.25);
                                translate([-5.25,-2.25,-6]) cylinder(d=3, h=6.25);
                                translate([5.25,-2.25,-6]) cylinder(d=3, h=6.25);
                            }
                        // mount plate
                        translate([-15.5,-6.5,-.25]) slab([31,13,.5], 2);
                        // rear pins
                        color("silver") translate([-5.48,1.4,-8]) cylinder(d=1.5, h=9);
                        color("silver") translate([-2.74,1.4,-8]) cylinder(d=1.5, h=9);
                        color("silver") translate([0,1.4,-8]) cylinder(d=1.5, h=9);
                        color("silver") translate([2.74,1.4,-8]) cylinder(d=1.5, h=9);
                        color("silver") translate([5.48,1.4,-8]) cylinder(d=1.5, h=9);
                        color("silver") translate([-4.12,-1.4,-8]) cylinder(d=1.5, h=9);
                        color("silver") translate([-1.38,-1.4,-8]) cylinder(d=1.5, h=9);
                        color("silver") translate([1.36,-1.4,-8]) cylinder(d=1.5, h=9);
                        color("silver") translate([4,-1.4,-8]) cylinder(d=1.5, h=9);

                        }
                        // mount holes
                        color("silver") translate([-12.5,0,-3]) cylinder(d=3.2, h=6);
                        color("silver") translate([12.5,0,-3]) cylinder(d=3.2, h=6);
                        translate([0, 0, 6]) color("silver") hull() {
                            translate([-6,2.25,-6]) cylinder(d=3, h=12.25);
                            translate([6,2.25,-6]) cylinder(d=3, h=12.25);
                            translate([-5.25,-2.25,-6]) cylinder(d=3, h=12.25);
                            translate([5.25,-2.25,-6]) cylinder(d=3, h=12.25);
                        }
                        // pin holes
                        color("silver") translate([-5.48,1.4,-9]) cylinder(d=1, h=16);
                        color("silver") translate([-2.74,1.4,-9]) cylinder(d=1, h=16);
                        color("silver") translate([0,1.4,-9]) cylinder(d=1, h=16);
                        color("silver") translate([2.74,1.4,-9]) cylinder(d=1, h=16);
                        color("silver") translate([5.48,1.4,-9]) cylinder(d=1, h=16);
                        color("silver") translate([-4.12,-1.4,-9]) cylinder(d=1, h=16);
                        color("silver") translate([-1.38,-1.4,-9]) cylinder(d=1, h=16);
                        color("silver") translate([1.36,-1.4,-9]) cylinder(d=1, h=16);
                        color("silver") translate([4,-1.4,-9]) cylinder(d=1, h=16);
                    }
                    color("gold") translate([-5.48,1.4,0]) cylinder(d=1, h=5.5);
                    color("gold") translate([-2.74,1.4,0]) cylinder(d=1, h=5.5);
                    color("gold") translate([0,1.4,0]) cylinder(d=1, h=5.5);
                    color("gold") translate([2.74,1.4,0]) cylinder(d=1, h=5.5);
                    color("gold") translate([5.48,1.4,0]) cylinder(d=1, h=5.5);
                    color("gold") translate([-4.12,-1.4,0]) cylinder(d=1, h=5.5);
                    color("gold") translate([-1.38,-1.4,0]) cylinder(d=1, h=5.5);
                    color("gold") translate([1.36,-1.4,0]) cylinder(d=1, h=5.5);
                    color("gold") translate([4,-1.4,0]) cylinder(d=1, h=5.5);

                }
            }
        }
    }
}