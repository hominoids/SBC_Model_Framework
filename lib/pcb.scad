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


     CLASS NAME: pcbhole
    DESCRIPTION: creates pcb hole
           TODO: cu edge shapes

          USAGE: pcbhole(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                         type = "round"
                        loc_x = x location placement
                        loc_y = y location placement
                        loc_z = z location placement
                         side = "top", "bottom"
                   rotation[] = object rotation
                      size[0] = hole diameter
                      data[0] = style
                      data[1] = hole color
                      data[2] = sidewall support("none","left","right","rear","front")
                      data[3] = trace diameter
                      data[4] = position "left_rear","left_front","right_rear","right_front","middle_rear","middle_front",
                                         "heatsink_left","heatsink_right","heatsink_rear","heatsink_front","pcie_1","gpio_1","misc_1"
                    pcbsize_z = pcb thickness
                   enablemask = true produces mask, false produces model
                      mask[0] = true enables component mask
                      mask[1] = mask length
                      mask[2] = mask setback
                      mask[3] = mstyle "default"


     CLASS NAME: pcbsoc
    DESCRIPTION: creates soc components
           TODO: add other styles

          USAGE: pcbsoc(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                        type = "flat", "raised", "mid-raised", "rk3399", "rk3588"
                       loc_x = x location placement
                       loc_y = y location placement
                       loc_z = z location placement
                        side = "top", "bottom"
                  rotation[] = object rotation
                     size[0] = size_x
                     size[1] = size_y
                     size[2] = size_z
                   pcbsize_z = pcb thickness
                  enablemask = true produces mask, false produces model
                     mask[0] = true enables component mask
                     mask[1] = mask length
                     mask[2] = mask setback
                     mask[3] = mstyle "default"


     CLASS NAME: pcbpad
    DESCRIPTION: creates pcb pads
           TODO: 
           
          USAGE: pcbpad(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                        type = "round", "square", "sqround", "castellation"
                       loc_x = x location placement
                       loc_y = y location placement
                       loc_z = z location placement
                        side = "top", "bottom"
                  rotation[] = object rotation
                     size[0] = #pad x
                     size[1] = #pad y
                     data[0] = hole size
                     data[1] = pad color
                     data[2] = pad size
                     data[5] = pad_trim ("front", "rear")
                   pcbsize_z = pcb thickness
                  enablemask = true produces mask, false produces model
                     mask[0] = true enables component mask
                     mask[1] = mask length
                     mask[2] = mask setback
                     mask[3] = mstyle "default"


     CLASS NAME: pcb
    DESCRIPTION: creates pcb and features
           TODO: 

          USAGE: pcb(size[], radius)

                     size[0] = size_x
                     size[1] = size_y
                     size[2] = size_z
                     radius = corner radius

*/

// pcb board
module pcb(size, radius) {
    x = size[0];
    y = size[1];
    z = size[2];
    linear_extrude(height = z)
    hull() {
        translate([0+radius ,0+radius, 0]) circle(r = radius);
        translate([0+radius, y-radius, 0]) circle(r = radius);
        translate([x-radius, y-radius, 0]) circle(r = radius);
        translate([x-radius, 0+radius, 0]) circle(r = radius);
    }
}


// pcb hole additions
module pcbhole(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    // pcbhole class
    if(type == "round" && enablemask == false) {

        size_x = size[0];
        size_y = size[0];
        style = data[0];
        hcolor = data[1];
        support = data[2];
        pad_size = data[3];
        hole_position = data[4];

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        difference() {
            color(hcolor) translate([0, 0, -.0635-pcbsize_z]) cylinder(d=pad_size, pcbsize_z+.127);
            color(hcolor) translate([0, 0, -1.127-pcbsize_z]) cylinder(d=size_x-.127, pcbsize_z+2);
        }
    }
}


// pcb soc class
module pcbsoc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    size_x = size[0];
    size_y = size[1];
    size_z = size[2];

    if(type == "flat" && enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            color("dimgray") cube([size_x, size_y, size_z]);
    }
    if(type == "rk3399") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("silver") cube([size_x, size_y, size_z]);
                translate([2, 2, size_z-.01]) color("silver") slab([size_x-4, size_y-4, .6],2);
            }
    }
    if(type == "raised" && enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("silver") cube([size_x, size_y, size_z]);
                translate([2, 2, size_z-.01]) color("silver") slab([size_x-4, size_y-4, .6],.5);
            }
    }
    if(type == "rk3588" && enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("silver") cube([size_x, size_y, size_z]);
                translate([2, 2, size_z-.01]) color("silver") slab([size_x-4, size_y-4, .6],.5);
            }
    }
    if(type == "mid-raised" && enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("silver") cube([size_x, size_y, size_z]);
                color("silver") translate([data[0], data[1], size_z-.01]) rotate([90,0,90]) slot(data[5], data[3], data[4]);
            }
    }
}


// pcb pad matrix
module pcbpad(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    size_x = 2.54 * (size[0]-1);
    size_y = 2.54 * (size[1]-1);;

    hole_size = data[0];
    hcolor = data[1];
    pad_size = data[2];
    pad_trim = data[3];

    adj = .01;
    $fn = 90;

    place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
    union() {
        for (c=[0:2.54:size_y]) {
            for (r=[0:2.54:size_x]) {
                if(type == "round") {
                    difference() {
                        color(hcolor) translate ([r, c, -.0635-pcbsize_z]) cylinder(d=pad_size, h=pcbsize_z+.127);
                        color(hcolor) translate([r, c, -1.127-pcbsize_z]) cylinder(d=hole_size, h=pcbsize_z+2);
                    }
                }
                if(type == "sqround") {
                    if(c != 0) {
                        difference() {
                            color(hcolor) translate ([r, c, -.0635-pcbsize_z]) cylinder(d=pad_size, h=pcbsize_z+.127);
                            color(hcolor) translate([r, c, -1.127-pcbsize_z]) cylinder(d=hole_size, h=pcbsize_z+2);
                        }
                    }
                    else {
                        difference() {
                            color(hcolor) translate ([r-pad_size/2, c-pad_size/2, -.0635-pcbsize_z]) cube([pad_size, pad_size, pcbsize_z+.127]);
                            color(hcolor) translate([r, c, -1.127-pcbsize_z]) cylinder(d=hole_size, h=pcbsize_z+2);
                        }
                    }
                }
                if(type == "square") {
                    difference() {
                        color(hcolor) translate ([r-pad_size/2, c-pad_size/2, -.0635-pcbsize_z]) cube([pad_size, pad_size, pcbsize_z+.127]);
                        color(hcolor) translate([r, c, -1.127-pcbsize_z]) cylinder(d=hole_size, h=pcbsize_z+2);
                    }
                }
                if(type == "castellation") {
                    difference() {
                        color(hcolor) translate ([r, c, -.0635-pcbsize_z]) cylinder(d=pad_size, h=pcbsize_z+.127);
                        color(hcolor) translate([r, c, -1.127-pcbsize_z]) cylinder(d=hole_size, h=pcbsize_z+2);
                        if(pad_trim == "rear") {
                            color(hcolor) translate([r, c-1.5-adj, 0]) cube([3,3,5], center=true);
                        }
                        if(pad_trim == "front") {
                            color(hcolor) translate([r, c+1.5+adj, 0]) cube([3,3,5], center=true);
                        }
                    }
                }
            }
        }
    }
}