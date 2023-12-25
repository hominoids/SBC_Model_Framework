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
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    Code released under GPLv3: http://www.gnu.org/licenses/gpl.html


    DESCRIPTION: creates pcb and features
           TODO: 
           
          USAGE: pcb(size[], radius)
          
                     size[0] = size_x
                     size[1] = size_y
                     size[2] = size_z
                     radius = corner radius

    DESCRIPTION: creates pcb hole
           TODO: cu edge shapes
                      
          USAGE: pcbhole(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])
          
                         type = "round"
                         size[0] = hole diameter
                         data[0] = style
                         data[1] = hole color
                         data[2] = shape
                         data[3] = trace diameter
                         
    DESCRIPTION: creates soc components
           TODO: add other styles
           
          USAGE: pcbsoc(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])
          
                     type = "flat", "raised", "mid-raised", "rk3399", "rk3588"
                     size[0] = size_x
                     size[1] = size_y
                     size[2] = size_z

    DESCRIPTION: creates pcb pads
           TODO: casteel edge hole
           
          USAGE: pcbpad(pads, style)

                         pads = #pads
                         style = "round", "square"

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
        shape = data[2];
        trace = data[3];
        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        difference() {
            color(hcolor) translate([0, 0, -.0625-pcbsize_z]) cylinder(d=trace, pcbsize_z+.125);
            color(hcolor) translate([0, 0, -1.125-pcbsize_z]) cylinder(d=size_x-.125, pcbsize_z+2);
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
                translate([2,2,size_z-.01]) color("silver") slab([size_x-4, size_y-4, .6],2);
            }
    }
    if(type == "raised" && enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("silver") cube([size_x, size_y, size_z]);
                translate([2,2,size_z-.01]) color("silver") slab([size_x-4, size_y-4, .6],.5);
            }
    }
    if(type == "rk3588" && enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("silver") cube([size_x, size_y, size_z]);
                translate([2,2,size_z-.01]) color("silver") slab([size_x-4, size_y-4, .6],.5);
            }
    }
    if(type == "mid-raised" && enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                color("silver") cube([size_x, size_y, size_z]);
                color("silver") translate([data[0],data[1],size_z-.01]) rotate([90,0,90]) slot(data[5],data[3],data[4]);
            }
    }
}


// single row pcb pad
module pcbpad(pads, style) {

    adj = .01;
    $fn = 90;
    pad_size = 1.25;
    size_y = 2.54;
    size_x = 2.54 * (pads-1);                
    union() {
        for (i=[0:2.54:size_x]) {
            if(style == "round") {
                difference() {
                    color("#fee5a6") translate ([i,0,0]) cylinder(d=pad_size, h=.125);
                    color("dimgray") translate([i,0,-adj]) cylinder(d=.625, h=.125+2*adj);
                }
            }
            if(style == "square") {
                difference() {
                    color("#fee5a6") translate ([i-pad_size/2,-pad_size/2,0]) cube([pad_size, pad_size, .125]);
                    color("dimgray") translate([i,0,-adj]) cylinder(d=.625, h=.125+2*adj);
                }
            }
        }
    }
}