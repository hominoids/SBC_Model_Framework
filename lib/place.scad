/*
    This file is part of SBC Model Framework https://github.com/hominoids/SBC_Model_Framework
    Copyright 2019,2020,2021,2022,2023,2024 Edward A. Kisiel hominoid@cablemi.com

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>
    Code released under GPLv3: http://www.gnu.org/licenses/gpl.html


    DESCRIPTION: places components on top or bottom and rotates in position
           TODO:

          USAGE: place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)

                       loc_x = x location placement
                       loc_y = y location placement
                       loc_z = z location placement
                      size_x = object x dimension
                      size_y = object y dimension
                    rotation = object z-axis rotation
                        side = "top", "bottom"
                   pcbsize_z = pcb thickness

*/

module place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z) {

    if (side == "top") {
       if ((rotation >= 0 && rotation < 90) || (rotation < -270 && rotation > -360))
           translate([loc_x, loc_y, pcbsize_z+loc_z]) rotate([0, 0, -rotation]) children();

       if ((rotation >= 90 && rotation < 180) || (rotation < -180 && rotation >= -270))
           translate([loc_x, loc_y+size_x, pcbsize_z+loc_z]) rotate([0, 0, -rotation]) children();

       if ((rotation >= 180 && rotation < 270) || (rotation < -90 && rotation >= -180))
           translate([loc_x+size_x, loc_y+size_y, pcbsize_z+loc_z]) rotate([0, 0, -rotation]) children(0);

       if ((rotation >= 270 && rotation < 360) || (rotation < 0 && rotation >= -90))
           translate([loc_x+size_y, loc_y, pcbsize_z+loc_z]) rotate([0, 0, -rotation]) children();
   }
   if (side == "bottom") {
       if ((rotation >= 0 && rotation < 90) || (rotation < -270 && rotation > -360))
           translate([loc_x+size_x, loc_y, -loc_z]) rotate([0, 180, rotation]) children();

       if ((rotation >= 90 && rotation < 180) || (rotation < -180 && rotation >= -270))
           translate([loc_x+size_y, loc_y+size_x, -loc_z]) rotate([0, 180, rotation]) children();

       if ((rotation >= 180 && rotation < 270) || (rotation < -90 && rotation >= -180))
           translate([loc_x, loc_y+size_y, -loc_z]) rotate([0, 180, rotation]) children();

       if ((rotation >= 270 && rotation < 360) || (rotation < 0 && rotation >= -90))
           translate([loc_x, loc_y, -loc_z]) rotate([0, 180, rotation]) children();
   }
   children([1:1:$children-1]);
}
