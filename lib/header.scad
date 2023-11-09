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

    header(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask)
           size[0] = #rows
           size[1] = #columns
           size[2] = height
           data[0] = style 
           data[1] = header color
           data[2] = "male", "female"
           data[3] = pitch
           data[4] = pin color

*/

// header class
module header(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    rows = size[0];
    column = size[1];
    height = size[2];
    style = data[0];
    hcolor = data[1];
    gender = data[2];
    pitch = data[3];
    pcolor = data[4];

    adj = .01;
    $fn = 90;

    if(type=="default" && style == "thruhole" && enablemask == false) {
        size_x = pitch * column;
        size_y = pitch * rows;
        if(gender == "male") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)        
            union() {
                color(hcolor) cube([size_x, size_y, 2.5]);
                for(c=[1:pitch:size_x]) {
                    for(r=[1:pitch:size_y]) {
                        color(pcolor) translate ([c,r,-3.2]) cube([.64,.64,height]);
                    } 
                }
            }
        }
        if(gender == "female") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)        
            union() {
                difference() {
                    color(hcolor) cube([size_x, size_y, height]);
                    for(c=[1:pitch:size_x]) {
                        for(r=[1:pitch:size_y]) {
                            color("dimgray") translate ([c,r,height-5+adj]) cube([.64,.64,height-1]);
                            color(pcolor) translate ([c,r,-3.2]) cube([.64,.64,3.3]);
                        }
                    }
                }
                for(c=[1:pitch:size_x]) {
                    for(r=[1:pitch:size_y]) {
                        color(pcolor) translate ([c,r,-3.2]) cube([.64,.64,3.3]);
                    }
                }
            }
        }
    }
    if(type=="default" && style == "smt" && enablemask == false) {
        size_x = 2.5 * column;
        size_y = 2.5 * rows;
        height = 7.1;
        
        if(gender == "male") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)        
            union() {
                color(hcolor) cube([size_x, size_y, 2.5]);
                for(c=[1:pitch:size_x]) {
                    for(r=[1:pitch:size_y]) {
                        color(pcolor) translate ([c,r,.5]) cube([.64,.64,height]);
                    } 
                }
                for(r=[1:pitch:size_x]) {
                    for(c=[1:pitch:size_y]) {
                        color(pcolor) translate ([r,-.99,0]) cube([.64,.925,.64]);
                        color(pcolor) translate ([r,(rows*2.5)-.01,0]) cube([.64,.925,.64]);
                    }
                }
            }
        }
        if(gender == "female") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)        
            union() {
                difference() {
                    color(hcolor) cube([size_x, size_y, height]);
                    for(c=[1:pitch:size_x]) {
                        for(r=[1:pitch:size_y]) {
                            color("dimgray") translate ([c,r,height-5+adj]) cube([.64,.64,height-1]);
                        }
                    }
                }
                for(r=[1:pitch:size_x]) {
                    for(c=[1:pitch:size_y]) {
                        color(pcolor) translate ([r,-.99,0]) cube([.64,.925,.64]);
                        color(pcolor) translate ([r,(rows*2.5)-.01,0]) cube([.64,.925,.64]);
                    }
                }
            }
        }
    }
}
