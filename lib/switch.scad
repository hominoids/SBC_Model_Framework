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


    DESCRIPTION: creates switches
           TODO: add other styles

          USAGE: switch(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                        type = "slide_4x9"

*/

// switch class
module switch(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];

    if(type == "slide_4x9") {

        size_x = 9;
        size_y = 3.75;
        size_xm = 9;
        size_ym = 4;

        if(enablemask == true && cmask == true && mstyle == "default") {
             // switch opening
            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y-mlen+back, loc_z+.25, size_ym, size_xm, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_ym]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-mlen+back, loc_y+5, loc_z+.25, size_ym, size_xm, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_ym]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+5, loc_y-5.25+mlen-back, loc_z+.25, size_ym, size_xm, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_ym]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-5.25+mlen-back, loc_y, loc_z+.25, size_ym, size_xm, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_ym]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+5, loc_y-mlen+back, loc_z+.25, size_ym, size_xm, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_ym]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-5.25+mlen-back, loc_y+5, loc_z+.25, size_ym, size_xm, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_ym]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y-5.25+mlen-back, loc_z+.25, size_ym, size_xm, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_ym]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-mlen+back, loc_y, loc_z+.25, size_ym, size_xm, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_ym]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {
                    color("silver") translate([0, 0, .5]) cube([size_x, size_y, 3.5]);
                    color("white") translate([3.75, -1.99, 1.75]) cube([3, 2, 1.5]);
                }
        }
    }
}
