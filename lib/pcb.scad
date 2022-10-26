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

    // pcb board
    module pcb(size, radius) {
        x = size[0];
        y = size[1];
        z = size[2];   
        linear_extrude(height=z)
        hull() {
            translate([0+radius ,0+radius, 0]) circle(r=radius);
            translate([0+radius, y-radius, 0]) circle(r=radius);
            translate([x-radius, y-radius, 0]) circle(r=radius);
            translate([x-radius, 0+radius, 0]) circle(r=radius);
        }  
    }

