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


     CLASS NAME: molex
    DESCRIPTION: creates molex series connectors.
           TODO: "5267", "5268"

          USAGE: molex(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                       type = "7478","5046"
                      loc_x = x location placement
                      loc_y = y location placement
                      loc_z = z location placement
                       side = "top", "bottom"
                 rotation[] = object rotation
                    size[0] = #pins
                    data[0] = "thruhole", "smt"
                    data[1] = "top", "side"
                    pcbsize_z = pcb thickness
                 enablemask = true produces mask, false produces model
                    mask[0] = true enables component mask
                    mask[1] = mask length
                    mask[2] = mask setback
                    mask[3] = mstyle "default"

*/

// molex connector class
module molex(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    row = size[0];
    style = data[0];
    entry = data[1];
    bcolor = "white";
    pcolor = "silver";
    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];

/*
                                                                   p     p
                                                                   i     i
                                                                   n     n
                                                                
                                                                   b     t        p   p
                                                 w                 o     o        i   i
                                b                a     p     p     t     p    p   n   n
                                o                l     i     i                i    
                                d      s     s   l     n     n     h     h    n   o   r
                           p    y      i     i                     e     e        f   a
                   t       i           z     z   s     x     y     i     i    s   f   d
                   y       t    a      e     e   i     a     a     g     g    i   s   i
                   p       c    d                z     d     d     h     h    z   e   u
                   e       h    j      y     z   e     j     j     t     t    e   t   s
*/
    molex_data = [
                 ["7478", 2.54, 0,   6.5,  3.18, 0,    0, 3.25,  3.4,  9.25, .64, 3, 1.17, 0],
                 ["5046", 2.54, 0,   6.5,  3.18, 0,    0, 0.64,  6.25, 5.75, .64, 2, 1.17, 2.62]
                 ];

    adj = .01;
    $fn = 90;

    s = search([type],molex_data);

    pitch = molex_data[s[0]][1];
    body_adj = molex_data[s[0]][2];
    size_x = body_adj+(row*pitch);
    size_y = molex_data[s[0]][3];
    size_z = molex_data[s[0]][4];
    wall_size = molex_data[s[0]][5];
    pin_xadj = molex_data[s[0]][6];
    pin_yadj = molex_data[s[0]][7];
    pbheight = molex_data[s[0]][8];
    ptheight = molex_data[s[0]][9];
    pinsize = molex_data[s[0]][10];
    pinoffset = molex_data[s[0]][11];
    pinradius = molex_data[s[0]][12];
    pinbhadj = molex_data[s[0]][13];
    smtlead = [pinsize,.925,.32];


    if(entry == "top" && enablemask == false) {
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference() {
                union() {
                    color(bcolor) cube([size_x, size_y, size_z]);
                    if(type == "7478") {
                        color(bcolor) translate([pitch/4, size_y-1, 0]) cube([size_x-pitch/2, 1, size_z+5.5]);
                        color(bcolor) translate([pitch/4, size_y-1, size_z+4.5]) rotate([0, 90, 0]) 
                            cylinder(d=2, h=size_x-pitch/2);
                    }
                }
                if(type == "7478") {
                    for(r=[pitch/2-(pinsize/2)-.5:pitch:size_x]) {
                        color(bcolor) translate([r, -1, -1]) cube([1.5, size_y+2, 1.5]);
                    }
                }
            }
            if(style == "thruhole") {
                for(r=[pitch/2-(pinsize/2):pitch:size_x]) {
                    color("silver") translate([r, pin_yadj-(pinsize/2), -pbheight+adj])
                        cube([pinsize, pinsize, pbheight+ptheight]);
                }
            }
            if(style == "smt") {
                for(r=[pitch/2-(pinsize/2):pitch:size_x-pitch]) {
                    color("silver") translate([r, pin_yadj-(pinsize/2), adj])
                        cube([pinsize, pinsize, ptheight]);
                    color("silver") translate([r, size_y-adj, 0])
                        cube(smtlead);
                }
            }
        }
    }
    if(entry == "side" && enablemask == true && cmask == true && mstyle == "default") {

        size_xm = size_x;
        size_ym = size_y+.5;
        size_zm = 5;

        if(side == "top" && rotation == 0) {
            place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                translate([0, back, 0]) rotate([90, 0, 0]) slab([size_x, size_ym, mlen], .5);
        }
        if(side == "top" && rotation == 90) {
            place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                translate([0, back, 0]) rotate([90, 0, 0]) slab([size_x, size_ym, mlen], .5);
        }
        if(side == "top" && rotation == 180) {
            place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                translate([0, back+.5, 0]) rotate([90, 0, 0]) slab([size_x, size_ym, mlen], .5);
        }
        if(side == "top" && rotation == 270) {
            place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                translate([0, back+.5, 0]) rotate([90, 0, 0]) slab([size_x, size_ym, mlen], .5);
        }
        if(side == "bottom" && rotation == 0) {
            place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                translate([0, back, 0]) rotate([90, 0, 0]) slab([size_x, size_ym, mlen],.5);
        }
        if(side == "bottom" && rotation == 90) {
            place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                translate([0, back+.5, 0]) rotate([90, 0, 0]) slab([size_x, size_ym, mlen],.5);
        }
        if(side == "bottom" && rotation == 180) {
            place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                translate([0, back+.5, 0]) rotate([90, 0, 0]) slab([size_x, size_ym, mlen], .5);
        }
        if(side == "bottom" && rotation == 270) {
            place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                translate([0, back, 0]) rotate([90, 0, 0]) slab([size_x, size_ym, mlen], .5);
        }
    }
    if(entry == "side" && enablemask == false) {

            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
            difference() {
                union() {
                    color(bcolor) cube([size_x, size_z, size_y]);
                    if(type == "7478") {
                        color(bcolor) translate([pitch/4,-size_z-5.5,size_y-1]) cube([size_x-pitch/2, size_z+5.5, 1]);
                        color(bcolor) translate([pitch/4, -size_z-4.5, size_y-1]) rotate([0, 90, 0]) 
                            cylinder(d=2, h=size_x-pitch/2);
                    }
                    if(type == "5046") {
                        color(bcolor) translate([pitch/4,-size_z-5.5,size_y-3.5]) cube([size_x-pitch/2, size_z+5.5, 1]);
                        color(bcolor) translate([pitch/4, -size_z-1.5, size_y-2.5]) rotate([0, 90, 0]) 
                            cylinder(d=2, h=size_x-pitch/2);
                        color(bcolor) translate([0,size_z,0]) cube([.75,3,3]);
                        color(bcolor) translate([size_x-.75,size_z,0]) cube([.75,3,3]);
                    }
                }
                if(type == "7478" || type == "5046") {
                    for(r=[pitch/2-(pinsize/2)-.5:pitch:size_x]) {
                        color(bcolor) translate([r, -1,-1]) cube([1.5, size_y+2, 1.5]);
                    }
                }
            }
            if(style == "thruhole") {
                for(r=[pitch/2-(pinsize/2):pitch:size_x]) {
                    if(type == "7478") {
                        color("silver") translate([r, -ptheight+adj, size_y-(pin_yadj+(pinsize/2))])
                            cube([pinsize, ptheight+size_z+pinsize+pinsize/2, pinsize]);
                        color("silver") translate([r, size_z+pinoffset-pinsize/2, -pbheight+adj+pinbhadj])
                            cube([pinsize, pinsize, pbheight+pinsize+pinsize/2]);
                        rotate([0,270,0]) translate([pinsize+(pinsize/2)+pinbhadj-(3*adj), size_z+pinsize+.04, r-size_x]) color("silver")
                                rotate_extrude(angle=90, convexity = 10) translate([2, 0, 0]) square([pinsize, pinsize]);
                    }
                    if(type == "5046") {
                        color("silver") translate([r, -ptheight+adj-3, size_y-(pin_yadj+(pinsize/2))])
                            cube([pinsize, ptheight+size_z+pinsize+pinsize/2, pinsize]);
                        color("silver") translate([r, size_z+pinoffset-pinsize/2, -pbheight+adj+pinbhadj])
                            cube([pinsize, pinsize, pbheight+pinsize+pinsize/2]);
                        rotate([0,270,0]) translate([pinsize+(pinsize/2)+pinbhadj-(3*adj), size_z+pinsize+.04-1, r-size_x]) color("silver")
                                rotate_extrude(angle=90, convexity = 10) translate([2, 0, 0]) square([pinsize, pinsize]);
                    }
                }
            }
            if(style == "smt") {
                for(r=[pitch/2-(pinsize/2):pitch:size_x-pitch]) {
                    color("silver") translate([r, -adj, size_y-(pin_yadj+(pinsize/2))])
                        cube([pinsize, ptheight, pinsize]);
                    color("silver") translate([r, size_z-adj, 0])
                        cube(smtlead);
                }
            }
        }
    }
}
