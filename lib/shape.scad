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


    DESCRIPTION: creates geometric shapes
           TODO:

          USAGE: shape(type, size[], data[])

                     type = "rectangle", "round", "slot", "polygon", "dxf"
                     size[0] = size_x
                     size[1] = size_y
                     size[2] = size_z
                     data[0] = body color
                     data[2] = polygon data or dxf file

          USAGE: slab(size[], radius])

                     size[0] = size_x
                     size[1] = size_y
                     size[2] = size_z
                     radius = corner radius

          USAGE: slab_r(size[], radius[]])

                     size[0] = size_x
                     size[1] = size_y
                     size[2] = size_z
                     radius[0] = corner radius
                     radius[1] = corner radius
                     radius[2] = corner radius
                     radius[3] = corner radius

          USAGE: slot(hole, length, depth)

                     hole = radius diameter
                     length = total length
                     depth = thickness

          USAGE: long_slot(hole, length, depth)

                     hole = radius diameter
                     length = total length
                     depth = thickness

          USAGE: knockout(width, depth, gap, thick, fillet, shape)

                     width = length
                     depth = width
                     gap = space between 
                     thick = thickness
                     fillet = corner fillet
                     shape = "slot", "rectangle", "round"

          USAGE: vent(width, length, height, gap, rows, columns, orientation)

                     width = coloumn size_x
                     length = column size_y
                     height = size_z
                     gap = space between 
                     rows = #row
                     columns = #columns
                     orientation = "horizontal", "vertical"

          USAGE: vent_hex(cells_x, cells_y, thickness, cell_size, cell_spacing, orientation)
                     cells_x = #rows
                     cells_y = #columns
                     thickness = 
                     cell_size = size of hex
                     cell_spacing = space between hex
                     orientation = "horizontal", "vertical"

*/

/* shape module */
module shape(type, size, data) {

    if(type == "rectangle") {
        cube([size[0], size[1], size[2]]);
    }
    if(type == "round") {
            cylinder(d=size[0], h=size[2]);
    }    
    if(type == "slot") {
            slot(size[0], size[1], size[2]);
    }    
    if(type == "polygon") {
            linear_extrude(height = size[2]) polygon(data[2]);
    }    
    if(type == "dxf") {
            linear_extrude(height = size[2]) import(file = data[2], scale=data[3]); 
    }
}

/* slab module */
module slab(size, radius) {

    x = size[0];
    y = size[1];
    z = size[2];
    linear_extrude(height=z)
    hull() {
        translate([0+radius ,0+radius, 0]) circle(r=radius);
        translate([0+radius, y-radius, 0]) circle(r=radius);
        translate([x-radius, y-radius, 0]) circle(r=radius);
        translate([x-radius, 0+radius, 0]) circle(r=radius);
    }
}


/* multi-radius round slab */
module slab_r(size, radius) {

    x = size[0];
    y = size[1];
    z = size[2];
    r0 = radius[0];
    r1 = radius[1];
    r2 = radius[2];
    r3 = radius[3];

    linear_extrude(height=z)
    hull() {
        translate([0+radius[0] ,0+radius[0], 0]) circle(r=radius[0]);
        translate([0+radius[1], y-radius[1], 0]) circle(r=radius[1]);
        translate([x-radius[2], y-radius[2], 0]) circle(r=radius[2]);
        translate([x-radius[3], 0+radius[3], 0]) circle(r=radius[3]);
    }
}


/*
           NAME: slot
    DESCRIPTION: create slot shape to length
           TODO: none

          USAGE: slot(hole, length, depth)

                      hole = diameter of slot
                    length = length of slot
                     depth = thickness of slot
*/

module slot(hole,length,depth) {

    hull() {
        translate([hole/2, 0, 0]) cylinder(d=hole, h=depth);
        translate([length-hole/2, 0, 0]) cylinder(d=hole, h=depth);
    }
}


/*
           NAME: long_slot
    DESCRIPTION: create slot shape with full movement of length
           TODO: none

          USAGE: long_slot(hole, length, depth)

                      hole = diameter of slot
                    length = length of slot
                     depth = thickness of slot
*/

module long_slot(hole, length, depth) {

    hull() {
        translate([0,0,0]) cylinder(d=hole,h=depth);
        translate([length,0,0]) cylinder(d=hole,h=depth);
        }
    } 


/* knockout opening */
module knockout(width,depth,gap,thick,fillet,shape) {
    
    adj = .01;
    $fn=90;

