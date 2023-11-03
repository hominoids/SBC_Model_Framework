/*
    This file is part of SBC Model Framework https://github.com/hominoids/SBC_Model_Framework
    Copyright 2016,2017,2018,2019,2020,2021,2022 Edward A. Kisiel hominoid@cablemi.com

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


*/

/* shape module */
module shape(type, size, data) {

    if(type == "rectangle") {
        cube([size[0],size[1],size[2]]);
    }
    if(type == "round") {
            cylinder(d=size[0], h=size[2]);
    }    
    if(type == "slot") {
            slot(size[0],size[1],size[2]);
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


/* slot module */
module slot(hole,length,depth) {
    
    hull() {
        translate([hole/2,0,0]) cylinder(d=hole,h=depth);
        translate([length-hole/2,0,0]) cylinder(d=hole,h=depth);        
        }
    } 
