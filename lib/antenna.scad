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
 
// antenna class
module antenna(type, loc_x, loc_y, loc_z, side, rotation, pcbsize_z, enablemask, mask) {
        
    // type led surface mount
    if(type == "ipex" && enablemask == false) {
    
        place(loc_x, loc_y, loc_z, 2.5, 2.75, rotation, side, pcbsize_z)
        union() {
            color("white") cube([2.5,2.75,.35]);
            difference() {
                color("silver") translate([2.5/2, 2.75/2, .45]) cylinder(d=2, h=.8);
                color("silver") translate([2.5/2, 2.75/2, .6]) cylinder(d=1.8, h=1);
            }
            color("gold") translate([2.5/2, 2.75/2, .6]) cylinder(d=.5, h=.6);
        }
    }  
}
