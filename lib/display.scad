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


     CLASS NAME: display
    DESCRIPTION: creates flat panel displays
           TODO: 

          USAGE: display(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                         type = "lcd_2.2", "mipi_csi", "mipi_dsi"
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

// display class
module display(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];

    // type lcd_2.2
    if(type == "lcd_2.2") {

        size_x = 56;
        size_y = 38;
        size_xm = 45;
        size_ym = 34;

        if(enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x+4, loc_y+1, loc_z+4, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, mlen]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+7, loc_y+1, loc_z+4, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, mlen]);
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
    // mipi csi port
    if(type=="mipi_csi" && enablemask == false) {
        size_x = 21;
        size_y = 3;
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference() {
                color("white") cube([size_x, size_y, 5]);
                color("white") translate([-1, -1, 3.5]) cube([23, 3.5, 5]);
                color("white") translate([-1, -1, 3.5]) cube([3, 5, 5]);
                color("white") translate([19, -1, 3.5]) cube([3, 5, 5]);
            }
            difference() {
                color("black") translate([-1, 0, 3.5]) cube([23, 3.5, 1]);
                color("dimgrey") translate([2, 2.9, 3.49]) cube([17, 3, 2]);
            }
        }
    }
    // mipi csi port
    if(type=="mipi_csi_90" && enablemask == false) {
        size_x = 21;
        size_y = 3;
        place(loc_x, loc_y-3, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        rotate([90, 0, 0])
        union() {
            difference() {
                color("white") cube([size_x, size_y, 5]);
                color("white") translate([-1, -1, 3.5]) cube([23, 3.5, 5]);
                color("white") translate([-1, -1, 3.5]) cube([3, 5, 5]);
                color("white") translate([19, -1, 3.5]) cube([3, 5, 5]);
            }
            difference() {
                color("black") translate([-1, 0, 3.5]) cube([23, 3.5 ,1]);
                color("dimgrey") translate([2, 2.9, 3.49]) cube([17, 3, 2]);
            }
        }
    }
    // mipi dsi port
    if(type=="mipi_dsi" && enablemask == false) {
        size_x = 10;
        size_y = 3;
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color("black") cube([size_x, 1.5, 2]);
            color("saddlebrown") translate([0, 1.5, 0]) cube([size_x, 1.5, 2]);
        }
    }
}
