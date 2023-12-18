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

    DESCRIPTION: creates smd components
           TODO: add other styles
           
          USAGE: smd(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])
                     type = "led"
                     size[0] = size_x
                     size[1] = size_y
                     size[2] = size_z
                     data[0] = body color

*/

// smd class
module smd(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {
    
    size_x = size[0];
    size_y = size[1];
    size_z = size[2];
    bcolor = data[0];
    cmask = mask[0];
    len = mask[1];
    back = mask[2];
    mstyle = mask[3];
    adj = .01;
    
    // type led surface mount
    if(type=="led" && enablemask == false) {
    
        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
        union() {
            color(bcolor) cube([size_x, size_y, size_z]);
            if(size_x >= size_y) {
                color("silver") translate([-adj,-adj,0]) cube([size_x/6,size_y+(2*adj),size_z+adj]);
                color("silver") translate([size_x-(size_x/6)+adj,-adj,0]) cube([size_x/6,size_y+(2*adj),size_z+adj]);
            }
            else {
                color("silver") translate([-adj,-adj,0]) cube([size_x+(2*adj),(size_y/6),size_z+adj]);
                color("silver") translate([-adj,size_y-(size_y/6)+adj,0]) cube([size_x+(2*adj),size_y/6,size_z+adj]);
            }
        }
    }
}
