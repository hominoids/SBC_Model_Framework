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

/* shape module */
module shape(type,size_x,size_y,size_z,data_1,data_2,data_3,data_4) {

    if(type == "rectangle") {
        cube([size_x,size_y,size_z]);
    }
    if(type == "round") {
            cylinder(d=size_x, h=size_z);
    }    
    if(type == "polygon") {
            linear_extrude(height = size_z) polygon(data_3);
    }    
    if(type == "dxf") {
            linear_extrude(height = size_z) import(file = data_3, scale=data_4); 
    }
}