    // slot knockout
    if(shape == "slot") {
        difference() {
            slot(depth, width, thick);
            translate([gap/2, 0, -adj]) slot(depth-gap, width-gap, thick+(2*adj));
            // cross ties    
            translate([(depth/2), -(depth/2)-1, -adj]) cube([2, depth+2, thick+(2*adj)]);
            translate([(width/2)-1-(width/4)+4, -(depth/2)-1, -adj]) cube([2,depth+2, thick+(2*adj)]);
            translate([(width/2)-1+(width/4)-4, -(depth/2)-1, -adj]) cube([2, depth+2, thick+(2*adj)]);
            translate([width-(depth/2)-2, -(depth/2)-1, -adj]) cube([2, depth+2, thick+(2*adj)]);
            }
        }
    if(shape == "rectangle") {
        difference() {
            translate([(width/2), (depth/2), thick/2]) 
                cube_fillet_inside([width, depth, thick], 
                    vertical=[fillet, fillet, fillet, fillet], 
                        top=[0, 0, 0, 0], bottom=[0, 0, 0, 0], $fn=90);
            translate([(width/2), (depth/2), (thick/2)-adj]) 
                cube_fillet_inside([width-gap, depth-gap, thick+(3*adj)], 
                    vertical=[fillet, fillet, fillet, fillet], 
                        top=[0, 0, 0, 0], bottom=[0, 0, 0, 0], $fn=90);
            // cross ties
            translate([-1, (depth/2)-1, -adj]) cube([gap+2, 2, thick+(2*adj)]);
            translate([width-4, depth-gap-1, -adj]) cube([2, gap+2, thick+(2*adj)]);
            translate([2, depth-gap-1, -adj]) cube([2, gap+2, thick+(2*adj)]);
            translate([width-gap-1, (depth/2)-1, -adj]) cube([gap+2, 2, thick+(2*adj)]);
            translate([width-4, -1, -adj]) cube([2, gap+2, thick+(2*adj)]);
            translate([2, -1, -adj]) cube([2, gap+2, thick+(2*adj)]);
            }
        }
    if(shape == "round") {
        difference() {
            translate([(width/2),(width/2),0]) 
                cylinder(d=width, h=thick); 
            translate([(width/2), (width/2), -adj]) 
                cylinder(d=width-gap, h=thick+2*adj); 
            // cross ties    
            translate([-1, (depth/2)-1, -adj]) cube([gap+2, 2, thick+(2*adj)]);
            translate([(width/2)-1, depth-gap-1, -adj]) cube([2, gap+2, thick+(2*adj)]);
            translate([width-gap-1, (depth/2)-1, -adj]) cube([gap+2, 2, thick+(2*adj)]);
            translate([(width/2)-1, -1, -adj]) cube([2, gap+2, thick+(2*adj)]);
            }
        }
    }


/* vent opening */
module vent(width,length,height,gap,rows,columns,orientation) {

    fillet = width/2;
    adj = .01;
    $fn=90;

    // vertical orientation
    if(orientation == "vertical") { rotate([90 ,0, 0])
        for (r=[0 : length+gap:rows*(length+gap)-1]) {
            for (c=[0 : width+(2*gap) : (columns*(width+(2*gap)))-1]) {
                translate ([c, r, -1]) cube([width, length, height]);
            }
        }
    }
    // horizontal orientation
    if(orientation == "horizontal") {
        for (r=[0 : length+(2*gap) : rows*(length+gap)]) {
            for (c=[0 : width+(2*gap) : (columns*(width+(2*gap)))-1]) {
                translate ([c,r,-1]) cube([width, length, height]);
            }
        }
    }
}


/* hex vent opening */
module vent_hex(cells_x, cells_y, thickness, cell_size, cell_spacing, orientation) {
    xs = cell_size + cell_spacing;
    ys = xs * sqrt(3/4);
    rot = (orientation == "vertical") ? 90 : 0;

    rotate([rot, 0, 0]) translate([cell_size/2, cell_size*sqrt(1/3),-1]) {
        for (ix=[0 : ceil(cells_x/2)-1]) {
            for (iy = [0 : 2 : cells_y-1]) {
                translate([ix*xs, iy*ys, 0]) rotate([0, 0, 90]) 
                    cylinder(r=cell_size/sqrt(3), h=thickness, $fn=6);
            }
        }
        for (ix=[0 : (cells_x/2)-1]) {
            for (iy = [1 : 2 : cells_y-1]) {
            translate([(ix+0.5)*xs, iy*ys, 0]) rotate([0, 0, 90]) 
                cylinder(r=cell_size/sqrt(3), h=thickness, $fn=6);
            }
        }
    }
}

