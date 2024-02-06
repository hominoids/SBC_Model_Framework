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


     CLASS NAME: b2b
    DESCRIPTION: creates b2b headers in size, pitch and stacking height.
           TODO: shielded 

          USAGE: b2b(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])
                        
                     type = "df40"
                    loc_x = x location placement
                    loc_y = y location placement
                    loc_z = z location placement
                     side = "top", "bottom"
               rotation[] = object rotation
                  size[0] = #pins
                  size[2] = stacking height (1.5, 2, 2.5, 3, 3.5, 4)
                  data[0] = "default"
                  data[1] = body color
                  data[2] = "male", "female"
                pcbsize_z = pcb thickness
               enablemask = true produces mask, false produces model

*/

module b2b(type, loc_x, loc_y, loc_z, side, rotation, size, data, pcbsize_z, enablemask, mask) {

    pins = size[0];
    height = size[2]-.05;
    style = data[0];
    hcolor = data[1];
    gender = data[2];
    
    adj = .01;
    $fn = 90;

    
    // df40 style header
    if(type=="df40" && enablemask == false) {

        pitch = .4;
        wallthick = .25;
        pcolor = "#fee5a6";

        if(gender == "female") {

            lead_in = 1.3;
            pinsize = .12;
            smtlead = [pinsize,.25,.15];
            size_x = pitch * (pins/2) + (2*lead_in);
            size_y = 2.88;

            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference() {
                    color(hcolor) cube([size_x, size_y, height]);
                    translate([.75,-1,height-.25]) color("#252525") cube([size_x-1.5, size_y+2, 1]);
                    translate([wallthick,wallthick,wallthick]) color("#252525") 
                        cube([size_x-(2*wallthick), .625, height]);
                    translate([wallthick,size_y-wallthick-.625,wallthick]) color("#252525")
                        cube([size_x-(2*wallthick), .625, height]);
                    translate([wallthick,wallthick,wallthick]) color("#252525")
                        cube([(lead_in-wallthick), size_y-(2*wallthick), height]);
                    translate([size_x-wallthick-(lead_in-wallthick),wallthick,wallthick])
                        color("#252525") cube([lead_in-wallthick, size_y-(2*wallthick), height]);

                }
                for(c=[lead_in+(pitch/2):pitch:size_x-lead_in]) {
                    color(pcolor) translate([c-(pinsize/2), (size_y-1.5)/2-(pinsize/2)+.125, adj])
                        cube([pinsize,pinsize,height-.25+adj]); 
                    color(pcolor) translate([c-(pinsize/2), (size_y-1.5)/2-(pinsize/2)+1.475, adj])
                        cube([pinsize, pinsize, height-.25+adj]); 
                    color(pcolor) translate([c-(pinsize/2), -smtlead[1], 0]) cube(smtlead);
                    color(pcolor) translate([c-(pinsize/2), size_y-adj, 0]) cube(smtlead);
                }
            }
        }
        if(gender == "male") {

            lead_in = .75;
            pinsize = .12;
            smtlead = [pinsize,.56,.15];
            size_x = pitch * (pins/2) + (2*lead_in);
            size_y = 1.85;
            height = 1.14;

            place(loc_x, loc_y, loc_z, size_x, size_y, rotation, side, pcbsize_z)
            union() {
                difference() {
                    color(hcolor) cube([size_x, size_y, height]);
                    color("#252525") translate([wallthick*3, wallthick, wallthick])
                        cube([size_x-(6*wallthick), size_y-(2*wallthick), height]);
                }
                for(c=[lead_in+(pitch/2):pitch:size_x-lead_in]) {
                    color(pcolor) translate([c-(pinsize/2), wallthick-(pinsize/2), adj])
                        cube([pinsize, pinsize, height+adj]);
                    color(pcolor) translate([c-(pinsize/2), size_y-wallthick-(pinsize/2), adj])
                        cube([pinsize, pinsize, height+adj]);
                    color(pcolor) translate([c-(pinsize/2), -smtlead[1], 0]) cube(smtlead);
                    color(pcolor) translate([c-(pinsize/2), size_y-adj, 0]) cube(smtlead);
                }
            }
        }
    }
}
