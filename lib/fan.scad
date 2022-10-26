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
 
// fan connector class
module fan(x,y,rotation,side,type,pcbsize_z) {
    
    // micro connector type
    if(type=="fan_micro") {
        size_x = 7.5;
        size_y = 3.75;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
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
    
    // pmw-standard connector type
    if(type=="encl_pmw") {
        size_x = 11.6;
        size_y = 4.3;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {  
            difference () {
                color("white") translate([0,0,0]) cube([size_x,size_y,7]);
                color("darkgray") translate([.5,.5,1]) cube([10.5,3,8]);
                //color("white") translate([-.5,.75,-.5]) cube([1,2.5,6]);
                //color("white") translate([11,.75,-.5]) cube([1,2.5,6]);
                color("darkgray") translate([2.25,-.5,1]) cube([7.5,2,8]);
            }
            for (i=[2:2.54:11.7]) {
                color("silver") translate ([i,2.54,2]) cylinder(d=.67,h=5, $fn=30);
            }
        }
    }
    
    // pmw-standard connector type horizontal and 45 degrees
    if(type=="encl_pmw_h") {
        size_x = 11.6;
        size_y = 4.3;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        translate([11.6,0,5]) rotate([-90,0,-45])
        union() {  
            difference () {
                color("white") translate([0,0,0]) cube([size_x,size_y,4]);
                color("darkgray") translate([.5,.5,1]) cube([10.5,3,8]);
                //color("white") translate([-.5,.75,-.5]) cube([1,2.5,6]);
                //color("white") translate([11,.75,-.5]) cube([1,2.5,6]);
                color("darkgray") translate([2.25,-.5,1]) cube([7.5,2,8]);
            }
            for (i=[2:2.54:11.7]) {
                color("silver") translate ([i,2.54,2]) cylinder(d=.67,h=2, $fn=30);
            }
        }
    }
}
