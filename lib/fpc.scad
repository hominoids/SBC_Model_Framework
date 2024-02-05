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


     CLASS NAME: fpc
    DESCRIPTION: creates fpc connectors
           TODO: add other styles 

          USAGE: fpc(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                     type = "fh19"
                    loc_x = x location placement
                    loc_y = y location placement
                    loc_z = z location placement
                     side = "top", "bottom"
               rotation[] = object rotation
                  size[0] = #pins
                  data[0] = "smt"
                  data[1] = "side"
                  data[2] = body color
                  data[3] = tab color
                pcbsize_z = pcb thickness
               enablemask = true produces mask, false produces model
                  mask[0] = true enables component mask
                  mask[1] = mask length
                  mask[2] = mask setback
                  mask[3] = mstyle "default"

                     type = "fh12"
                    loc_x = x location placement
                    loc_y = y location placement
                    loc_z = z location placement
                     side = "top", "bottom"
               rotation[] = object rotation
                  size[0] = #pins
                  data[0] = "smt"
                  data[1] = "top"
                  data[2] = body color
                  data[3] = tab color
                pcbsize_z = pcb thickness
               enablemask = true produces mask, false produces model
                  mask[0] = true enables component mask
                  mask[1] = mask length
                  mask[2] = mask setback
                  mask[3] = mstyle "default"

*/

// fpc connector class
module fpc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {    

    row = size[0];
    style = data[0];
    entry = data[1];
    bcolor = data[2];
    tcolor = data[3];
    pcolor = "#fee5a6";
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
                               b             a   p     p     t    p    p
                               o             l   i     i               i
                               d   s     s   l   n     n     h    h    n
                          p    y   i     i                   e    e    
                   t      i        z     z   s   x     y     i    i    s
                   y      t    a   e     e   i   a     a     g    g    i
                   p      c    d             z   d     d     h    h    z
                   e      h    j   y     z   e   j     j     t    t    e
*/
    fpc_data = [
                ["fh19", .5,   2, 2.5,  .9, .25, 1.25, 2.4,  3.4, 1,  .15],
                ["fh12", .5, 1.9, 3.5, 3.6, .25, 1.9,  2.4,  3.4, 1,  .15]
               ];

    adj = .01;
    $fn = 90;

    s = search([type],fpc_data);

    pitch = fpc_data[s[0]][1];
    body_adj = fpc_data[s[0]][2];
    size_x = body_adj+(row*pitch);
    size_y = fpc_data[s[0]][3];
    size_z = fpc_data[s[0]][4];
    wall_size = fpc_data[s[0]][5];
    pin_xadj = fpc_data[s[0]][6];
    pin_yadj = fpc_data[s[0]][7];
    pbheight = fpc_data[s[0]][8];
    ptheight = fpc_data[s[0]][9];
    pinsize = fpc_data[s[0]][10];
    smtlead = [pinsize,.5,.15];
    size_xm = size_x;
    size_ym = size_y;
    size_zm = 2;

    if(entry == "top" && enablemask == false) {
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference() {
                color(bcolor) cube([size_x, size_y, size_z]);
                translate([-2,-1,size_z-.5]) color(bcolor) cube([3, size_y+2, 3]);
                translate([size_x-1,-1,size_z-.5]) color(bcolor) cube([3, size_y+2, 3]);
                translate([-2,-1,size_z-.5]) color(bcolor) cube([size_x+2, size_y, 3]);
                translate([-.5,-5.25,-adj]) color(bcolor) cylinder(d=12, h=4);
                translate([size_x+.5,-5.25,-adj]) color(bcolor) cylinder(d=12, h=4);
             }
            difference() {
                translate([-.5,-.25,size_z-.5-adj]) color(tcolor) cube([size_x+1, size_y+.5, .45+adj]);
                translate([.5,size_y-.1,size_z-2]) color(tcolor) cube([size_x-1, size_y, 3]);
                translate([-.5,-5.5,-adj]) color(tcolor) cylinder(d=12, h=4);
                translate([size_x+.5,-5.5,-adj]) color(tcolor) cylinder(d=12, h=4);
            }
            if(style == "thruhole") {
                for(r=[pin_xadj-(pinsize/2):pitch:size_x-pitch]) {
                    color(pcolor) translate([r, pin_yadj-(pinsize/2), -pbheight+adj])
                        cube([pinsize, pinsize, pbheight+ptheight]);
                }
            }
            if(style == "smt") {
                for(r=[body_adj/2+pinsize:pitch:size_x-(body_adj/2)-pinsize]) {
                    color(pcolor) translate([r, size_y-adj, 0]) 
                        cube(smtlead);
                }
            }
        }
    }
    if(entry == "side" && enablemask == true && cmask == true && mstyle == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, back, size_zm/3]) rotate([90, 0, 0]) slot(size_zm, size_x, mlen);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, back, size_zm/3]) rotate([90, 0, 0]) slot(size_zm, size_x, mlen);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, 1+back, size_zm/3]) rotate([90, 0, 0]) slot(size_zm, size_x, mlen);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, .5+back, size_zm/3]) rotate([90, 0, 0]) slot(size_zm, size_x, mlen);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, back, size_zm/3]) rotate([90, 0, 0]) slot(size_zm, size_x, mlen);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, .5+back, size_zm/3]) rotate([90, 0, 0]) slot(size_zm, size_x, mlen);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, 1+back, size_zm/3]) rotate([90, 0, 0]) slot(size_zm, size_x, mlen);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, back, size_zm/3]) rotate([90, 0, 0]) slot(size_zm, size_x, mlen);
            }
    }
    if(entry == "side" && enablemask == true && cmask == true && mstyle == "block") {
            if(side == "top" && rotation == 270) {
                place(loc_x, loc_y, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    translate([0, -1.5+back, size_zm-5.5]) rotate([90, 0, 0]) cube([size_x, size_zm+3.5, mlen]);
            }
    }
    if(entry == "side" && enablemask == false) {
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
            difference() {
                color(bcolor) cube([size_x, size_y, size_z]);
                color("#353535") translate([body_adj/2, -wall_size, .31]) 
                    cube([size_x-body_adj, size_y, size_z]);
            }
            if(type == "fh19") {
                difference() {
                    color(tcolor) translate([.125+body_adj/2, -.5,.5]) cube([size_x-body_adj-.25, 2.625, .25]);
                    color(tcolor) translate([.115+body_adj/2, -.55,0]) cube([(size_x-body_adj-.25)/3, .25, 3]);
                    color(tcolor) translate([(.135+body_adj/2)+(size_x-body_adj-.25)/1.5, -.55,0]) 
                        cube([(size_x-body_adj-.25)/3, .25, 3]);
                }
            }
            if(style == "smt") {
                for(r=[pin_xadj-(pinsize/2):pitch:size_x-body_adj/2]) {
                    color(pcolor) translate([r, -adj, .21]) 
                        cube([pinsize, ptheight, pinsize]);
                    color(pcolor) translate([r, size_y-adj, 0])
                        cube(smtlead);
                }
            }
        }
    }
}
