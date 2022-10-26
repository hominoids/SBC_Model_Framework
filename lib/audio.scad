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
 
// audio class
module audio(x,y,rotation,side,type,pcbsize_z) {
    
    // out in and spdif stacked type
    if(type=="out-in-spdif") {
        size_x = 12.7;
        size_y = 21.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                union() {
                    color("silver") translate([0,0,0]) cube([size_x,size_y,35]);
                    color("black") translate([6.35,-3.2,17]) rotate([-90,0,0]) 
                    cylinder(d=8, h=6.25);
                    color("black") translate([6.35,-3.2,29]) rotate([-90,0,0]) 
                    cylinder(d=8, h=6.25);
                    color("dimgray") translate([1.85,-2.0,2]) cube([9,2,9]);
                    }
                color("dimgray") translate([6.35,-3.25,17]) rotate([-90,0,0]) 
                        cylinder(d=3.75, h=9);
                color("dimgray") translate([6.35,-3.25,29]) rotate([-90,0,0]) 
                        cylinder(d=3.75, h=9);
                difference() {
                    color("dimgray") translate([2.85,-2.1,3]) cube([7,9,7]);
                    color("dimgray") translate([1.85,-2,3]) rotate([0,45,0]) cube([1.5,9,1.5]);
                    color("dimgray") translate([8.75,-2,3]) rotate([0,45,0]) cube([1.5,9,1.5]);
                }
           }
        }
    }
    
    // 3.5mm jack type
    if(type=="jack_3.5") {
        size_x = 6.5;
        size_y = 12;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                union() {
                    color("black") translate([0,2,0]) cube([size_x,10,4]);
                    color("silver") translate([0,0,0]) cube([size_x,2,4]);
                    color("black") translate([3.125,-2,2]) rotate([-90,0,0]) cylinder(d=4, h=6.25);
                    }
                color("dimgray") translate([3.125,-2.5,2]) rotate([-90,0,0]) cylinder(d=3, h=6);
            }
        }
    }
    
    // audio micro connector type
    if(type=="audio_micro") {
        size_x = 7.5;
        size_y = 3.75;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([0,0,3.75]) rotate([-90,0,0])
        union() {  
            difference () {
                color("white") translate([0,0,0]) cube([size_x,size_y,4.75]);
                color("darkgray") translate([1.5,.5,1]) cube([4.5,2.75,6]);
                color("white") translate([-.5,.75,-.5]) cube([1,2.5,6]);
                color("white") translate([7,.75,-.5]) cube([1,2.5,6]);
                color("darkgray") translate([2.25,-.5,1]) cube([3,2,6]);
            }
            color("silver") translate ([2.75,2,.5]) cube([.6,.6,4]);
            color("silver") translate ([4.5,2,.5]) cube([.6,.6,4]);
        }
    }    
}
