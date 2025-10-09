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
           TODO: "angled-boxed" and male pitchs besides 2.54.

          USAGE: header(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                        type = "open","boxed","angled"
                       loc_x = x location placement
                       loc_y = y location placement
                       loc_z = z location placement
                        side = "top", "bottom"
                  rotation[] = object rotation
                     size[0] = #row
                     size[1] = #columns
                     size[2] = pin height
                     data[0] = style ("thruhole", "smt")
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
    size_x = pitch == 2.54 && style == "smt" ? (2.54 * row) : (pitch * row);
    bheight = pitch == 2.54 ? 2.5 : 1;
    pheight = pitch == 2.54 ? 3.2 : 2;
    pinsize = pitch == 2.54 ? .64 : .3;
    theight = bheight + pheight + height;
    smtlead = [pinsize, .925, .32];
    wall = .1;
    walloffset = pitch+wall;

    adj = .01;
    $fn = 90;
    
    // thruhole headers
    if(style == "thruhole" && enablemask == false) {

        if((type == "open" || type == "boxed") && gender == "male") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color(hcolor) cube([size_x, size_y, bheight]);
                for(c=[pitch/2:pitch:size_x]) {
                    for(r=[pitch/2:pitch:size_y]) {
                        color(pcolor) translate([c-(pinsize/2), r-(pinsize/2), -pheight]) cube([pinsize, pinsize, theight+adj]);
                    }
                }
            }
            if(type == "boxed") {
                place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                difference() {
                    color(hcolor) translate([-walloffset,-wall,0]) cube([size_x+2*2.56, size_y+2*wall, height+bheight]);
                    color(hcolor) translate([-walloffset+wall,0,wall]) cube([size_x+2*walloffset-4*wall, size_y, height+bheight+adj]);
                }
            }
        }
        if(type == "open" && gender == "female") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference() {
                    color(hcolor) cube([size_x, size_y, height]);
                    for(c=[pitch/2:pitch:size_x]) {
                        for(r=[pitch/2:pitch:size_y]) {
                            color("#888888") translate([c-(pinsize/2), r-(pinsize/2), height-5+adj]) cube([pinsize, pinsize, height-1]);
                            color("#888888") translate([c-(pinsize/2),r-(pinsize/2),-pheight]) cube([pinsize, pinsize, pheight+adj]);
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
        if(type == "angled" && gender == "male") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color(hcolor) cube([size_x, bheight, size_y]);
                for(c=[pitch/2:pitch:size_x]) {
                    for(r=[pitch/2:pitch:size_y]) {
                        if(r <= pitch) {
                            color(pcolor) translate([c-(pinsize/2)+pinsize, pitch+1.5*pinsize, -(pitch/2)+r+(1.5*pinsize)-adj]) 
                                rotate([0,270,0]) rotate_extrude(angle=90, convexity = 0) square([pinsize, pinsize]);
                            color(pcolor) translate([c-(pinsize/2), pitch+1.5*pinsize, -pheight-(pitch/2)+r+(1.5*pinsize)]) 
                                cube([pinsize,pinsize,pheight]);
                            color(pcolor) translate([c-(pinsize/2), -height+pinsize/2, r-(pinsize/2)]) 
                                cube([pinsize, pheight + height, pinsize]);
                        }
                        else {
                            color(pcolor) translate([c-(pinsize/2)+pinsize, (2*pitch)+1.5*pinsize, -(pitch/2)+r+(1.5*pinsize)-adj])
                                rotate([0,270,0]) rotate_extrude(angle=90, convexity = 0) square([pinsize, pinsize]);
                            color(pcolor) translate([c-(pinsize/2), 2*pitch+1.5*pinsize, -height-(pitch/2)+r+(2*pinsize)+(height-6)])
                                cube([pinsize,pinsize,pheight+pitch]);
                            color(pcolor) translate([c-(pinsize/2), -height+pinsize/2, r-(pinsize/2)]) 
                                cube([pinsize, pheight+height+pitch, pinsize]);
                        }
                    }
                }
            }
        }
        if(type == "angled" && gender == "female") {
            size_y = pitch == 2.54 && style == "smt" ? (2.5 * column) : (pitch * column)+1;
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference() {
                    color(hcolor) cube([size_x, height, size_y]);
                    for(c=[pitch/2:pitch:size_x+pitch]) {
                        for(r=[pitch/2:pitch:size_y]) {
                            color("#888888") translate([c-(pinsize/2), r-(pinsize/2)-bheight, +1+pinsize/2]) 
                                cube([pinsize, height-1, pinsize]);
                            color("#888888") translate([c-(pinsize/2),r-(pinsize/2)-bheight, pheight+.5+pinsize/2]) 
                                cube([pinsize, pheight+adj, pinsize]);
                        }
                    }
                }
                translate([0, height-1.5, .5]) for(c=[pitch/2:pitch:size_x]) {
                    for(r=[pitch/2:pitch:size_y]) {
                        if(r <= pitch) {
                            color(pcolor) translate([c-(pinsize/2)+pinsize, pitch+1.5*pinsize, -(pitch/2)+r+(1.5*pinsize)-adj]) 
                                rotate([0,270,0]) rotate_extrude(angle=90, convexity = 0) square([pinsize, pinsize]);
                            color(pcolor) translate([c-(pinsize/2), pitch+1.5*pinsize, -pheight-(pitch/2)+r+(1.5*pinsize)-.5]) 
                                cube([pinsize,pinsize,pheight+.5]);
                            color(pcolor) translate([c-(pinsize/2), pinsize/2, r-(pinsize/2)]) 
                                cube([pinsize, pheight, pinsize]);
                        }
                        else {
                            color(pcolor) translate([c-(pinsize/2)+pinsize, (2*pitch)+1.5*pinsize, -(pitch/2)+r+(1.5*pinsize)-adj])
                                rotate([0,270,0]) rotate_extrude(angle=90, convexity = 0) square([pinsize, pinsize]);
                            color(pcolor) translate([c-(pinsize/2), 2*pitch+1.5*pinsize, -height-(pitch/2)+r+(2*pinsize)+(height-6)-.5])
                                cube([pinsize,pinsize,pheight+pitch+.5]);
                            color(pcolor) translate([c-(pinsize/2), pinsize/2, r-(pinsize/2)]) 
                                cube([pinsize, pheight+pitch, pinsize]);
                        }
                    }
                }
            }
        }
    }
    // smt headers
    if(style == "smt" && enablemask == false) {
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            if((type == "open" || type == "boxed") && gender == "male") {
                union() {
                    color(hcolor) cube([size_x, size_y, bheight]);
                    for(c=[pitch/2:pitch:size_x]) {
                        for(r=[pitch/2:pitch:size_y]) {
                            color(pcolor) translate([c-(pinsize/2), r-(pinsize/2), bheight-adj]) cube([pinsize, pinsize, height]);
                        }
                    }
                }
                if(type == "boxed") {
                    difference() {
                        color(hcolor) translate([-walloffset,-wall,0]) cube([size_x+2*2.56, size_y+2*wall, height+bheight]);
                        color(hcolor) translate([-walloffset+wall,0,wall]) cube([size_x+2*walloffset-4*wall, size_y, height+bheight+adj]);
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
