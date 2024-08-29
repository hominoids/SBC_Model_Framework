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


     CLASS NAME: gpio
    DESCRIPTION: creates gpio headers
           TODO: "box"

          USAGE: gpio(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                      type = "open"
                     loc_x = x location placement
                     loc_y = y location placement
                     loc_z = z location placement
                      side = "top", "bottom"
                rotation[] = object rotation
                   size[0] = #row
                   size[1] = #columns
                   size[2] = pin height
                   data[0] = style ("straight", "angled")
                   data[1] = header color
                   data[2] = "male", "female"
                   data[3] = pitch
                   data[4] = pin color
                 pcbsize_z = pcb thickness
                enablemask = true produces mask, false produces model
                   mask[0] = true enables component mask
                   mask[1] = mask length
                   mask[2] = mask setback
                   mask[3] = mstyle ("none", "open", "block", "knockout", "vent")

                      type = "encl_header_30", "encl_header_12"
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
                   mask[3] = mstyle ("none", "open", "block", "knockout", "vent")

*/

// gpio class
module gpio(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    size_x = size[0];
    size_y = size[1];
    size_z = size[2];
    style = data[0];
    hcolor = data[1];
    gender = data[2];
    pitch = data[3];
    pcolor = data[4];
    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];
    adj = .01;
    $fn = 90;

    // gpio 40 pin header
    if((size_x == 20 && size_y == 2) || (size_x == 2 && size_y == 20)) {

        if(enablemask == true && cmask == true && mstyle == "open") {
            
            if(size_x == 20 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+4;
                size_ym = 12;
                size_zm = 9;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y+5, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym+5.08, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
            }
            if(size_x == 2 && size_y == 20) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+4;
                size_xm = 12;
                size_zm = 9;

                if(side == "top" && rotation == 0) {
                    place(loc_x-10, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2.54, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2.54, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9.5, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
            }
        }
        if(enablemask == true && cmask == true && mstyle == "block") {
            
            if(size_x == 20 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+4;
                size_ym = 12;
                size_zm = 27;
                offsety = 7;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym+5.08, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
            }
            if(size_x == 2 && size_y == 20) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+4;
                size_xm = 12;
                size_zm = 27;

                if(side == "top" && rotation == 0) {
                    place(loc_x-10, loc_y-(size_ym-size_yt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2.54, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2.54, loc_y-(size_ym-size_yt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
            }
        }
        if(enablemask == true && cmask == true && mstyle == "knockout") {
            
            if(size_x == 20 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+8;
                size_ym = 10;
                size_zm = 27;
                fillet = 3.5;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y+5, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
            }
            if(size_x == 2 && size_y == 20) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+8;
                size_xm = 10;
                size_zm = 27;
                fillet = 3.5;

                if(side == "top" && rotation == 0) {
                    place(loc_x-10, loc_y-(size_ym-size_yt)/2, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2.54, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2.54, loc_y-(size_ym-size_yt)/2, loc_z+(size_xm/2)-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9.5, loc_z+(size_xm/2)-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
            }
        }
        if(enablemask == true && cmask == true && mstyle == "vent") {
            
            if(size_x == 20 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+4;
                size_ym = 12;
                size_zm = 9;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y+mlen+5, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 14, "vertical");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 14, "vertical");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym-9, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 14, "vertical");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-6, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 14, "vertical");
                }
            }
            if(size_x == 2 && size_y == 20) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+4;
                size_xm = 12;
                size_zm = 27;

                if(side == "top" && rotation == 0) {
                    place(loc_x-9, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 14, "vertical");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 14, "vertical");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 14, "vertical");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 14, "vertical");
                }
            }
        }

        if(enablemask == false) {
            header(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
        }
    }

    // gpio 26 pin header
    if((size_x == 13 && size_y == 2) || (size_x == 2 && size_y == 13)) {
        if(enablemask == true && cmask == true && mstyle == "open") {
            
            if(size_x == 13 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+4;
                size_ym = 12;
                size_zm = 9;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y+5, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
            }
            if(size_x == 2 && size_y == 13) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+4;
                size_xm = 12;
                size_zm = 9;

                if(side == "top" && rotation == 0) {
                    place(loc_x-10, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2.54, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2.54, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9.5, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
            }
        }
        if(enablemask == true && cmask == true && mstyle == "block") {
            
            if(size_x == 13 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+4;
                size_ym = 12;
                size_zm = 27;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
            }
            if(size_x == 2 && size_y == 13) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+4;
                size_xm = 12;
                size_zm = 27;

                if(side == "top" && rotation == 0) {
                    place(loc_x-4, loc_y-(size_ym-size_yt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2.54, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2.54, loc_y-(size_ym-size_yt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
            }
        }
        if(enablemask == true && cmask == true && mstyle == "knockout") {
            
            if(size_x == 13 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+8;
                size_ym = 10;
                size_zm = 27;
                fillet = 3.5;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y+5, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 8, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 8, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
            }
            if(size_x == 2 && size_y == 13) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+8;
                size_xm = 10;
                size_zm = 27;
                fillet = 3.5;

                if(side == "top" && rotation == 0) {
                    place(loc_x-10, loc_y-(size_ym-size_yt)/2, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+5, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+5, loc_y-(size_ym-size_yt)/2, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9.5, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
            }
        }
        if(enablemask == true && cmask == true && mstyle == "vent") {
            
            if(size_x == 13 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+4;
                size_ym = 12;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y+14, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 9, "vertical");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 9, "vertical");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym-9, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 9, "vertical");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-6, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 9, "vertical");
                }
            }
            if(size_x == 2 && size_y == 13) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+4;
                size_xm = 12;

                if(side == "top" && rotation == 0) {
                    place(loc_x-9, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 9, "vertical");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 9, "vertical");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2, loc_y-1.25-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 9, "vertical");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 9, "vertical");
                }
            }
        }
        if(enablemask == false) {
            header(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
        }
    }

    // gpio 20 pin header
    if((size_x == 10 && size_y == 2) || (size_x == 2 && size_y == 10)) {
        if(enablemask == true && cmask == true && mstyle == "open") {

            if(size_x == 10 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+4;
                size_ym = 12;
                size_zm = 9;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y+5, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
            }
            if(size_x == 2 && size_y == 10) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+4;
                size_xm = 12;
                size_zm = 9;

                if(side == "top" && rotation == 0) {
                    place(loc_x-10, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2.54, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2.54, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9.5, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
            }
        }
        if(enablemask == true && cmask == true && mstyle == "block") {
            
            if(size_x == 10 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+4;
                size_ym = 12;
                size_zm = 27;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
            }
            if(size_x == 2 && size_y == 10) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+4;
                size_xm = 12;
                size_zm = 27;

                if(side == "top" && rotation == 0) {
                    place(loc_x-10, loc_y-(size_ym-size_yt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2.54, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2.54, loc_y-(size_ym-size_yt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
            }
        }
        if(enablemask == true && cmask == true && mstyle == "knockout") {
            
            if(size_x == 10 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+8;
                size_ym = 10;
                size_zm = 27;
                fillet = 3.5;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y+5, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
            }
            if(size_x == 2 && size_y == 10) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+8;
                size_xm = 10;
                size_zm = 27;
                fillet = 3.5;

                if(side == "top" && rotation == 0) {
                    place(loc_x-10, loc_y-(size_ym-size_yt)/2, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2.54, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2.54, loc_y-(size_ym-size_yt)/2, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9.5, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
            }
        }
        if(enablemask == true && cmask == true && mstyle == "vent") {
            
            if(size_x == 10 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+4;
                size_ym = 12;
                size_zm = 9;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y+14, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym-9, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-6, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
            }
            if(size_x == 2 && size_y == 10) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+4;
                size_xm = 12;
                size_zm = 27;

                if(side == "top" && rotation == 0) {
                    place(loc_x-9, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
            }
        }
        if(enablemask == false) {
            header(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
        }
    }

    // gpio 14 pin header
    if((size_x == 7 && size_y == 2) || (size_x == 2 && size_y == 7)) {
        if(enablemask == true && cmask == true && mstyle == "open") {

            if(size_x == 7 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+4;
                size_ym = 12;
                size_zm = 9;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y+5, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
            }
            if(size_x == 2 && size_y == 7) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+4;
                size_xm = 12;
                size_zm = 9;

                if(side == "top" && rotation == 0) {
                    place(loc_x-10, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2.54, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2.54, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9.5, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
            }
        }
        if(enablemask == true && cmask == true && mstyle == "block") {
            
            if(size_x == 7 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+4;
                size_ym = 12;
                size_zm = 27;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([size_xm, mlen, size_zm]);
                }
            }
            if(size_x == 2 && size_y == 7) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+4;
                size_xm = 12;
                size_zm = 27;

                if(side == "top" && rotation == 0) {
                    place(loc_x-10, loc_y-(size_ym-size_yt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2.54, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2.54, loc_y-(size_ym-size_yt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                        cube([mlen, size_ym,  size_zm]);
                }
            }
        }
        if(enablemask == true && cmask == true && mstyle == "knockout") {
            
            if(size_x == 7 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+8;
                size_ym = 10;
                size_zm = 27;
                fillet = 3.5;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y+5, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
                }
            }
            if(size_x == 2 && size_y == 7) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+8;
                size_xm = 10;
                size_zm = 27;
                fillet = 3.5;

                if(side == "top" && rotation == 0) {
                    place(loc_x-10, loc_y-(size_ym-size_yt)/2, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2.54, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2.54, loc_y-(size_ym-size_yt)/2, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9.5, loc_z+(size_xm/2)-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([90, 0, 90]) knockout(size_ym, size_xm, 2, mlen, fillet, "slot");
                }
            }
        }
        if(enablemask == true && cmask == true && mstyle == "vent") {
            
            if(size_x == 7 && size_y == 2) {

                size_xt = size_x * 2.54;
                size_xm = size_xt+4;
                size_ym = 12;
                size_zm = 9;

                if(side == "top" && rotation == 0) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y+mlen+5, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 7, "vertical");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym-9, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-6, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
            }
            if(size_x == 2 && size_y == 7) {

                size_yt = size_y * 2.54;
                size_ym = size_yt+4;
                size_xm = 12;
                size_zm = 27;

                if(side == "top" && rotation == 0) {
                    place(loc_x-9, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
                if(side == "top" && rotation == 90) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y+2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
                if(side == "top" && rotation == 180) {
                    place(loc_x+2, loc_y-(size_ym-size_yt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
                if(side == "top" && rotation == 270) {
                    place(loc_x-(size_ym-size_yt)/2, loc_y-9, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                        rotate([0, 0, 90]) vent(2, 10, mlen, 1, 1, 8, "vertical");
                }
            }
        }
        if(enablemask == false) {
            header(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask);
        }
    }

    // gpio 30 pin enclosed header
    if(type=="encl_header_30") {
        if(enablemask == true && cmask == true && mstyle == "open") {
            
            size_xt = 37;
            size_xm = 38;
            size_ym = 12;
            size_zm = 9;

            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_xt)/2, loc_y+5, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == true && cmask == true && mstyle == "block") {
            
            size_xt = 37;
            size_xm = 38;
            size_ym = 12;
            size_zm = 27;

            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_xt)/2, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == true && cmask == true && mstyle == "knockout") {
            
            size_xt = 37;
            size_xm = 39;
            size_ym = 10;
            size_zm = 27;
            fillet = 3.5;

            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_xt)/2, loc_y+5, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, 8, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, 8, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
            }
        }
        if(enablemask == true && cmask == true && mstyle == "vent") {
            
            size_xt = 37;
            size_xm = 38;
            size_ym = 12;

            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_xt)/2, loc_y+14, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    vent(2, 10, mlen, 1, 1, 10, "vertical");
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    vent(2, 10, mlen, 1, 1, 10, "vertical");
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym-9, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    vent(2, 10, mlen, 1, 1, 10, "vertical");
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-6, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    vent(2, 10, mlen, 1, 1, 10, "vertical");
            }
        }
        if(enablemask == false) {
            size_x = 37;
            size_y = 5.5;
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    color("black") cube([size_x, size_y, 6.25]);
                    color ("#444444") translate ([.5, .5, .6]) cube([36, 4.5, 5.75]);
                }
                for (i=[4.5:2:34]) {
                    color("silver") translate ([i, 1.5, 1]) cube([.5, .5, 5]);
                    color("silver") translate ([i, 3.5, 1]) cube([.5, .5, 5]);
                }
            }
        }
    }

    // gpio 12 enclosed header
    if(type=="encl_header_12") {
        if(enablemask == true && cmask == true && mstyle == "open") {
            
            size_xt = 19.5;
            size_xm = 20.5;
            size_ym = 12;
            size_zm = 9;

            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_xt)/2, loc_y+5, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == true && cmask == true && mstyle == "block") {
            
            size_xt = 19.5;
            size_xm = 20.5;
            size_ym = 12;
            size_zm = 27;

            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_xt)/2, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, mlen, size_zm]);
            }
        }
        if(enablemask == true && cmask == true && mstyle == "knockout") {
            
            size_xt = 19.5;
            size_xm = 21.5;
            size_ym = 10;
            size_zm = 27;
            fillet = 3.5;

            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_xt)/2, loc_y+5, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-size_ym+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, 8, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, 9.5, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+2.54, loc_y-(size_xm-size_xt)/2, loc_z-back+2, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, 8, size_ym/2]) rotate([90, 0, 0]) knockout(size_xm, size_ym, 2, mlen, fillet, "slot");
            }
        }
        if(enablemask == true && cmask == true && mstyle == "vent") {
            
            size_xt = 19.5;
            size_xm = 22.5;
            size_ym = 12;

            if(side == "top" && rotation == 0) {
                place(loc_x-(size_xm-size_xt)/2, loc_y+14, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    vent(2, 10, mlen, 1, 1, 6, "vertical");
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    vent(2, 10, mlen, 1, 1, 6, "vertical");
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-(size_xm-size_xt)/2, loc_y-size_ym-9, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    vent(2, 10, mlen, 1, 1, 6, "vertical");
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-6, loc_y-(size_xm-size_xt)/2, loc_z-back, size_xm, size_ym, rotation, side, pcbsize_z)
                    vent(2, 10, mlen, 1, 1, 6, "vertical");
            }
        }
        if (enablemask == false) {
            size_x = 19.5;
            size_y = 5.5;
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference () {
                    color("black") cube([size_x, size_y, 6.25]);
                    color ("#444444") translate ([.5, .5,.6]) cube([18.5, 4.5, 5.75]);
                }
                for (i=[4.5:2:16]) {
                    color("#fee5a6") translate ([i, 1.5, 1]) cube([.5, .5, 5]);
                    color("#fee5a6") translate ([i, 3.5, 1]) cube([.5, .5, 5]);
                }
            }
        }
    }
}
