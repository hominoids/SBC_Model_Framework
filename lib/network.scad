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
 
// network class
module network(x,y,rotation,side,type,pcbsize_z) {
    // rj45 single socket
    if(type == "rj45_single") {    
        size_x = 15.9;
        size_y = 21.3;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z) 
        union() {
            difference () {
                color("lightgray") translate([0,0,0]) cube([size_x,size_y,13.5]);
                color("darkgray") translate([1.5,-1,1.5]) cube([13, 19.5, 8]);
                color("darkgray") translate([5.5,-2,7]) cube([5, 19.5, 5]);
            }
            color("green") translate([2,-.1,10]) cube([3, 2, 2]);
            color("orange") translate([11,-.1,10]) cube([3, 2, 2]);
        }
    }
    if(type == "rj45_single_short") {    
        size_x = 14.4;
        size_y = 12.67;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z) 
        union() {
            difference () {
                color("lightgray") translate([0,0,-1.6]) cube([size_x,size_y,13]);
                color("darkgray") translate([.675,-1,.1]) cube([13, 12, 8]);
                color("darkgray") translate([4.6755,-2,5.6]) cube([5, 12, 5]);
            }
            color("green") translate([1,-.1,8.6]) cube([3, 2, 2]);
            color("orange") translate([10.375,-.1,8.6]) cube([3, 2, 2]);
        }
    }
}
