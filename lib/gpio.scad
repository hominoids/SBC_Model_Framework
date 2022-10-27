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
 
// gpio class
module gpio(x,y,rotation,side,type,pcbsize_z) {
    
    // gpio 30 pin enclosed header
    if(type=="encl_header_30") {
        size_x = 37;
        size_y = 5.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            difference () {
                color("black") translate([0,0,0]) cube([size_x, size_y, 6.25]);
                color ("darkgray") translate ([.5,.5,.6]) cube([36, 4.5, 5.75]);
            }
            for (i=[4.5:2:34]) {
                color("silver") translate ([i,1.5,1]) cube([.5,.5,5]);
                color("silver") translate ([i,3.5,1]) cube([.5,.5,5]);
            }
        }
    }
    
    // gpio 12 enclosed header
    if (type=="encl_header_12") {
        size_x = 19.5;
        size_y = 5.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {                
            difference () {
                color("black") translate([0,0,0]) cube([size_x,size_y,6.25]);
                color ("darkgray") translate ([.5,.5,.6]) cube([18.5,4.5,5.75]);
            }
            for (i=[4.5:2:16]) {
                color("gold") translate ([i,1.5,1]) cube([.5,.5,5]);
                color("gold") translate ([i,3.5,1]) cube([.5,.5,5]);
            }
        }
    }
    
    // gpio 40 pin header
    if(type=="header_40") {
        size_x = 50;
        size_y = 5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:50]) {
                color("gold") translate ([i,.5,3]) cube([.64,.64,5]);
                color("gold") translate ([i,3.5,3]) cube([.64,.64,5]);
            }
        }
    }
    
    // gpio 20 pin header
    if(type=="header_20") {
        size_x = 25.52;
        size_y = 5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:25]) {
                color("gold") translate ([i,.5,3]) cube([.64,.64,5]);
                color("gold") translate ([i,3.5,3]) cube([.64,.64,5]);
            }
        }
    }
    
    // gpio 26 pin header
    if(type=="header_26") {
        size_x = 31.52;
        size_y = 5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {
            color("black") translate([0,0,0]) cube([size_x, size_y, 3]);
            for (i=[1:2.5:31]) {
                color("gold") translate ([i,.5,3]) cube([.64,.64,5]);
                color("gold") translate ([i,3.5,3]) cube([.64,.64,5]);
            }
        }
    }   
}