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
module usb2(x,y,rotation,side,type,pcbsize_z) {
    // usb2 single vertical socket
    if(type=="single_vertical_a") {
        size_x = 5.70;
        size_y = 19.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {   
            // usb 2.0 port
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 14]);
                color("dimgray") translate([.5,-1,.75]) cube([4.75, 12.5, 13]);
            }
            color("silver") translate([-.65,0,1]) cube([.65,.5,12]);    
            color("silver") translate([5.7,0,1]) cube([.65,.5,12]);
            color("silver") translate([1,0,14]) cube([3.8,.5,.65]);            
            color("white") translate([1,0,1.5]) cube([2, 17.5, 11]);
        }
    }
    // usb2 double stacked sockets
    if(type=="double_stacked_a") {
        size_x = 13.25;
        size_y = 17.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 15.5]);
                color("dimgray") translate([1,-.1,1]) cube([11.25, 15.5, 13.5]);
            }
            color("silver") translate([0,0,6.75]) cube([13.25, 17.5, 2]);
            color("white") translate([1.5,1,12]) cube([10, 12.5, 1.5]);
            color("white") translate([1.5,1,4]) cube([10, 12.5, 1.5]);
            color("silver") translate([-.65,0,1]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,1]) cube([.65,.5,5]);
            color("silver") translate([-.65,0,9]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,9]) cube([.65,.5,5]);
            color("silver") translate([1,0,15.5]) cube([11.5,.5,.65]);            

        }
    }
    // usb2 micro otg
    if(type=="micro") {
        size_x = 7;
        size_y = 4.5;
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)        
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 3.5]);
                color("dimgray") translate([.5,-.1,.5]) cube([6, 3.5, 2.5]);
                color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=6.5,$fn=30);
                color("silver") translate([7,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=6.5,$fn=30);

            }
            difference() {
                union() {
                    color("silver") translate([0,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=4.5,$fn=30);
                    color("silver") translate([7,-.1,0]) rotate ([-90,0,0]) 
                    cylinder(d=2.5, h=4.5,$fn=30);
                }               
                color("silver") translate([0,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=1.25, h=6.5,$fn=30);
                color("silver") translate([7,-.2,0]) rotate ([-90,0,0]) 
                    cylinder(d=1.25, h=6.5,$fn=30);
                
                color("silver") translate([-3,-1,-3]) cube([3,6.5,7.5]);
                color("silver") translate([7,-1,-3]) cube([3,6.5,7.5]);
                color("silver") translate([0,-1,-3]) cube([9,6.5,3]);
                color("silver") translate([-1,-1,-3]) cube([9,6.5,3]);
                }
            color("black") translate([1.5,.5,1.25]) cube([4,3.5,1]);
        }
    }
    if(type=="single_horizontal_a") {
        size_x = 14;
        size_y = 14;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 7]);
                color("dimgray") translate([.5,-.1,1]) cube([13, 13.5, 5.5]);
            }
            color("white") translate([2,1,4]) cube([10, 12.5, 1.5]);
            color("silver") translate([-.65,0,1]) cube([.65,.5,5]);    
            color("silver") translate([13.99,0,1]) cube([.65,.5,5]);
            color("silver") translate([1,0,6.99]) cube([11.5,.5,.65]);            
        }
    }
}

// usb 3.0 port class
module usb3(x,y,rotation,side,type,pcbsize_z) {
    // usb3 double stacked type
    if(type=="double_stacked_a") {
        size_x = 13.25;
        size_y = 17.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 15.5]);
                color("dimgray") translate([1,-.1,1]) cube([11.25, 15.5, 13.5]);
            }
            color("silver") translate([0,0,6.75]) cube([13.25, 17.5, 2]);
            color("royalblue") translate([1.5,1,12]) cube([10, 12.5, 1.5]);
            color("royalblue") translate([1.5,1,4]) cube([10, 12.5, 1.5]);
            color("silver") translate([-.65,0,1]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,1]) cube([.65,.5,5]);
            color("silver") translate([-.65,0,9]) cube([.65,.5,5]);    
            color("silver") translate([13.25,0,9]) cube([.65,.5,5]);
            color("silver") translate([1,0,15.5]) cube([11.5,.5,.65]);            

        }
    }
    // usb3 single horizontal type
    if(type=="single_horizontal_a") {
        size_x = 14;
        size_y = 14;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        union() {    
            difference () {
                color("silver") translate([0,0,0]) cube([size_x, size_y, 7]);
                color("dimgray") translate([.5,-.1,1]) cube([13, 13.5, 5.5]);
            }
            color("royalblue") translate([2,1,4]) cube([10, 12.5, 1.5]);
            color("silver") translate([-.65,0,1]) cube([.65,.5,5]);    
            color("silver") translate([13.99,0,1]) cube([.65,.5,5]);
            color("silver") translate([1,0,6.99]) cube([11.5,.5,.65]);            
        }
    }
}

// usbc port class
module usbc(x,y,rotation,side,type,pcbsize_z) {
    $fn=90;
    // usbc horizontal type
    if(type=="single_vertical") {
        size_x = 9;
        size_y = 7;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
         rotate([90,90,0])  translate([-7,3.5/2,-7]) union() {    
            difference () {
                color("silver") translate([0,0,0])
                hull() {
                    translate([0,0,0]) cylinder(d=3.5,h=size_y);
                    translate([size_x-3.5,0,0]) cylinder(d=3.5,h=size_y);        
                    }
                color("silver") translate([0,0,1])
                hull() {
                    translate([0,0,0]) cylinder(d=3,h=size_y+.2);
                    translate([size_x-3.5,0,0]) cylinder(d=3,h=size_y+.2);        
                    }
            }
            color("black") translate([0,-1.2/2,1]) cube([5.5,1.2,6]);
        }
    }
    if(type=="single_horizontal") {
        size_x = 9;
        size_y = 7;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
         rotate([90,0,0])  translate([3.5/2,3.5/2,-7]) union() {    
            difference () {
                color("silver")
                hull() {
                    translate([0,0,0]) cylinder(d=3.5,h=size_y);
                    translate([size_x-3.5,0,0]) cylinder(d=3.5,h=size_y);        
                    }
                color("silver") translate([0,0,1])
                hull() {
                    translate([0,0,0]) cylinder(d=3,h=size_y+.2);
                    translate([size_x-3.5,0,0]) cylinder(d=3,h=size_y+.2);        
                    }
            }
            color("black") translate([0,-1.2/2,.1]) cube([5.5,1.2,6]);
        }
    }
    
    // uart micro connector type
    if(type=="uart_micro") {
        size_x = 12.5;
        size_y = 5;        
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
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
}
