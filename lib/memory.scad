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
 
// memory class
module memory(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask) {
    
    cmask = mask[0];
    len = mask[1];
    back = mask[2];
    style = mask[3];
    
    // socketed emmc
    if(type == "emmc") {
    
        size_x = 13.5;
        size_y = 18.5;
        size_xm = 14.5;
        size_ym = 19.5;
        size_zm = len;
   
        if(enablemask == true && cmask == true && style == "default") {
            if(side == "top" && rotation == 0) {
                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
                    cube([size_xm, size_ym, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union (){
                    color("darkred") translate([0, 0, 1.1]) cube([size_x, size_y, .8]);
                    color("dimgray") translate([1, 2, 1.9]) cube([11.5, 13, .9]); 
                    difference() {
                        color("dimgray") translate([2, 13.5, 0]) cube([9.3, 3.4, 1.1]);
                        color("dimgray") translate([2.5, 14.5, -.1]) cube([8.3, .5, 1.1]);
                        color("dimgray") translate([2.5, 15.9, -.1]) cube([8.3, .5, 1.1]);
                        color("dimgray") translate([2.5, 14.5, -.1]) cube([.5, 1.8, 1.1]);
                        color("dimgray") translate([10.3, 14.5, -.1]) cube([.5, 1.8, 1.1]);
                    }
                }
        }
    }
 
    // emmc plug
    if(type == "emmc_plug") {
    
        size_x = 8.3;
        size_y = 2.16;
        size_xm = 14.5;
        size_ym = 19.5;
        size_zm = len;
   
        if(enablemask == true && cmask == true && style == "default") {
            if(side == "top" && rotation == 0) {
//                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
//                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "top" && rotation == 90) {
//                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
//                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "top" && rotation == 180) {
//                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
//                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "top" && rotation == 270) {
//                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
//                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
//                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
//                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
//                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
//                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
//                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
//                    cube([size_xm, size_ym, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
//                place(loc_x-.5, loc_y-.5, loc_z, size_xm, size_ym, rotation, side, pcbsize_z)
//                    cube([size_xm, size_ym, size_zm]);
            }
        }
        if(enablemask == false) {
           place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
               union (){
                    difference() {
                    color("black") cube([size_x, size_y, .82]);
                    color("black") translate([1, .25, .15]) cube([6.3, 1.65, 1]); 
                    color("black") translate([1, 0, .72]) cube([6.3, 2.5, 2]);                
                    }
                    for (i=[1.25:.4:7.2]) {
                        color("gold") translate ([i, -.05, 0]) cube([.16, .3, .82]);
                        color("gold") translate ([i, 1.9, 0]) cube([.16, .3, .82]);
                    }
                }
        }
    }
       
    // sodimm-5.2 socket
    if(type == "sodimm_5.2" && enablemask == false) {                
        size_x = 73;
        size_y = 6.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {  
            difference () {
                
                color("dimgray") translate([0,0,0]) cube([size_x,size_y,5.2]);
                color("dimgray") translate([2,-1,1.75]) cube([69,3,5]);
                color("dimgray") translate([3.5,-1,1.75]) cube([28.5,5.25,.92]);
                color("dimgray") translate([34.5,-1,1.75]) cube([35,5.25,.92]);
            }
            for (i=[2:.5:31]) {
                color("gold") translate ([i+.5,2,1.75]) cube([.25,2,.25]);
            }
            for (i=[34:.5:69]) {
                color("gold") translate ([i+.5,2,1.75]) cube([.25,2,.25]);
            }
        }
    }
        
    // sodimm-9.2 socket
    if(type == "sodimm_9.2" && enablemask == false) {        
        size_x = 73;
        size_y = 6.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {  
            difference () {
                
                color("dimgray") translate([0,0,0]) cube([size_x,size_y,9.2]);
                color("dimgray") translate([2,-1,5.7]) cube([69,3,5]);
                color("dimgray") translate([3.5,-1,5.7]) cube([28.5,5.25,.92]);
                color("dimgray") translate([34.5,-1,5.7]) cube([35,5.25,.92]);
            }
            for (i=[2:.5:31]) {
                color("gold") translate ([i+.5,2,5.7]) cube([.25,2,.25]);
            }
            for (i=[34:.5:69]) {
                color("gold") translate ([i+.5,2,5.7]) cube([.25,2,.25]);
            }
        }
    }   
}
