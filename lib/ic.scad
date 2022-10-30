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
 
// ic class
module ic(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask) {
    // ic 2.8mm x 2.8mm
    if (type=="ic_2.8x2.8") {
        size_x = 2.8;
        size_y = 2.8;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 3mm x 3mm
    if (type=="ic_3x3") {
        size_x = 3;
        size_y = 3;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 3.7mm x 3.7mm
    if (type=="ic_3.7x3.7") {
        size_x = 3.7;
        size_y = 3.7;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 4mm x 4mm
    if (type=="ic_4x4") {
        size_x = 4;
        size_y = 4;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 4.3mm x 5.1mm
    if (type=="ic_4.3x5.1") {
        size_x = 4.3;
        size_y = 5.1;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 4.5mm x 4.5mm
    if (type=="ic_4.5x4.5") {
        size_x = 4.5;
        size_y = 4.5;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 4.7mm x 4.7mm
    if (type=="ic_4.7x4.7") {
        size_x = 4.7;
        size_y = 4.7;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 5mm x 5mm
    if (type=="ic_5x5") {
        size_x = 5;
        size_y = 5;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 5.4mm x 5.3mm
    if (type=="ic_5.4x5.3") {
        size_x = 5.4;
        size_y = 5.3;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 5.5mm x 5.5mm
    if (type=="ic_5.5x5.5") {
        size_x = 5.5;
        size_y = 5.5;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 5.75mm x 5.75mm
    if (type=="ic_5.75x5.75") {
        size_x = 5.75;
        size_y = 5.75;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x, size_y, .7]);
    }
    // ic 6mm x 6mm
    if (type=="ic_6x6") {
        size_x = 6;
        size_y = 6;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 6.4mm x 6.4mm
    if (type=="ic_6.4x6.4") {
        size_x = 6.4;
        size_y = 6.4;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 6.7mm x 8.4mm
    if (type=="ic_6.7x8.4") {
        size_x = 6.7;
        size_y = 8.4;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 6.75mm x 6.75mm
    if (type=="ic_6.75x6.75") {
        size_x = 6.75;
        size_y = 6.75;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 7mm x 7mm
    if (type=="ic_7x7") {
        size_x = 7;
        size_y = 7;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }
    // ic 8mm x 8mm
    if (type=="ic_8x8") {
        size_x = 8;
        size_y = 8;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 9mm x 9mm
    if (type=="ic_9x9") {
        size_x = 9;
        size_y = 9;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 10mm x 13mm
    if (type=="ic_10x13") {
        size_x = 10;
        size_y = 13;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 11mm x 8mm
    if (type=="ic_11x8") {
        size_x = 11;
        size_y = 8;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 11mm x 13mm
    if (type=="ic_11x13") {
        size_x = 11;
        size_y = 13;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 11.5mm x 11.5mm
    if (type=="ic_11.5x11.5") {
        size_x = 11.5;
        size_y = 11.5;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 11.7mm x 16mm
    if (type=="ic_11.7x15") {
        size_x = 11.7;
        size_y = 15;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 12mm x 12mm
    if (type=="ic_12x12") {
        size_x = 12;
        size_y = 12;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 12.5mm x 12.5mm
    if (type=="ic_12.5x12.5") {
        size_x = 12.5;
        size_y = 12.5;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 13mm x 8mm
    if (type=="ic_13x8") {
        size_x = 13;
        size_y = 8;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 13mm x 7.5mm
    if (type=="ic_13x7.5") {
        size_x = 13;
        size_y = 7.5;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 13mm x 9mm
    if (type=="ic_13x9") {
        size_x = 13;
        size_y = 9;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 13mm x 11.5mm
    if (type=="ic_13x11.5") {
        size_x = 13;
        size_y = 11.5;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 15mm x 7mm
    if (type=="ic_15x7") {
        size_x = 15;
        size_y = 7;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 15mm x 13mm
    if (type=="ic_15x13") {
        size_x = 15;
        size_y = 13;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 15mm x 15mm
    if (type=="ic_15x15") {
        size_x = 15;
        size_y = 15;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
    // ic 16mm x 10mm
    if (type=="ic_16x10") {
        size_x = 16;
        size_y = 10;        
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        color("dimgray") translate([0,0,0]) cube([size_x,size_y,.8]);
    }    
}
