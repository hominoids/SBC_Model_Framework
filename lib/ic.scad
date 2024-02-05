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


     CLASS NAME: ic
    DESCRIPTION: creates intergrated circuits
           TODO: 

          USAGE: ic(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])

                    type = "generic"
                   loc_x = x location placement
                   loc_y = y location placement
                   loc_z = z location placement
                    side = "top", "bottom"
              rotation[] = object rotation
                 size[0] = size_x
                 size[1] = size_y
                 size[2] = size_z
                 data[0] = icolor
               pcbsize_z = pcb thickness
              enablemask = true produces mask, false produces model
                 mask[0] = true, false
                 mask[1] = length
                 mask[2] = set back
                 mask[3] = mstyle "default"

*/

// ic class
module ic(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    size_x = size[0];
    size_y = size[1];
    size_z = size[2];
    icolor = data[0];

    // generic ic
    if (type == "generic" && enablemask == false) {

        place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            color(icolor) cube([size_x, size_y, size_z]);
    }
}
