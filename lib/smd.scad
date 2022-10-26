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

// smd class
module smd(x,y,rotation,side,type,pcbsize_z) {
    // type led surface mount
    if(type=="led_3x1.5") {
        size_x = 3;
        size_y = 1.5;                
        place(x,y,size_x,size_y,rotation,side,type,pcbsize_z)
        color("gold") translate([0,0,0]) cube([size_x,size_y,.5]);
    }
}
