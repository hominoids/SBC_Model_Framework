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

// combo class
module combo(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask) {
    
    // rj-45 and usb2 stacked type
    if(type=="rj45-usb2_double") {
        size_x = 19;
        size_y = 27.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference () {
                color("lightgray") translate([0,0,0]) cube([size_x, size_y, 31]);
                color("darkgray") translate([3,-1,19]) cube([13, 19.5, 8]);
                color("darkgray") translate([7,-2,24.5]) cube([5, 19.5, 5]);
                color("dimgray") translate([3,-.1,1.5]) cube([13, 7.5, 7]);
                color("dimgray") translate([3,-.1,10.5]) cube([13, 7.5, 7]);                
            }
            color("green") translate([3,-.1,27.5]) cube([3, 2, 2]);
            color("orange") translate([13,-.1,27.5]) cube([3, 2, 2]);
            color("white") translate([4,1,5]) cube([11, 12.5, 1.5]);
            color("white") translate([4,1,14]) cube([11, 12.5, 1.5]);
        }
    }
    
    // rj-45 and usb3 stacked 
    if(type=="rj45-usb3_double") {
        size_x = 19;
        size_y = 27.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference () {
                color("lightgray") translate([0,0,0]) cube([size_x, size_y, 31]);
                color("darkgray") translate([3,-1,19]) cube([13, 19.5, 8]);
                color("darkgray") translate([7,-2,24.5]) cube([5, 19.5, 5]);
                color("dimgray") translate([3,-.1,1.5]) cube([13, 7.5, 7]);
                color("dimgray") translate([3,-.1,10.5]) cube([13, 7.5, 7]);                
            }
            color("green") translate([3,-.1,27.5]) cube([3, 2, 2]);
            color("orange") translate([13,-.1,27.5]) cube([3, 2, 2]);
            color("royalblue") translate([4,1,5]) cube([11, 12.5, 1.5]);
            color("royalblue") translate([4,1,14]) cube([11, 12.5, 1.5]);
        }
    }
    
    // usb3 and usbc double stacked type
    if(type=="double_stacked_usb3-usbc") {
        $fn = 90;
        size_x = 13.25;
        size_y = 17.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 15.5]);
                color("dimgray") translate([1,-.1,8.75]) cube([11.25, 15.5, 6.5]);
                color("silver") translate([0,0,1])
                rotate([90,0,0])  translate([4,1,-7]) hull() {
                    translate([0,0,0]) cylinder(d=3,h=7+.2);
                    translate([9-3.5,0,0]) cylinder(d=3,h=7+.2);        
                    }
            }
            color("silver") translate([0,0,6.75]) cube([13.25, 17.5, 2]);
            color("royalblue") translate([1.5,1,12]) cube([10, 12.5, 1.5]);
            color("silver") translate([-.65,0,1]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,1]) cube([.65,.5,5]);
            color("silver") translate([-.65,0,9]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,9]) cube([.65,.5,5]);
            color("silver") translate([1,0,15.5]) cube([11.5,.5,.65]);            
            color("black") rotate([90,0,0])  translate([4,1.25,-7]) cube([5.5,1.2,6]);
        }
    }
}
