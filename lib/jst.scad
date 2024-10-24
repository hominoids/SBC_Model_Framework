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

     CLASS NAME: jst
    DESCRIPTION: creates jst connectors for xh, ph, zh, sh, pa.
           TODO: flange for sh 

          USAGE: jst(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                     type = "xh","ph","zh","sh","pa"
                    loc_x = x location placement
                    loc_y = y location placement
                    loc_z = z location placement
                     side = "top", "bottom"
               rotation[] = object rotation
                  size[0] = #pins
                  data[0] = "thruhole", "smt"
                  data[1] = "top", "side"
                  data[2] = body color
                pcbsize_z = pcb thickness
               enablemask = true, false
                  mask[0] = true, false
                  mask[1] = length
                  mask[2] = set back
                  mask[3] = mstyle "default"

*/

// JST connector class
module jst(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {    
    
    row = size[0];
    style = data[0];
    entry = data[1];
    bcolor = data[2];
    pcolor = "silver";
    cmask = mask[0];
    mlen = mask[1];
    back = mask[2];
    mstyle = mask[3];
    
/*
                                                               p    p
                                                               i    i
                                                               n    n
                                                                
                                                               b    t
                                               w               o    o
                             b                 a   p     p     t    p    p
                             o                 l   i     i               i
                             d      s   s      l   n     n     h    h    n
                        p    y      i   i                      e    e    
                   t    i           z   z      s   x     y     i    i    s
                   y    t    a      e   e      i   a     a     g    g    i
                   p    c    d                 z   d     d     h    h    z
                   e    h    j      y   z      e   j     j     t    t    e
*/
    jst_data = [
                ["xh", 2.5, 2.45, 5.75, 7,    .5,  2.35, 2.4,  3.4, 7,   .64],
                ["ph", 2,   1.95, 4.5,  6,    .5,  1.95, 1.7,  3.4, 5,   .5],
                ["zh", 1.5, 1.5,  3.5,  4.5,  .35, 1.5,  1.3,  3.4, 3.5, .5],
                ["sh", 1,   1,    2.9,  4.25, .35, 1,    1.25, 3.4, 4,   .25],
                ["pa", 2,   2,    4,    8,    .35, 2,    2,    3.4, 4.5, .5]
               ];

    adj = .01;
    $fn = 90;

    s = search([type],jst_data);

    pitch = jst_data[s[0]][1];
    body_adj = jst_data[s[0]][2];
    size_x = body_adj+(row*pitch);
    size_y = jst_data[s[0]][3];
    size_z = jst_data[s[0]][4];
    wall_size = jst_data[s[0]][5];
    pin_xadj = jst_data[s[0]][6];
    pin_yadj = jst_data[s[0]][7];
    pbheight = jst_data[s[0]][8];
    ptheight = jst_data[s[0]][9];
    pinsize = jst_data[s[0]][10];
    smtlead = [pinsize,.925,.32];

    if(entry == "top" && enablemask == false) {
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference() {
                union() {
                color(bcolor) cube([size_x, size_y, size_z]);
                    if(type == "pa") {
                        color(bcolor) translate([0, -.75+adj, 1.5]) cube([1.5, .75, size_z-3.01]);
                        color(bcolor) translate([size_x-1.5, -.75+adj, 1.5]) cube([1.5, .75, size_z-3.01]);
                        if(row >= 6) {
                            color(bcolor) translate([2.5, -.75+adj, 1.5]) cube([1.5, .75, size_z-3.01]);
                            color(bcolor) translate([size_x-4, -.75+adj, 1.5]) cube([1.5, .75, size_z-3.01]);
                        }
                    }
                }
                color(bcolor) translate([wall_size, wall_size, wall_size]) 
                    cube([size_x-(2*wall_size), size_y-(2*wall_size), size_z]);
                if(type == "xh") {
                    color(bcolor) translate([2, -.1, size_z/2]) cube([1.5, size_y-2, 4]);
                    color(bcolor) translate([size_x-3.5, -.1, size_z/2]) cube([1.5, size_y-2, 4]);
                    color(bcolor) translate([-1, .75, 5]) cube([2, .75, 3]);
                    color(bcolor) translate([size_x-2, .75, 5]) cube([size_y-2, .25*size[0], 3]);
                }
                if(type == "ph") {
                    color(bcolor) translate([2, -.1, 2]) cube([size_x-(2*pitch), size_y-2, 5]);
                    color(bcolor) translate([-1, 1.25, 4]) cube([size_y-2, .25*size[0], size_z]);
                    color(bcolor) translate([size_x-2, 1.25, 4]) cube([size_y-2, .25*size[0], size_z]);
                }
                if(type == "zh") {
                    color(bcolor) translate([-1, 1.25, size_z/2]) cube([size_y-2, .25*size[0], size_z]);
                    color(bcolor) translate([size_x-1, 1.25, size_z/2]) cube([size_y-2, 0.25*size[0], size_z]);
                }
                if(type == "sh") {
                    color(bcolor) translate([.25, .75, size_z/2]) cube([.25, .25, size_z]);
                    color(bcolor) translate([size_x-.5, .75, size_z/2]) cube([.25, .25, size_z]);
                }
                if(type == "pa") {
                    color(bcolor) translate([-1., -2.5, 6]) cube([size_x+2, 5, 4]);
                    color(bcolor) translate([1.5 ,2, size_z-1]) cube([size_x-3, 4, 4]);
                    color(bcolor) translate([wall_size, -.75+adj+wall_size, 1.5]) 
                        cube([1.5-(2*wall_size), 1, size_z-3.01]);
                    color(bcolor) translate([size_x-1.5+wall_size, -.75+adj+wall_size, 1.5])
                        cube([1.5-(2*wall_size), 1, size_z-3.01]);
                    if(row >= 6) {
                        color(bcolor) translate([2.875, -.5+adj, 1.75]) cube([1.5-(2*wall_size), 1, size_z-3.01]);
                        color(bcolor) translate([size_x-3.675, -.5+adj, 1.75]) cube([1.5-(2*wall_size), 1, size_z-3.01]);
                    }
                }
            }
            if(type == "sh") {
                color(bcolor) translate([.25, size_y-.75, 0]) cube([.5, .5, size_z]);
                color(bcolor) translate([size_x-.75, size_y-.75, 0]) cube([.5, .5, size_z]);
            }
            if(style == "thruhole") {
                for(r=[pin_xadj-(pinsize/2):pitch:size_x-pitch]) {
                    color("silver") translate([r, pin_yadj-(pinsize/2), -pbheight+adj])
                        cube([pinsize, pinsize, pbheight+ptheight]);
                }
            }
            if(style == "smt") {
                for(r=[pin_xadj-(pinsize/2):pitch:size_x-pitch]) {
                    color("silver") translate([r, pin_yadj-(pinsize/2), adj])
                        cube([pinsize, pinsize, ptheight]);
                    color("silver") translate([r, size_y-adj, 0]) 
                        cube(smtlead);
                }
            }
        }
    }
    if(entry == "side" && enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
            difference() {
                color(bcolor) cube([size_x, size_z, size_y]);
                color(bcolor) translate([wall_size, -wall_size, wall_size])
                    cube([size_x-(2*wall_size), size_z, size_y-(2*wall_size)]);
                if(type == "xh") {
                    color(bcolor) translate([2, -.1, size_z/2]) cube([1.5, 4, size_y-2]);
                    color(bcolor) translate([size_x-3.5, -.1, size_z/2]) cube([1.5, 4, size_y-2]);
                    color(bcolor) translate([-1, -.75, 4]) cube([2, 3, .75]);
                    color(bcolor) translate([size_x-1, -.75, 4]) cube([2, 3, .25*size[0]]);
                }
                if(type == "ph") {
                    color(bcolor) translate([2, -.1, 3]) cube([size_x-(2*pitch), 5, 2]);
                    color(bcolor) translate([-1, -4, size_y-2]) cube([size_y-2, size_z, 1]);
                    color(bcolor) translate([size_x-2, -4, size_y-2]) cube([size_y-2, size_z, 1]);
                }
                if(type == "zh") {
                    color(bcolor) translate([-1, -size_z+1.25, size_y-1.25]) cube([size_y-2, size_z, .25*size[0]]);
                    color(bcolor) translate([size_x-1, -size_z+1.25, size_y-1.25]) cube([size_y-2, size_z, 0.25*size[0]]);
                }
                if(type == "sh") {
                    color(bcolor) translate([.25, 0, size_z/2]) cube([.25, size_z, .25]);
                    color(bcolor) translate([size_x-.5, 0, size_z/2]) cube([.25, size_z, .25]);
                }
            }
            if(type == "xh") {
                difference() {
                    union() {
                        color(bcolor) translate([0, size_z, 0]) cube([1, 3.5, 4.5]);
                        color(bcolor) translate([size_x-1, size_z, 0]) cube([1, 3.5, 4.5]);
                    }
                    color(bcolor) translate([-1, size_z, 4.5]) rotate([-30, 0, 0]) cube([size_x+2, 5.5, 4]);
                }
            }
            if(type == "ph") {
                difference() {
                    union() {
                        color(bcolor) translate([0, size_z, 0]) cube([.75, 1.6, 3]);
                        color(bcolor) translate([size_x-.75, size_z, 0]) cube([.75, 1.6, 3]);
                    }
                    color(bcolor) translate([-1, size_z, 3]) rotate([-30, 0,0 ]) cube([size_x+2, 5.5, 4]);
                }
            }
            if(type == "zh") {
                difference() {
                    union() {
                        color(bcolor) translate([0, size_z, 0]) cube([.5, 1.5, 2.5]);
                        color(bcolor) translate([size_x-.5, size_z, 0]) cube([.5, 1.5, 2.5]);
                    }
                    color(bcolor) translate([-1, size_z, 2.5]) rotate([-30, 0, 0]) cube([size_x+2, 5.5, 4]);
                }
            }
            if(type == "sh") {
                color(bcolor) translate([wall_size, 0, wall_size]) cube([.5, size_z, .5]);
                color(bcolor) translate([size_x-.75, 0, wall_size]) cube([.5, size_z, .5]);
            }
            if(style == "thruhole") {
                for(r=[pin_xadj-(pinsize/2):pitch:size_x-pitch]) {
                    color("silver") translate([r, -adj, size_y-(pin_yadj+(pinsize/2))]) 
                        cube([pinsize, ptheight, pinsize]);
                    color("silver") translate([r, size_z-pinsize, -pbheight+adj]) cube([pinsize, pinsize, pbheight]);
                }
            }
            if(style == "smt") {
                for(r=[pin_xadj-(pinsize/2):pitch:size_x-pitch]) {
                    color("silver") translate([r, -adj, size_y-(pin_yadj+(pinsize/2))])
                        cube([pinsize, ptheight, pinsize]);
                    color("silver") translate([r, size_z-adj, 0]) 
                        cube(smtlead);
                }
            }
        }
    }
    if(entry == "side" && enablemask == true && cmask == true && mstyle == "default") {
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        translate([0-.5,-mlen+back,0]) cube([size_x+1, mlen, size_y+.5]);
    }
}