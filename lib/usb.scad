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
 
// usb 2.0 port class
module usb2(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {
    
    len = mask[1];
    back = mask[2];
    mstyle = mask[3];
    
    // usb2 micro otg
    if(type == "micro") {
        
        size_x = 7.5;
        size_y = 4.5;
        dia =3.75;
        wide = 8.5;
        
        if(enablemask == true && mstyle == "default") {
            // micro usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.75, loc_y+back, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z) 
                    rotate([90,0,0]) slot(dia,wide,len);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x+back, loc_y+.75, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z) 
                    rotate([90,0,0]) slot(dia,wide,len);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+.75, loc_y-back, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z) 
                    rotate([90,0,0]) slot(dia,wide,len);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-back, loc_y-.75, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z) 
                    rotate([90,0,0]) slot(dia,wide,len);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+.75, loc_y+back, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z) 
                    rotate([90,0,0]) slot(dia,wide,len);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back, loc_y+.75, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z) 
                    rotate([90,0,0]) slot(dia,wide,len);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.75, loc_y-back, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z) 
                    rotate([90,0,0]) slot(dia,wide,len);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x+back, loc_y-.75, loc_z+dia/2, size_x, size_y, rotation, side, pcbsize_z) 
                    rotate([90,0,0]) slot(dia,wide,len);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)        
                union() {    
                    difference () {
                        color("silver") translate([0,0,0]) cube([size_x, size_y, 3]);
                        color("dimgray") translate([.25,-.1,.5]) cube([7, 3.5, 2.25]);
                        color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                            cylinder(d=2.5, h=6.5,$fn=30);
                        color("silver") translate([7.375,-.1,0]) rotate ([-90,0,0]) 
                            cylinder(d=2.5, h=6.5,$fn=30);

                    }
                    difference() {
                        union() {
                            color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                            cylinder(d=2.5, h=4.5,$fn=30);
                            color("silver") translate([7.375,-.1,0]) rotate ([-90,0,0]) 
                            cylinder(d=2.5, h=4.5,$fn=30);
                        }               
                        color("silver") translate([.125,-.2,0]) rotate ([-90,0,0]) 
                            cylinder(d=1.5, h=6.5,$fn=30);
                        color("silver") translate([7.375,-.2,0]) rotate ([-90,0,0]) 
                            cylinder(d=1.5, h=6.5,$fn=30);
                        
                        color("silver") translate([-3,-1,-3]) cube([3,6.5,7.5]);
                        color("silver") translate([7.5,-1,-3]) cube([3,6.5,7.5]);
                        color("silver") translate([0,-1,-3]) cube([9,6.5,3]);
                        color("silver") translate([-1,-1,-3]) cube([9,6.5,3]);
                        }
                    color("black") translate([1.5,.5,1.25]) cube([4,3.5,1]);
                }
            }
    }
    
    if(type == "single_horizontal_a") {
        
        size_x = 14;
        size_y = size[1];
        size_xm = 16;
        size_zm = 7.75;
        
        if(enablemask == true && mstyle == "default") {
            // single horizontal usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.5, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-len+back, loc_y+.5, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+.5, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.5, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+.5, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y+.5, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.5, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-len+back, loc_y-.5, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
        }
        if(enablemask == true && mstyle == "m1s") {
            // single horizontal usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.75, loc_y-len+back, loc_z+1, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {    
                    difference () {
                        color("silver") cube([size_x, size_y, 7]);
                        color("dimgray") translate([.5,-.1, 1]) cube([size_x-1, size_y-.5, 5.5]);
                    }
                    color("white") translate([2, 1, 4]) cube([10, size_y-1.5, 1.5]);
                    color("silver") translate([-.65, 0, 1]) cube([.65, .5, 5]);    
                    color("silver") translate([13.99, 0, 1]) cube([.65, .5, 5]);
                    color("silver") translate([1, 0, 6.99]) cube([11.5, .5, .65]);            
                    for(i=[0:2:6]){ 
                        color("#fee5a6") translate([4+i, 1.5, 4.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                    }
                } 
        }
    }

    // usb2 single vertical socket
    if(type == "single_vertical_a") {
        
        size_x = 5.75;
        size_y = size[1];
        size_xm = 7.5;
        size_zm = 14;
        
        if(enablemask == true && mstyle == "default") {
            // single horizontal usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.85, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-len+back, loc_y+.8, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+.85, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-1, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+.85, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y+.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.85, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-len+back, loc_y-1, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {   
                // usb 2.0 port
                difference () {
                    color("silver") cube([size_x, size_y, 14]);
                    color("dimgray") translate([.5, -1, .75]) cube([4.75, size[1]-2, 13]);
                }
                color("silver") translate([-.65, 0, 1]) cube([.65, .5, 12]);    
                color("silver") translate([size_x, 0, 1]) cube([.65, .5, 12]);
                color("silver") translate([1, 0, 14]) cube([3.8, .5, .65]);            
                color("white") translate([1, 0, 1.5]) cube([2, size[1]-.5, 11]);
                for(i=[0:2:6]){ 
                    color("#fee5a6") translate([2.75, .5, 4.4+i]) rotate([-90,0,0]) cube([.5, .64, 10]);
                }
            }
        }
    }
    
    // usb2 double stacked sockets
    if(type == "double_stacked_a") {
        
        size_x = 13.25;
        size_y = 17.5;
        size_xm = 14.75;
        size_zm = 16.25;
        
        if(enablemask == true && mstyle == "default") {
            // single horizontal usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.75, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-len+back, loc_y+.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+.75, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+.75, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y+.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.75, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-len+back, loc_y-.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {    
                difference () {
                    color("silver") cube([size_x, size_y, 15.5]);
                    color("dimgray") translate([1, -.1, 1]) cube([11.25, 15.5, 13.5]);
                }
                color("silver") translate([0, 0, 6.75]) cube([size_x, size_y, 2]);
                color("white") translate([1.5, 1, 12]) cube([10, 12.5, 1.5]);
                color("white") translate([1.5 ,1, 4]) cube([10, 12.5, 1.5]);
                color("silver") translate([-.65, 0, 1]) cube([.65, .5, 5]);    
                color("silver") translate([size_x, 0, 1]) cube([.65, .5, 5]);
                color("silver") translate([-.65, 0, 9]) cube([.65, .5, 5]);    
                color("silver") translate([size_x, 0, 9]) cube([.65, .5, 5]);
                color("silver") translate([1, 0, 15.5]) cube([11.5, .5, .65]);            
                for(i=[0:2:6]){ 
                    color("#fee5a6") translate([3.25+i, 1.5, 4.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                    color("#fee5a6") translate([3.25+i, 1.5, 12.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                }
            }
        }
    }
    
    // uart micro connector type
    if(type == "uart_micro" && enablemask == false) {
        
        size_x = 12.5;
        size_y = 5;
        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            difference() {
                union() {
                
                    difference () {
                        color("white") translate([0,0,0]) cube([size_x,size_y,6]);
                        color("darkgray") translate([.5,.5,2]) cube([11.5,4,6]);
                    }
                    color("white") translate([12,3.75,.5]) rotate([0,0,45]) cube([1,2,5.5]);
                    color("white") translate([-0.2,4,.5]) rotate([0,0,-45]) cube([1,2,5.5]);
                }
                color("white") translate([12.5,0,-.5]) cube([2,6,7]);
                color("white") translate([-1,0,-.5]) cube([1,6,7]);
                color("white") translate([-1,5,-.5]) cube([14,2,7]);
                color("white") translate([-0.7,4.5,-.1]) rotate([0,0,-45]) cube([1,2,7]);
                color("darkgray") translate([-1,1.5,2]) cube([14,1,7]);
            }
            for (i=[2.5:2.5:10]) {
                color("silver") translate ([i,3,.5]) cube([.6,.6,5]);
            }
        }
    }
    
    // uart micro connector type    
    if(type=="uart_micro_h" && enablemask == false) {
    size_x = 12.5;
    size_y = 5;        
    place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        rotate([90,0,0]) union() {
            difference() {
                union() {
                
                    difference () {
                        color("white") translate([0,0,0]) cube([size_x,size_y,6]);
                        color("darkgray") translate([.5,.5,2]) cube([11.5,4,6]);
                    }
                    color("white") translate([12,3.75,.5]) rotate([0,0,45]) cube([1,2,5.5]);
                    color("white") translate([-0.2,4,.5]) rotate([0,0,-45]) cube([1,2,5.5]);
                }
                color("white") translate([12.5,0,-.5]) cube([2,6,7]);
                color("white") translate([-1,0,-.5]) cube([1,6,7]);
                color("white") translate([-1,5,-.5]) cube([14,2,7]);
                color("white") translate([-0.7,4.5,-.1]) rotate([0,0,-45]) cube([1,2,7]);
                color("darkgray") translate([-1,1.5,2]) cube([14,1,7]);
            }
            for (i=[2.5:2.5:10]) {
                color("silver") translate ([i,3,.5]) cube([.6,.6,5]);
            }
        }
    }
      
}

// usb 3.0 port class
module usb3(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {
    
    len = mask[1];
    back = mask[2];
    mstyle = mask[3];
    
    // usb3 single horizontal type
    if(type == "single_horizontal_a") {
        
        size_x = 14;
        size_y = 14;
        size_xm = 16;
        size_zm = 7.75;
        
        if(enablemask == true && mstyle == "default") {
            // single horizontal usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.5, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-len+back, loc_y+.5, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+.5, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.5, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+.5, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y+.5, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.5, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-len+back, loc_y-.5, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
        }
        if(enablemask == true && mstyle == "m1s") {
            // single horizontal usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.5, loc_y-len+back, loc_z+.25, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm+1]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {    
                    difference () {
                        color("silver") translate([0, 0, 0]) cube([size_x, size_y, 7]);
                        color("dimgray") translate([.5,-.1, 1]) cube([size_x-1, size_y-.5, 5.5]);
                    }
                    color("royalblue") translate([2, 1, 4]) cube([10, size[1]-1, 1.5]);
                    color("silver") translate([-.65, 0, 1]) cube([.65, .5, 5]);    
                    color("silver") translate([13.99, 0, 1]) cube([.65, .5, 5]);
                    color("silver") translate([1, 0, 6.99]) cube([11.5, .5, .65]);            
                    for(i=[0:2:6]){ 
                        color("#fee5a6") translate([4+i, 1.5, 4.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                    }
                } 
        }
    }
    
    // usb3 single vertical socket
    if(type == "single_vertical_a") {
        
        size_x = 5.75;
        size_y = size[1];
        size_xm = 7.5;
        size_zm = 14;
        
        if(enablemask == true && mstyle == "default") {
            // single horizontal usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.85, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-len+back, loc_y+.8, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+.85, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-1, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+.85, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y+.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.85, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-len+back, loc_y-1, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {   
                // usb 3.0 port
                difference () {
                    color("silver") cube([size_x, size_y, 14]);
                    color("dimgray") translate([.5, -1, .75]) cube([4.75, size[1]-2, 13]);
                }
                color("silver") translate([-.65, 0, 1]) cube([.65, .5, 12]);    
                color("silver") translate([size_x, 0, 1]) cube([.65, .5, 12]);
                color("silver") translate([1, 0, 14]) cube([3.8, .5, .65]);            
                color("royalblue") translate([1, 0, 1.5]) cube([2, size[1]-.5, 11]);
                for(i=[0:2:6]){ 
                    color("#fee5a6") translate([2.75, .5, 4.4+i]) rotate([-90,0,0]) cube([.5, .64, 10]);
                }
            }
        }
    }
    
    // usb3 double stacked type
    if(type == "double_stacked_a") {
        
        size_x = 13.25;
        size_y = 17.5;
        size_xm = 14.75;
        size_zm = 16.25;
        
        if(enablemask == true && mstyle == "default") {
            // single horizontal usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.75, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-len+back, loc_y+.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+.75, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+.75, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y+.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.75, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-len+back, loc_y-.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                union() {    
                    difference () {
                        color("silver") cube([size_x, size_y, 15.5]);
                        color("dimgray") translate([1, -.1, 1]) cube([11.25, 15.5, 13.5]);
                    }
                    color("silver") translate([0, 0, 6.75]) cube([size_x, size_y, 2]);
                    color("royalblue") translate([1.5, 1, 12]) cube([10, 12.5, 1.5]);
                    color("royalblue") translate([1.5 ,1, 4]) cube([10, 12.5, 1.5]);
                    color("silver") translate([-.65, 0, 1]) cube([.65, .5, 5]);    
                    color("silver") translate([size_x, 0, 1]) cube([.65, .5, 5]);
                    color("silver") translate([-.65, 0, 9]) cube([.65, .5, 5]);    
                    color("silver") translate([size_x, 0, 9]) cube([.65, .5, 5]);
                    color("silver") translate([1, 0, 15.5]) cube([11.5, .5, .65]);            
                    for(i=[0:2:6]){ 
                        color("#fee5a6") translate([3.25+i, 1.5, 4.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                        color("#fee5a6") translate([3.25+i, 1.5, 12.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                    }
                }
        }
    }
    
    // usb3 and usbc double stacked type
    if(type == "double_stacked_usb3-usbc") {
        
        $fn = 90;
        size_x = 13.25;
        size_y = 17.5;                
        size_xm = 14.75;
        size_zm = 16.25;
        
        if(enablemask == true && mstyle == "default") {
            // single horizontal usb opening
            if(side == "top" && rotation == 0) {
                place(loc_x-.75, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 90) {
                place(loc_x-len+back, loc_y+.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x+.75, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x+size_y-back, loc_y-.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 0) {
                place(loc_x+.75, loc_y-len+back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x+size_y-back, loc_y+.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.75, loc_y+size_y-back, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
            if(side == "bottom" && rotation == 270) {
                place(loc_x-len+back, loc_y-.75, loc_z, size_x, len, rotation, side, pcbsize_z)
                    cube([size_xm, len, size_zm]);
            }
        }
        if(enablemask == false) {
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
                for(i=[0:2:6]){ 
                    color("#fee5a6") translate([3.25+i, 1.5, 12.4]) rotate([-90,0,0]) cube([.64, .5, 10]);
                }
            }
        }
    } 
}

// usbc port class
module usbc(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {
    
    len = mask[1];
    back = mask[2];
    mstyle = mask[3];
    $fn=90;
    adjust = .01;
    
    // usbc horizontal type
    if(type == "single_horizontal") {
        
        size_x = 9;
        size_xm = 9.75;
        size_y = 7;
        dia = 3.5;
        diam = 4.5;

        if(enablemask == true && mstyle == "default") {
            // single horizontal usbc opening
            if(rotation == 0) {       
                place(loc_x, loc_y+back, loc_z-.125+diam/2, size_x, len, rotation, side, pcbsize_z)
                    rotate([90 ,0, 0]) slot(diam, size_xm, len);
            }
            if((side == "top" && rotation == 90) || (side == "bottom" && rotation == 270)) {
                place(loc_x+back, loc_y, loc_z-.125+diam/2, size_x, len, rotation, side, pcbsize_z)
                    rotate([90 ,0, 0]) slot(diam, size_xm, len);
            }
            if(rotation == 180) {
                place(loc_x, loc_y-1-back, loc_z+diam/2, size_x, len, rotation, side, pcbsize_z)
                    rotate([90 ,0, 0]) slot(diam, size_xm, len);
            }
            if((side == "top" && rotation == 270) || (side == "bottom" && rotation == 90)) {
                place(loc_x-1-back, loc_y, loc_z+diam/2, size_x, len, rotation, side, pcbsize_z)
                    rotate([90 ,0, 0]) slot(diam, size_xm, len);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                rotate([90, 0, 0])  translate([dia/2, dia/2, -size_y]) union() {    
                    difference () {
                        color("silver")
                        hull() {
                            translate([0,0,0]) cylinder(d=dia,h=size_y);
                            translate([size_x-dia,0,0]) cylinder(d=dia,h=size_y);        
                            }
                        color("silver") translate([0,0,1])
                        hull() {
                            translate([0,0,0]) cylinder(d=3,h=size_y+.2);
                            translate([size_x-dia,0,0]) cylinder(d=3,h=size_y+.2);        
                            }
                    }
                    color("black") translate([0,-1.2/2,.1]) cube([5.5,1.2,6]);
                }
        }
    }

    // usbc vertical type
    if(type == "single_vertical") {
        
        size_x = 9;
        size_y = 7;
        size_xm = 9.5;
        size_ym = 7;
        dia = 3.5;
        diam = 3.75;
        height = .5;
        
        if(enablemask == true && mstyle == "default") {
            // single vertical usbc opening
            if(side == "top" && rotation == 0) {       
                place(loc_x-.125+diam/2, loc_y+back, loc_z+size_xm+height, size_xm, len, rotation, side, pcbsize_z)
                    rotate([90 ,90, 0]) slot(diam, size_xm, len);
            }
            if((rotation == 90 && side == "top") || (rotation == 270 && side == "bottom")) {
                place(loc_x+back, loc_y+.125-diam/2, loc_z+size_xm+height, size_xm, len, rotation, side, pcbsize_z)
                    rotate([90 ,90, 0]) slot(diam, size_xm, len);
            }
            if(side == "top" && rotation == 180) {
                place(loc_x-.75, loc_y-2-back, loc_z+size_xm+height, len, size_xm, rotation, side, pcbsize_z)
                    rotate([90 ,90, 0]) slot(diam, size_xm, len);
            }
            if(side == "top" && rotation == 270) {
                place(loc_x-2-back, loc_y-.125+diam/2, loc_z+size_xm+height, len, size_xm, rotation, side, pcbsize_z)
                    rotate([90 ,90, 0]) slot(diam, size_xm, len);
            }
            if(side == "bottom" && rotation == 0) {       
                place(loc_x+.125-diam/2, loc_y+back, loc_z+size_xm+height, size_xm, len, rotation, side, pcbsize_z)
                    rotate([90 ,90, 0]) slot(diam, size_xm, len);
            }
            if(side == "bottom" && rotation == 90) {
                place(loc_x-back, loc_y+.125-diam/2, loc_z+size_xm+height, size_xm, size_y, rotation, side, pcbsize_z)
                    rotate([90 ,90, 0]) slot(diam, size_xm, len);
            }
            if(side == "bottom" && rotation == 180) {
                place(loc_x-.125+diam/2, loc_y-2-back, loc_z+size_xm+height, len, size_xm, rotation, side, pcbsize_z)
                    rotate([90 ,90, 0]) slot(diam, size_xm, len);
            }
        }
        if(enablemask == false) {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
                rotate([90 ,90 ,0])  translate([-size_y-.25-height, dia/2, -size_y])
                union() {    
                    difference () {
                        color("silver")
                        hull() {
                            translate([0,0,0]) cylinder(d=dia,h=size_y);
                            translate([size_x-dia, 0, 0]) cylinder(d=dia, h=size_y);        
                            }
                        color("silver") translate([0 ,0, 1])
                        hull() {
                            cylinder(d=3, h=size_y+.2);
                            translate([size_x-dia, 0, 0]) cylinder(d=3, h=size_y+.2);        
                            }
                    }
                    color("black") translate([0, -1.2/2, 1]) cube([5.5, 1.2, 6]);
                }
        }
    }
}
