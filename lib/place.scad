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

module place(x,y,size_x,size_y,rotation,side,type,pcbsize_z) {

    if (side == "top") {
       if ((rotation >= 0 && rotation < 90) || (rotation < -270 && rotation > -360))
           translate([x,y,pcbsize_z]) rotate([0,0,-rotation]) children();

       if ((rotation >= 90 && rotation < 180) || (rotation < -180 && rotation >= -270))
           translate([x,y+size_x,pcbsize_z]) rotate([0,0,-rotation]) children();
       
       if ((rotation >= 180 && rotation < 270) || (rotation < -90 && rotation >= -180))
           translate([x+size_x,y+size_y,pcbsize_z]) rotate([0,0,-rotation]) children(0);
       
       if ((rotation >= 270 && rotation < 360) || (rotation < 0 && rotation >= -90))
           translate([x+size_y,y,pcbsize_z]) rotate([0,0,-rotation]) children();
   }   
   if (side == "bottom") {
       if ((rotation >= 0 && rotation < 90) || (rotation < -270 && rotation > -360))
           translate([x+size_x,y,0]) rotate([0,180,rotation]) children();
       
       if ((rotation >= 90 && rotation < 180) || (rotation < -180 && rotation >= -270))
           translate([x+size_y,y+size_x,0]) rotate([0,180,rotation]) children();
           
       if ((rotation >= 180 && rotation < 270) || (rotation < -90 && rotation >= -180))
           translate([x,y+size_y,0]) rotate([0,180,rotation]) children();
       
       if ((rotation >= 270 && rotation < 360) || (rotation < 0 && rotation >= -90))
           translate([x,y,0]) rotate([0,180,rotation]) children();
   }    
   children([1:1:$children-1]);
}
