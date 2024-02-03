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


     CLASS NAME: header
    DESCRIPTION: creates pin headers in any size or pitch.
           TODO: "box", "angled" headers

          USAGE: header(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

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
                     mask[0] = true, false
                     mask[1] = length
                     mask[2] = set back
                     mask[3] = mstyle "default"

*/

// header class
module header(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    row = size[0];
    column = size[1];
    height = size[2];
    style = data[0];
    hcolor = data[1];
    gender = data[2];
    pitch = data[3];
    pcolor = data[4];

    size_y = pitch == 2.54 && style == "smt" ? (2.5 * column) : (pitch * column);
    size_x = pitch == 2.54 && style == "smt" ? (2.5 * row) : (pitch * row);
    bheight = pitch == 2.54 ? 2.5 : 1;
    pheight = pitch == 2.54 ? 3.2 : 2;
    pinsize = pitch == 2.54 ? .64 : .3;
    theight = bheight + pheight + height;
    smtlead = [pinsize, .925, .32];

    adj = .01;
    $fn = 90;
    
    // thruhole headers
    if(type == "open" && style == "thruhole" && enablemask == false) {

        if(gender == "male") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color(hcolor) cube([size_x, size_y, bheight]);
                for(c=[pitch/2:pitch:size_x]) {
                    for(r=[pitch/2:pitch:size_y]) {
                        color(pcolor) translate([c-(pinsize/2), r-(pinsize/2), -pheight]) cube([pinsize, pinsize, theight+adj]);
                    }
                }
            }
        }
        if(gender == "female") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference() {
                    color(hcolor) cube([size_x, size_y, height]);
                    for(c=[pitch/2:pitch:size_x]) {
                        for(r=[pitch/2:pitch:size_y]) {
                            color("#888888") translate([c-(pinsize/2), r-(pinsize/2), height-5+adj]) cube([pinsize, pinsize, height-1]);
                            color(pcolor) translate([c-(pinsize/2),r-(pinsize/2),-pheight]) cube([pinsize, pinsize, pheight+adj]);
                        }
                    }
                }
                for(c=[pitch/2:pitch:size_x]) {
                    for(r=[pitch/2:pitch:size_y]) {
                        color(pcolor) translate([c-(pinsize/2), r-(pinsize/2), -pheight]) cube([pinsize, pinsize, pheight+adj]);
                    }
                }
            }
        }
    }
    // smt headers
    if(type == "open" && style == "smt" && enablemask == false) {
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            if(gender == "male") {
                union() {
                    color(hcolor) cube([size_x, size_y, bheight]);
                    for(c=[pitch/2:pitch:size_x]) {
                        for(r=[pitch/2:pitch:size_y]) {
                            color(pcolor) translate([c-(pinsize/2), r-(pinsize/2), bheight-adj]) cube([pinsize, pinsize, height+adj]);
                        }
                    }
                }
            }
            if(gender == "female") {
                union() {
                    difference() {
                        color(hcolor) cube([size_x, size_y, height]);
                        for(c=[pitch/2:pitch:size_x]) {
                            for(r=[pitch/2:pitch:size_y]) {
                                color("#888888") translate([c-(pinsize/2), r-(pinsize/2), adj]) cube([pinsize, pinsize, height]);
                            }
                        }
                    }
                }
            }
            if(size_x >= size_y) {
                for(r=[pitch/2:pitch:size_x]) {
                    for(c=[pitch/2:pitch:size_y]) {
                        color(pcolor) translate ([r-(pinsize/2), -smtlead[1], 0]) cube(smtlead);
                        color(pcolor) translate ([r-(pinsize/2), size_y-adj, 0]) cube(smtlead);
                    }
                }
            }
            else {
                for(r=[pitch/2:pitch:size_x]) {
                    for(c=[pitch/2:pitch:size_y]) {
                        color(pcolor) translate ([-smtlead[1]+adj, c-(pinsize/2), 0]) cube([smtlead[1], smtlead[0], smtlead[2]]);
                        color(pcolor) translate ([size_x-adj, c-(pinsize/2), 0]) cube([smtlead[1], smtlead[0], smtlead[2]]);
                    }
                }
            }
        }
    }
}
