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

    DESCRIPTION: creates pin headers in any size or pitch.
           TODO: "box", "angled" headers 
                
          USAGE: header(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])
                        type = "open", "box"
                        size[0] = #row
                        size[1] = #columns
                        size[2] = pin height
                        data[0] = style ("straight", "angled")
                        data[1] = header color
                        data[2] = "male", "female"
                        data[3] = pitch
                        data[4] = pin color

*/

// header class
module header(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    row = size[0];
    column = size[1];
    height = size[2];
    style = data[0];
    hcolor = data[1];
    gender = data[2];
    pitch = data[3];
    pcolor = data[4];

    size_y = pitch == 2.54 && style == "smt" ? (2.5 * column) : (pitch * column);
    size_x = pitch == 2.54 && style == "smt" ? (2.5 * row) : (pitch * row);
    bheight = pitch == 2.54 ? 2.5 : 1;
    pheight = pitch == 2.54 ? 3.2 : 2;
    pinsize = pitch == 2.54 ? .64 : .3;
    theight = bheight + pheight + height;
    smtlead = [pinsize,.925,.32];
    
    adj = .01;
    $fn = 90;
    
    // thruhole headers
    if(type=="open" && style == "thruhole" && enablemask == false) {
       
        if(gender == "male") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)        
            union() {
                color(hcolor) cube([size_x, size_y, bheight]);
                for(c=[pitch/2:pitch:size_x]) {
                    for(r=[pitch/2:pitch:size_y]) {
                        color(pcolor) translate ([c-(pinsize/2),r-(pinsize/2),-pheight]) cube([pinsize,pinsize,theight+adj]);
                    } 
                }
            }
        }
        if(gender == "female") {
            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)        
            union() {
                difference() {
                    color(hcolor) cube([size_x, size_y, height]);
                    for(c=[pitch/2:pitch:size_x]) {
                        for(r=[pitch/2:pitch:size_y]) {
                            color("dimgray") translate ([c-(pinsize/2),r-(pinsize/2),height-5+adj]) cube([pinsize,pinsize,height-1]);
                            color(pcolor) translate ([c-(pinsize/2),r-(pinsize/2),-pheight]) cube([pinsize,pinsize,pheight+adj]);
                        }
                    }
                }
                for(c=[pitch/2:pitch:size_x]) {
                    for(r=[pitch/2:pitch:size_y]) {
                        color(pcolor) translate ([c-(pinsize/2),r-(pinsize/2),-pheight]) cube([pinsize,pinsize,pheight+adj]);
                    }
                }
            }
        }
    }
    // smt headers
    if(type=="open" && style == "smt" && enablemask == false) {
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)        
        union() {
            if(gender == "male") {
                union() {
                    color(hcolor) cube([size_x, size_y, bheight]);
                    for(c=[pitch/2:pitch:size_x]) {
                        for(r=[pitch/2:pitch:size_y]) {
                            color(pcolor) translate ([c-(pinsize/2),r-(pinsize/2),bheight-adj]) cube([pinsize,pinsize,height+adj]);
                        } 
                    }
                }
            }
            if(gender == "female") {
                union() {
                    difference() {
                        color(hcolor) cube([size_x, size_y, height]);
                        for(c=[pitch/2:pitch:size_x]) {
                            for(r=[pitch/2:pitch:size_y]) {
                                color("dimgray") translate ([c-(pinsize/2),r-(pinsize/2),adj]) cube([pinsize,pinsize,height]);
                            }
                        }
                    }
                }
            }
            if(size_x >= size_y) {
                for(r=[pitch/2:pitch:size_x]) {
                    for(c=[pitch/2:pitch:size_y]) {
                        color(pcolor) translate ([r-(pinsize/2),-smtlead[1],0]) cube(smtlead);
                        color(pcolor) translate ([r-(pinsize/2),size_y-adj,0]) cube(smtlead);
                    }
                }
            }
            else {
                for(r=[pitch/2:pitch:size_x]) {
                    for(c=[pitch/2:pitch:size_y]) {
                        color(pcolor) translate ([-smtlead[1]+adj,c-(pinsize/2),0]) cube([smtlead[1],smtlead[0],smtlead[2]]);
                        color(pcolor) translate ([size_x-adj,c-(pinsize/2),0]) cube([smtlead[1],smtlead[0],smtlead[2]]);
                    }
                }
            }                    
        }
    }
    
    // gpio 30 pin enclosed header
    if(type=="encl_header_30" && enablemask == false) {
        size_x = 37;
        size_y = 5.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
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
    if (type=="encl_header_12" && enablemask == false) {
        size_x = 19.5;
        size_y = 5.5;                
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {                
            difference () {
                color("black") translate([0,0,0]) cube([size_x,size_y,6.25]);
                color ("darkgray") translate ([.5,.5,.6]) cube([18.5,4.5,5.75]);
            }
            for (i=[4.5:2:16]) {
                color("#fee5a6") translate ([i,1.5,1]) cube([.5,.5,5]);
                color("#fee5a6") translate ([i,3.5,1]) cube([.5,.5,5]);
            }
        }
    }    
}
