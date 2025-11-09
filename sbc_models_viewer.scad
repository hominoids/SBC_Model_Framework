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

    20240204 Version 1.0.0  SBC Models Viewer initial release

    see https://github.com/hominoids/SBC_Model_Framework

*/

include <sbc_models.scad>
use <sbc_models_library.scad>

/* [SBC and MCU] */
view = "3D Model"; // [3D Model, 2D Sections, 3D Reference Manual, All Devices]
section_position = 2; //[-2:.5:4]
sbc_model = "c1+"; // ["c1+", "c2", "c4", "hc4", "c5", "xu4", "xu4q", "mc1", "hc1", "n1", "n2", "n2+", "n2l", "n2lq", "m1", "m1s", "m2", "h2", "h2+", "h3", "h3+", "h4", "h4+", "h4_ultra", "show2", "rpipico", "rpipicow", "rpicm4+ioboard", "rpicm1", "rpicm3", "rpicm3l", "rpicm3+", "rpicm4s", "rpicm4", "rpicm4l", "rpizero", "rpizerow", "rpizero2w", "rpi1a+", "rpi1b+", "rpi2b", "rpi3a+", "rpi3b", "rpi3b+", "rpi4b", "rpi5", "a64", "a64lts", "rock64", "rockpro64", "quartz64a", "quartz64b", "h64b", "star64", "soedge_rk1808","soedge_a-baseboard", "rock4a", "rock4b", "rock4a+", "rock4b+", "rock4c", "rock4c+", "rock5b-v1.3", "rock5b", "rock5bq", "rock5b+", "nio12l", "vim1", "vim2", "vim3", "vim3l", "vim4", "tinkerboard", "tinkerboard-s", "tinkerboard-2", "tinkerboard-2s", "tinkerboard-r2", "tinkerboard-r2s", "opizero", "opizero2", "opir1plus_lts", "opir1", "opi3b-v2.1", "opi5", "opi5max", "jetsonnano", "lepotato", "sweetpotato", "tritium-h2+", "tritium-h3", "tritium-h5", "solitude", "alta", "atomicpi", "visionfive2", "visionfive2q", "bpif3", "licheerv+dock", "milk-v_duos","rak19007", "cnano-avr128da48", "nodemcu-32s", "cs-solarmeter", "feather-m0_express", "feather-m0_wifi", "feather-m4_express", "ssi-eeb", "ssi-ceb", "atx", "micro-atx", "dtx", "flex-atx", "mini-dtx", "mini-itx", "mini-itx_thin", "mini-stx", "mini-stx_thin", "nano-itx", "nuc", "pico-itx"]

sbc_off = false;
sbc_mask = false;
sbc_info = true;
text_color = "Green"; // [Green, Black, Dimgrey, White, Yellow, Orange, Red, DarkbBlue]
text_font = "Nimbus Mono PS"; // [Nimbus Mono PS, Liberation Mono, Noto Sans Mono]

/* [Command Line Options] */
heatsink_mask = "default"; // [disable, off, default, none, open, fan_open, fan_1, fan_2, fan_hex, vent, vent_hex_5mm, vent_hex_8mm, custom]
fan_size = 0; // [0,25,30,40,50,60,70,80,92]

gpio_mask = "default"; // [disable, off, default, none, open, block, knockout, vent]

uart_mask = "default"; // [default, none, open, knockout]

/* [Components] */
Class = "b2b"; // [antenna,audio,b2b,battery,button,cm,cm_holder,db,discrete,display,fan,fpc,gpio,header,heatsink,ic,jst,memory,molex,network,pcb,pcbadd,pcbhole,pcbsoc,pcbsub,pcbpad,pcie,pillar,power,smd,storage,switch,terminal,uart,usb2,usb3,usbc,video]

/* [Hidden] */
s = search([sbc_model], sbc_data);
sindex = 2;
pcbsize_x = sbc_data[s[0]][10][0];
pcbsize_y = sbc_data[s[0]][10][1];
pcbsize_z = sbc_data[s[0]][10][2];
pcbmaxsize_z = sbc_data[s[0]][11][5];

text_offset = 25;
text_height = pcbmaxsize_z + (len(sbc_data[s[0]][1]) * 7);
text_indent = [0,-32.5,4,0,-20.5,-8,4,4,4,4,-12,-16,-4,-12.5,-8,-4,-12,0,4,0,4,8,-.5,-12.5,-4.5,-8.5,0,-8];

ctext_offset = 15;
ctext_height = 130;

adj = .01;
$fn=90;

if(view == "3D Model") {
    // sbc size and holes to console
    echo(str(sbc_data[s[0]][1][0]));
    echo(str("    PCB Size: ", sbc_data[s[0]][10]));
    for (i=[sindex:11:len(sbc_data[s[0]])-1]) {
        class = sbc_data[s[0]][i];
        type = sbc_data[s[0]][i+1];
        pcbid = sbc_data[s[0]][i+2];
        loc_x = sbc_data[s[0]][i+3];
        loc_y = sbc_data[s[0]][i+4];
        loc_z = sbc_data[s[0]][i+5];
        face = sbc_data[s[0]][i+6];
        rotation = sbc_data[s[0]][i+7];
        size = sbc_data[s[0]][i+8];
        data = sbc_data[s[0]][i+9];
        mask = sbc_data[s[0]][i+10];
        if(class == "pcbhole" && pcbid == 0) {
            echo(str("    ", data[4], " hole: ", loc_x,", ", loc_y));
        }
    }
    // sbc model
    if(sbc_off == false) {
        sbc(sbc_model, heatsink_mask, fan_size, gpio_mask, uart_mask, false);
    }
    // create sbc information text
    if(sbc_info == true) {
        for (i=[0:1:len(sbc_data[s[0]][1])-1]) {
                color(text_color) translate([text_offset + text_indent[i], pcbsize_y, text_height-i*7]) 
                    rotate([90, 0, 0]) text(str(sbc_data[s[0]][1][i]), 5,  font = text_font);
        }
    }
    // sbc mask highlight
    if(sbc_mask == true) {
        #sbc(sbc_model, heatsink_mask, fan_size, gpio_mask, uart_mask, true);
    }
}
// create 2d mask sections
if(view == "2D Sections") {
    projection(cut = true) {
        // rear section
        difference() {
            translate([0, -pcbmaxsize_z, 0]) cube([pcbsize_x, pcbmaxsize_z, .1]);
            translate([0, 0, section_position]) rotate([90, 0, 0]) sbc(sbc_model, "disable", 0, gpio_mask, uart_mask, true);
        }
        // left section
        difference() {
            translate([-pcbmaxsize_z-adj, 0, 0]) cube([pcbmaxsize_z, pcbsize_y, .1]);
            translate([0, 0, section_position]) rotate([0, -90, 0]) sbc(sbc_model, "disable", 0, gpio_mask, uart_mask, true);
        }    
        // front section
        difference() {
            translate([0, pcbsize_y, 0]) cube([pcbsize_x, pcbmaxsize_z, .1]);
            translate([0, pcbsize_y, pcbsize_y+section_position]) rotate([-90, 0, 0]) 
                sbc(sbc_model, "disable", 0, gpio_mask, uart_mask, true);
        }
        // right section
        difference() {
            translate([pcbsize_x+adj, 0, 0]) cube([pcbmaxsize_z, pcbsize_y, .1]);
            translate([pcbsize_x, 0, pcbsize_x+section_position]) rotate([0, 90, 0]) 
                sbc(sbc_model, "disable", 0, gpio_mask, uart_mask, true);
        } 
        // pcb section
        sbc(sbc_model, "disable", 0, "disable", uart_mask, false); 
    }
}

// view component classes
if(view == "3D Reference Manual") {
    antenna = [["ipex"],[
        " CLASS NAME: antenna",
        "DESCRIPTION: creates antenna components",
        "",
        "      USAGE: antenna, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                      type = ipex",
        "                    pcb_id = parent PCB",
        "                     loc_x = x location placement",
        "                     loc_y = y location placement",
        "                     loc_z = z location placement",
        "                      side = top, bottom",
        "                rotation[] = object rotation",
        "                   mask[0] = component mask true, false",
        "                   mask[1] = length",
        "                   mask[2] = set back",
        "                   mask[3] = mstyle default"
        ]];
    audio = [["out-in-spdif", "jack_3.5", "jack_3.5-2", "audio_micro", "mic_round"],[
        " CLASS NAME: audio",
        "DESCRIPTION: creates audio components",
        "",
        "      USAGE: audio, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                    type = audio_micro",
        "                  pcb_id = parent PCB",
        "                   loc_x = x location placement",
        "                   loc_y = y location placement",
        "                   loc_z = z location placement",
        "                    side = top, bottom",
        "              rotation[] = object rotation",
        "                 mask[0] = component mask true, false",
        "                 mask[1] = length",
        "                 mask[2] = set back",
        "                 mask[3] = mstyle default",
        "",
        "                    type = jack_3.5",
        "                  pcb_id = parent PCB",
        "                   loc_x = x location placement",
        "                   loc_y = y location placement",
        "                   loc_z = z location placement",
        "                    side = top, bottom",
        "              rotation[] = object rotation",
        "                 size[0] = body size_x",
        "                 size[1] = body size_y",
        "                 size[2] = body size_z",
        "                 data[0] = neck diameter",
        "                 data[1] = z adjustment",
        "                 mask[0] = component mask true, false",
        "                 mask[1] = length",
        "                 mask[2] = set back",
        "                 mask[3] = mstyle default",
        "",
        "                    type = mic_round",
        "                  pcb_id = parent PCB",
        "                   loc_x = x location placement",
        "                   loc_y = y location placement",
        "                   loc_z = z location placement",
        "                    side = top, bottom",
        "              rotation[] = object rotation",
        "                 size[0] = body diameter",
        "                 size[2] = body height",
        "                 mask[0] = component mask true, false",
        "                 mask[1] = length",
        "                 mask[2] = set back",
        "                 mask[3] = mstyle default",
        "",
        "                    type = out-in-spdif",
        "                  pcb_id = parent PCB",
        "                   loc_x = x location placement",
        "                   loc_y = y location placement",
        "                   loc_z = z location placement",
        "                    side = top, bottom",
        "              rotation[] = object rotation",
        "                 mask[0] = component mask true, false",
        "                 mask[1] = length",
        "                 mask[2] = set back",
        "                 mask[3] = mstyle default",
        ]];
    b2b = [["df40"],[
        " CLASS NAME: b2b",
        "DESCRIPTION: creates b2b headers in size, pitch and stacking height",
        "",
        "      USAGE: b2b, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                  type = df40",
        "                pcb_id = parent PCB",
        "                 loc_x = x location placement",
        "                 loc_y = y location placement",
        "                 loc_z = z location placement",
        "                  side = top, bottom",
        "            rotation[] = object rotation",
        "               size[0] = #pins",
        "               size[2] = stacking height (1.5, 2, 2.5, 3, 3.5, 4)",
        "               data[0] = default",
        "               data[1] = header color",
        "               data[2] = male, female"    
        ]];
    battery = [["bat_hold_1", "rtc_micro"],[
        " CLASS NAME: battery",
        "DESCRIPTION: creates batteries and support components",
        "",
        "      USAGE: battery, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                      type = bat_hold_1, rtc_micro",
        "                    pcb_id = parent PCB",
        "                     loc_x = x location placement",
        "                     loc_y = y location placement",
        "                     loc_z = z location placement",
        "                      side = top, bottom",
        "                rotation[] = object rotation",
        "                   mask[0] = true enables component mask",
        "                   mask[1] = mask length",
        "                   mask[2] = mask setback",
        "                   mask[3] = mstyle default"
        ]];
    button = [["momentary_6x6x9", "momentary_6x6x4", "momentary_6x6x4_90", "momentary_4x2x1_90", "momentary_4x2x1", "momentary_7x3x3_90", "momentary_4.5x3.5x2.5_90","momentary_4.5x4.5x4.5","momentary_4.5x4.5x4.5_90"],[
        " CLASS NAME: button",
        "DESCRIPTION: creates buttons",
        "",
        "      USAGE: button, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                      type = momentary_6x6x9, momentary_6x6x4, momentary_6x6x4_90, momentary_4x2x1_90,",
        "                             momentary_4x2x1, momentary_7x3x3_90, momentary_4.5x3.5x2.5_90, momentary_4.5x4.5x4.5, momentary_4.5x3.5x2.5_90",
        "                    pcb_id = parent PCB",
        "                     loc_x = x location placement",
        "                     loc_y = y location placement",
        "                     loc_z = z location placement",
        "                      side = top, bottom",
        "                rotation[] = object rotation",
        "                   mask[0] = true enables component mask",
        "                   mask[1] = mask length",
        "                   mask[2] = mask setback",
        "                   mask[3] = mstyle default"
        ]];
    cm = [["cm1","cm3","cm3l","cm4","cm4l","jetsonnano"],[
        " CLASS NAME: cm",
        "DESCRIPTION: creates compute modules as library components",
        "",
        "      USAGE: cm, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                 type = cm1,cm3,cm3l,cm4s,cm4,cm4l,jetsonnano",
        "               pcb_id = parent PCB",
        "                loc_x = x location placement",
        "                loc_y = y location placement",
        "                loc_z = z location placement",
        "                 side = top, bottom",
        "           rotation[] = object rotation",
        "              data[0] = fan size",
        "              data[1] = cm pcb color",
        "              mask[0] = true enables component mask",
        "              mask[1] = mask length",
        "              mask[2] = mask setback",
        "              mask[3] = mstyle default"
        ]];
    cm_holder = [["jetsonnano"],[
        " CLASS NAME: cm_holder",
        "DESCRIPTION: creates compute module holder",
        "",
        "      USAGE: cm_holder(type, loc_x, loc_y, loc_z, side, rotation[], size[], data[], pcbsize_z, enablemask, mask[])",
        "",
        "                       type = jetsonnano,cm1,cm3,cm3l,cm4s",
        "                      loc_x = x location placement",
        "                      loc_y = y location placement",
        "                      loc_z = z location placement",
        "                       side = top, bottom",
        "                 rotation[] = object rotation",
        "                  pcbsize_z = pcb thickness",
        "                 enablemask = true produces mask, false produces model",
        "                    mask[0] = true enables component mask",
        "                    mask[1] = mask length",
        "                    mask[2] = mask setback",
        "                    mask[3] = mstyle default"
        ]];
    db = [["db9"],[
        " CLASS NAME: dsub",
        "DESCRIPTION: creates dsub connectors",
        "",
        "      USAGE: display, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                      type = db9",
        "                    pcb_id = parent PCB",
        "                     loc_x = x location placement",
        "                     loc_y = y location placement",
        "                     loc_z = z location placement",
        "                      side = top, bottom",
        "                rotation[] = object rotation",
        "                   data[0] = male, female",
        "                   mask[0] = component mask true, false",
        "                   mask[1] = mask length",
        "                   mask[2] = mask setback",
        "                   mask[3] = mstyle default"
        ]];
    discrete = [["ir_1", "ir_dual", "capacitor", "led"],[
        " CLASS NAME: discrete",
        "DESCRIPTION: creates discrete components",
        "",
        "      USAGE: discrete, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                       type = ir_dual,",
        "                     pcb_id = parent PCB",
        "                      loc_x = x location placement",
        "                      loc_y = y location placement",
        "                      loc_z = z location placement",
        "                       side = top, bottom",
        "                 rotation[] = object rotation",
        "                    mask[0] = true enables component mask",
        "                    mask[1] = mask length",
        "                    mask[2] = mask setback",
        "                    mask[3] = mstyle default",
        "",
        "                       type = ir_1",
        "                     pcb_id = parent PCB",
        "                      loc_x = x location placement",
        "                      loc_y = y location placement",
        "                      loc_z = z location placement",
        "                       side = top, bottom",
        "                 rotation[] = object rotation",
        "                    size[2] = height",
        "                    mask[0] = true enables component mask",
        "                    mask[1] = mask length",
        "                    mask[2] = mask setback",
        "                    mask[3] = mstyle default",
        "",
        "                       type = capacitor",
        "                     pcb_id = parent PCB",
        "                      loc_x = x location placement",
        "                      loc_y = y location placement",
        "                      loc_z = z location placement",
        "                       side = top, bottom",
        "                 rotation[] = object rotation",
        "                    size[0] = diameter",
        "                    size[2] = height",
        "",
        "                       type = led",
        "                     pcb_id = parent PCB",
        "                      loc_x = x location placement",
        "                      loc_y = y location placement",
        "                      loc_z = z location placement",
        "                       side = top, bottom",
        "                 rotation[] = object rotation",
        "                    size[0] = diameter",
        "                    size[2] = height",
        "                    data[0] = style default",
        "                    data[1] = led color"
        ]];
    display = [["lcd_2.2", "mipi_csi", "mipi_dsi"],[
        " CLASS NAME: display",
        "DESCRIPTION: creates flat panel displays",
        "",
        "      USAGE: display, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                      type = lcd_2.2, mipi_csi, mipi_dsi",
        "                    pcb_id = parent PCB",
        "                     loc_x = x location placement",
        "                     loc_y = y location placement",
        "                     loc_z = z location placement",
        "                      side = top, bottom",
        "                rotation[] = object rotation",
        "                   mask[0] = component mask true, false",
        "                   mask[1] = mask length",
        "                   mask[2] = mask setback",
        "                   mask[3] = mstyle default"
        ]];
    fan = [["fan_micro","encl_pmw","encl_pmw_h"],[
        " CLASS NAME: fan",
        "DESCRIPTION: creates fan support components",
        "",
        "      USAGE: fan, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                  type = fan_micro, encl_pmw, encl_pmw_h",
        "                pcb_id = parent PCB",
        "                 loc_x = x location placement",
        "                 loc_y = y location placement",
        "                 loc_z = z location placement",
        "                  side = top, bottom",
        "            rotation[] = object rotation",
        "               mask[0] = component mask true, false",
        "               mask[1] = mask length",
        "               mask[2] = mask setback",
        "               mask[3] = mstyle default"
        ]];
    fpc = [["fh19", "fh12"],[
        " CLASS NAME: fpc",
        "DESCRIPTION: creates fpc connectors",
        "",
        "      USAGE: fpc, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                  type = fh19",
        "                pcb_id = parent PCB",
        "                 loc_x = x location placement",
        "                 loc_y = y location placement",
        "                 loc_z = z location placement",
        "                  side = top, bottom",
        "            rotation[] = object rotation",
        "               size[0] = #pins",
        "               data[0] = smt",
        "               data[1] = side",
        "               data[2] = body color",
        "               data[3] = tab color",
        "               mask[0] = true enables component mask",
        "               mask[1] = mask length",
        "               mask[2] = mask setback",
        "               mask[3] = mstyle default",
        "",
        "                  type = fh12",
        "                pcb_id = parent PCB",
        "                 loc_x = x location placement",
        "                 loc_y = y location placement",
        "                 loc_z = z location placement",
        "                  side = top, bottom",
        "            rotation[] = object rotation",
        "               size[0] = #pins",
        "               data[0] = smt",
        "               data[1] = top",
        "               data[2] = body color",
        "               data[3] = tab color",
        "               mask[0] = true enables component mask",
        "               mask[1] = mask length",
        "               mask[2] = mask setback",
        "               mask[3] = mstyle default"
        ]];
    gpio = [["open", "encl_header_30", "encl_header_12"],[
        " CLASS NAME: gpio",
        "DESCRIPTION: creates gpio headers",
        "",
        "      USAGE: gpio, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                   type = open",
        "                 pcb_id = parent PCB",
        "                  loc_x = x location placement",
        "                  loc_y = y location placement",
        "                  loc_z = z location placement",
        "                   side = top, bottom",
        "             rotation[] = object rotation",
        "                size[0] = #row",
        "                size[1] = #columns",
        "                size[2] = pin height",
        "                data[0] = style (straight)",
        "                data[1] = header color",
        "                data[2] = male, female",
        "                data[3] = pitch",
        "                data[4] = pin color",
        "                mask[0] = true enables component mask",
        "                mask[1] = mask length",
        "                mask[2] = mask setback",
        "                mask[3] = mstyle (none, open, block, knockout, vent)",
        "",
        "                   type = encl_header_30, encl_header_12",
        "                 pcb_id = parent PCB",
        "                  loc_x = x location placement",
        "                  loc_y = y location placement",
        "                  loc_z = z location placement",
        "                   side = top, bottom",
        "             rotation[] = object rotation",
        "                mask[0] = true enables component mask",
        "                mask[1] = mask length",
        "                mask[2] = mask setback",
        "                mask[3] = mstyle (none, open, block, knockout, vent)"
        ]];
    header = [["open"],[
        " CLASS NAME: header",
        "DESCRIPTION: creates pin headers in any size or pitch",
        "",
        "      USAGE: header, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                     type = open, boxed, angled",
        "                   pcb_id = parent PCB",
        "                    loc_x = x location placement",
        "                    loc_y = y location placement",
        "                    loc_z = z location placement",
        "                     side = top, bottom",
        "               rotation[] = object rotation",
        "                  size[0] = #row",
        "                  size[1] = #columns",
        "                  size[2] = pin height",
        "                  data[0] = style (thruhole, smt)",
        "                  data[1] = header color",
        "                  data[2] = male, female",
        "                  data[3] = pitch",
        "                  data[4] = pin color",
        "                  mask[0] = component mask true, false",
        "                  mask[1] = length",
        "                  mask[2] = set back",
        "                  mask[3] = mstyle (default)"
        ]];
    heatsink = [["40mm_passive_10", "40mm_passive_25", "32mm_passive_10", "c1+_oem", "c2_oem", "40mm_active_10", "c4_oem", "hc4_oem", "xu4_oem", "xu4q_oem", "n1_oem", "n2l_oem", "n2lq_oem", "n2_oem", "n2+_oem", "m1_oem", "h2_oem", "h3_oem", "atomicpi", "khadas_oem", "khadas_fan_oem", "radxa_oem", "rpi5_oem", "stub", "pine64_active_10", "pine64_passive_20", "pine64_passive_30", "m1s_oem"],[
        " CLASS NAME: heatsink",
        "DESCRIPTION: creates heatsinks",
        "",
        "      USAGE: heatsink, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                       type = 40mm_active_10, 40mm_passive_10, 40mm_passive_25, 32mm_passive_10,",
        "                              c1+_oem, c2_oem, c4_oem, hc4_oem, xu4_oem, xu4q_oem, n1_oem, n2l_oem, n2lq_oem",
        "                              n2_oem, n2+_oem, m1_oem, m1s_oem, h2_oem, h3_oem,",
        "                              atomicpi, khadas_oem, khadas_fan_oem, radxa_oem, rpi5_oem, stub,",
        "                              pine64_active_10, pine64_passive_20, pine64_passive_30",
        "                     pcb_id = parent PCB",
        "                      loc_x = x location placement",
        "                      loc_y = y location placement",
        "                      loc_z = z location placement",
        "                       side = top, bottom",
        "                 rotation[] = object rotation",
        "                    data[0] = fan size",
        "                    mask[0] = component mask true, false",
        "                    mask[1] = length",
        "                    mask[2] = set back",
        "                    mask[3] = mstyle (open, fan_open, fan_1, fan_2, fan_hex, vent, vent_hex_5mm, vent_hex_8mm, custom)"
        ]];
    ic = [["generic"],[
        " CLASS NAME: ic",
        "DESCRIPTION: creates intergrated circuits",
        "",
        "      USAGE: ic, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                 type = generic",
        "               pcb_id = parent PCB",
        "                loc_x = x location placement",
        "                loc_y = y location placement",
        "                loc_z = z location placement",
        "                 side = top, bottom",
        "           rotation[] = object rotation",
        "              size[0] = size_x",
        "              size[1] = size_y",
        "              size[2] = size_z",
        "              data[0] = icolor",
        "              mask[0] = true, false",
        "              mask[1] = length",
        "              mask[2] = set back",
        "              mask[3] = mstyle default"
        ]];
    jst = [["xh", "ph", "zh", "sh", "pa"],[
        " CLASS NAME: jst",
        "DESCRIPTION: creates jst connectors for xh, ph, zh, sh, pa",
        "",
        "      USAGE: jst, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                  type = xh,ph,zh,sh,pa",
        "                pcb_id = parent PCB",
        "                 loc_x = x location placement",
        "                 loc_y = y location placement",
        "                 loc_z = z location placement",
        "                  side = top, bottom",
        "            rotation[] = object rotation",
        "               size[0] = #pins",
        "               data[0] = thruhole, smt",
        "               data[1] = top, side",
        "               data[2] = body color",
        "               mask[0] = true, false",
        "               mask[1] = length",
        "               mask[2] = set back",
        "               mask[3] = mstyle default"
        ]];
    memory = [["emmc", "emmc_plug", "emmc_plug_double", "sodimm_5.2", "sodimm_9.2"],[
        " CLASS NAME: memory",
        "DESCRIPTION: creates memory components",
        "",
        "      USAGE: memory, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                     type = emmc, emmc_plug, sodimm_5.2, sodimm_9.2",
        "                   pcb_id = parent PCB",
        "                    loc_x = x location placement",
        "                    loc_y = y location placement",
        "                    loc_z = z location placement",
        "                     side = top, bottom",
        "               rotation[] = object rotation",
        "                  mask[0] = true enables component mask",
        "                  mask[1] = mask length",
        "                  mask[2] = mask setback",
        "                  mask[3] = mstyle default"
        ]];
    molex = [["7478","5046"],[
        " CLASS NAME: molex",
        "DESCRIPTION: creates molex series connectors",
        "",
        "      USAGE: molex, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                    type = 7478,5046",
        "                   pcb_id = parent PCB",
        "                   loc_x = x location placement",
        "                   loc_y = y location placement",
        "                   loc_z = z location placement",
        "                    side = top, bottom",
        "              rotation[] = object rotation",
        "                 size[0] = #pins",
        "                 data[0] = thruhole, smt",
        "                 data[1] = top, side",
        "                 mask[0] = true enables component mask",
        "                 mask[1] = mask length",
        "                 mask[2] = mask setback",
        "                 mask[3] = mstyle default"
        ]];
    network = [["rj45_single", "rj45_single_short", "rj45_reverse_single", "rj45_low_profile1","rj45_low_profile2", "rj45_double_stacked", "rj45-usb2_double", "rj45-usb3_double"],[
        " CLASS NAME: network",
        "DESCRIPTION: creates network components",
        "",
        "      USAGE: network, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                      type = rj45_single, rj45_single_short, rj45_reverse_single, rj45_low_profile1,",
        "                             rj45_low_profile2, rj45_double_stacked, rj45-usb2_double, rj45-usb3_double",
        "                    pcb_id = parent PCB",
        "                     loc_x = x location placement",
        "                     loc_y = y location placement",
        "                     loc_z = z location placement",
        "                      side = top, bottom",
        "                rotation[] = object rotation",
        "                   mask[0] = true enables component mask",
        "                   mask[1] = mask length",
        "                   mask[2] = mask setback",
        "                   mask[3] = mstyle default"
        ]];
    pcb = [[],[
        " CLASS NAME: pcb",
        "DESCRIPTION: creates pcb",
        "",
        "      USAGE: pcb, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                  type = rectangle, round, polygon, slot, dxf, cm1, cm3, cm4, nano",
        "                pcb_id = parent PCB",
        "                 loc_x = x location placement",
        "                 loc_y = y location placement",
        "                 loc_z = z location placement",
        "                  side = top, bottom",
        "            rotation[] = object rotation",
        "               size[0] = x size",
        "               size[1] = y size",
        "               size[2] = z size",
        "               data[0] = pcb corner radius",
        "               data[1] = pcb color",
        "               data[2] = polygon or dxf filename",
        "               data[3] = dxf scale",
        "               data[4] = top maximum component height",
        "               data[5] = bottom maximum component height",
        "               mask[0] = true enables component mask",
        "               mask[1] = mask length",
        "               mask[2] = mask setback",
        "               mask[3] = mstyle default"
        ]];
    pcbadd = [[],[
        " CLASS NAME: pcbadd",
        "DESCRIPTION: creates pcb additions",
        "",
        "      USAGE: pcbadd, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                     type = rectangle, round, polygon, slot, dxf",
        "                   pcb_id = parent PCB",
        "                    loc_x = x location placement",
        "                    loc_y = y location placement",
        "                    loc_z = z location placement",
        "                     side = top, bottom",
        "               rotation[] = object rotation",
        "                  size[0] = x size",
        "                  size[1] = y size",
        "                  size[2] = z size",
        "                  data[0] = corner radius or diameter",
        "                  data[1] = pcb color",
        "                  data[2] = polygon or dxf filename",
        "                  data[3] = dxf scale",
        "                  mask[0] = true enables component mask",
        "                  mask[1] = mask length",
        "                  mask[2] = mask setback",
        "                  mask[3] = mstyle default"
        ]];
    pcbhole = [[],[
        " CLASS NAME: pcbhole",
        "DESCRIPTION: creates pcb hole",
        "",
        "      USAGE: pcbhole, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                      type = round",
        "                    pcb_id = parent PCB",
        "                     loc_x = x location placement",
        "                     loc_y = y location placement",
        "                     loc_z = z location placement",
        "                      side = top, bottom",
        "                rotation[] = object rotation",
        "                   size[0] = hole diameter",
        "                   data[0] = style",
        "                   data[1] = hole color",
        "                   data[2] = sidewall support (none,left,right,rear,front)",
        "                   data[3] = trace diameter",
        "                   data[4] = position (left_rear,left_front,right_rear,right_front,middle_rear,middle_front,",
        "                             heatsink_left,heatsink_right,heatsink_rear,heatsink_front,pcie_1,gpio_1,misc_1)",
        "                   mask[0] = true enables component mask",
        "                   mask[1] = mask length",
        "                   mask[2] = mask setback",
        "                   mask[3] = mstyle default"
        ]];
    pcbsoc = [["flat", "raised", "mid-raised", "rk3399", "rk3588"],[
        " CLASS NAME: pcbsoc",
        "DESCRIPTION: creates soc components",
        "",
        "      USAGE: pcbsoc, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                     type = flat, raised, mid-raised, rk3399, rk3588",
        "                   pcb_id = parent PCB",
        "                    loc_x = x location placement",
        "                    loc_y = y location placement",
        "                    loc_z = z location placement",
        "                     side = top, bottom",
        "               rotation[] = object rotation",
        "                  size[0] = size_x",
        "                  size[1] = size_y",
        "                  size[2] = size_z",
        "                  mask[0] = true enables component mask",
        "                  mask[1] = mask length",
        "                  mask[2] = mask setback",
        "                  mask[3] = mstyle default"
        ]];
    pcbsub = [[],[
        " CLASS NAME: pcbsub",
        "DESCRIPTION: creates pcb subtractions",
        "",
        "      USAGE: pcbadd, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                     type = rectangle, round, polygon, slot, dxf",
        "                   pcb_id = parent PCB",
        "                    loc_x = x location placement",
        "                    loc_y = y location placement",
        "                    loc_z = z location placement",
        "                     side = top, bottom",
        "               rotation[] = object rotation",
        "                  size[0] = x size",
        "                  size[1] = y size",
        "                  size[2] = z size",
        "                  data[0] = corner radius or diameter",
        "                  data[1] = pcb color",
        "                  data[2] = polygon or dxf filename",
        "                  data[3] = dxf scale",
        "                  mask[0] = true enables component mask",
        "                  mask[1] = mask length",
        "                  mask[2] = mask setback",
        "                  mask[3] = mstyle default"
        ]];
    pcbpad = [[],[
        " CLASS NAME: pcbpad",
        "DESCRIPTION: creates pcb pads",
        "",
        "      USAGE: pcbpad, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                     type = round, square, sqround, castellation",
        "                   pcb_id = parent PCB",
        "                    loc_x = x location placement",
        "                    loc_y = y location placement",
        "                    loc_z = z location placement",
        "                     side = top, bottom",
        "               rotation[] = object rotation",
        "                  size[0] = #pad x",
        "                  size[1] = #pad y",
        "                  data[0] = hole size",
        "                  data[1] = pad color",
        "                  data[2] = pad size",
        "                  data[5] = pad_trim (front, rear)",
        "                  mask[0] = true enables component mask",
        "                  mask[1] = mask length",
        "                  mask[2] = mask setback",
        "                  mask[3] = mstyle default"
        ]];
    pcie = [["x1","x4"],[
        " CLASS NAME: pcie",
        "DESCRIPTION: creates pcie components",
        "",
        "      USAGE: pcie, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                   type = x1, x4",
        "                 pcb_id = parent PCB",
        "                  loc_x = x location placement",
        "                  loc_y = y location placement",
        "                  loc_z = z location placement",
        "                   side = top, bottom",
        "             rotation[] = object rotation",
        "                mask[0] = true enables component mask",
        "                mask[1] = mask length",
        "                mask[2] = mask setback",
        "                mask[3] = mstyle default"
        ]];
    pillar = [["hex", "round"],[
        " CLASS NAME: pillar",
        "DESCRIPTION: creates pillars",
        "",
        "      USAGE: pillar, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                     type = hex, round",
        "                   pcb_id = parent PCB",
        "                    loc_x = x location placement",
        "                    loc_y = y location placement",
        "                    loc_z = z location placement",
        "                     side = top, bottom",
        "               rotation[] = object rotation",
        "                  size[0] = outside dia",
        "                  size[1] = inside dia",
        "                  size[2] = height",
        "                  data[1] = body color",
        "                  mask[0] = true enables component mask",
        "                  mask[1] = mask length",
        "                  mask[2] = mask setback",
        "                  mask[3] = mstyle default"
]];
    power = [["pwr2.5_5x7.5", "pwr5.5_7.5x11.5", "pwr5.5_10x10", "pwr5.5_9.5x7", "pj-202ah", "molex_4x1", "small_encl_satapwr"],[
        " CLASS NAME: power",
        "DESCRIPTION: creates power delivery related components",
        "",
        "      USAGE: power, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                    type = pwr2.5_5x7.5, pwr5.5_7.5x11.5, pwr5.5_10x10, pwr5.5_9.5x7, pj-202ah,",
        "                           molex_4x1, small_encl_satapwr",
        "                  pcb_id = parent PCB",
        "                   loc_x = x location placement",
        "                   loc_y = y location placement",
        "                   loc_z = z location placement",
        "                    side = top, bottom",
        "              rotation[] = object rotation",
        "                 mask[0] = true enables component mask",
        "                 mask[1] = mask length",
        "                 mask[2] = mask setback",
        "                 mask[3] = mstyle default"
        ]];
    smd = [["led"],[
        " CLASS NAME: smd",
        "DESCRIPTION: creates smd components",
        "",
        "      USAGE: smd, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                  type = led",
        "                pcb_id = parent PCB",
        "                 loc_x = x location placement",
        "                 loc_y = y location placement",
        "                 loc_z = z location placement",
        "                  side = top, bottom",
        "            rotation[] = object rotation",
        "               size[0] = size_x",
        "               size[1] = size_y",
        "               size[2] = size_z",
        "               data[0] = body color",
        "               mask[0] = true enables component mask",
        "               mask[1] = mask length",
        "               mask[2] = mask setback",
        "               mask[3] = mstyle default"
        ]];
    storage = [["microsdcard", "microsdcard2", "microsdcard3", "microsdcard3_i", "sata_header", "sata_power_vrec", "sata_encl_power", "m.2_header", "m.2_stud"],[
        " CLASS NAME: storage",
        "DESCRIPTION: creates storage components",
        "",
        "      USAGE: storage, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                      type = microsdcard, microsdcard2, microsdcard3, microsdcard3_i, sata_header,",
        "                             sata_power_vrec, sata_encl_power, m.2_header, m.2_stud",
        "                    pcb_id = parent PCB",
        "                     loc_x = x location placement",
        "                     loc_y = y location placement",
        "                     loc_z = z location placement",
        "                      side = top, bottom",
        "                rotation[] = object rotation",
        "                   mask[0] = true enables component mask",
        "                   mask[1] = mask length",
        "                   mask[2] = mask setback",
        "                   mask[3] = mstyle default"
        ]];
    switch = [["slide_4x9","slide_7x3.5x1"],[
        " CLASS NAME: switch",
        "DESCRIPTION: creates switches",
        "",
        "      USAGE: switch, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                     type = slide_4x9, slide_7x3.5x1",
        "                   pcb_id = parent PCB",
        "                    loc_x = x location placement",
        "                    loc_y = y location placement",
        "                    loc_z = z location placement",
        "                     side = top, bottom",
        "               rotation[] = object rotation",
        "                  mask[0] = true enables component mask",
        "                  mask[1] = mask length",
        "                  mask[2] = mask setback",
        "                  mask[3] = mstyle default"
        ]];
    terminal = [["screw", "barrier"],[
        " CLASS NAME: terminal",
        "DESCRIPTION: creates terminal blocks",
        "",
        "      USAGE: terminal, type, pcb_id, loc_x, loc_y, loc_z, side, rotation, size, data, mask",
        "",
        "                       type = screw, barrier",
        "                     pcb_id = parent PCB",
        "                      loc_x = x location placement",
        "                      loc_y = y location placement",
        "                      loc_z = z location placement",
        "                       side = top, bottom",
        "                 rotation[] = object rotation",
        "                    size[0] = #positions",
        "                    size[1] = body depth",
        "                    size[2] = height",
        "                    data[0] = pitch",
        "                    data[1] = body color",
        "                    mask[0] = true enables component mask",
        "                    mask[1] = mask length",
        "                    mask[2] = mask setback",
        "                    mask[3] = mstyle default"
        ]];
    uart = [["molex_5267", "molex_5268"],[
        " CLASS NAME: uart",
        "DESCRIPTION: creates uart ports",
        "",
        "      USAGE: uart, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                   type = molex_5267, molex_5268",
        "                 pcb_id = parent PCB",
        "                  loc_x = x location placement",
        "                  loc_y = y location placement",
        "                  loc_z = z location placement",
        "                   side = top, bottom",
        "             rotation[] = object rotation",
        "                mask[0] = true enables component mask",
        "                mask[1] = mask length",
        "                mask[2] = mask setback",
        "                mask[3] = mstyle (none, open, knockout)"
        ]];
    usb2 = [["micro", "single_horizontal_a", "single_vertical_a", "single_up_a", "double_stacked_a", "single_b"],[
        " CLASS NAME: usb2",
        "DESCRIPTION: creates usb2 ports",
        "",
        "      USAGE: usb2, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                   type = micro, double_stacked_a, single_b,",
        "                 pcb_id = parent PCB",
        "                  loc_x = x location placement",
        "                  loc_y = y location placement",
        "                  loc_z = z location placement",
        "                   side = top, bottom",
        "             rotation[] = object rotation",
        "                mask[0] = true enables component mask",
        "                mask[1] = mask length",
        "                mask[2] = mask setback",
        "                mask[3] = mstyle default",
        "",
        "                   type = single_horizontal_a, single_vertical_a, single_up_a",
        "                 pcb_id = parent PCB",
        "                  loc_x = x location placement",
        "                  loc_y = y location placement",
        "                  loc_z = z location placement",
        "                   side = top, bottom",
        "             rotation[] = object rotation",
        "                size[1] = size_y",
        "                mask[0] = true enables component mask",
        "                mask[1] = mask length",
        "                mask[2] = mask setback",
        "                mask[3] = mstyle default"
        ]];
    usb3 = [["single_horizontal_a", "single_vertical_a", "double_stacked_a", "double_stacked_usb3-usbc","double_stacked_usb3-usb2"],[
        " CLASS NAME: usb3",
        "DESCRIPTION: creates usb3 ports",
        "",
        "      USAGE: usb3, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                   type = single_horizontal_a, double_stacked_a, double_stacked_usb3-usbc",
        "                          double_stacked_usb3-usb2",
        "                 pcb_id = parent PCB",
        "                  loc_x = x location placement",
        "                  loc_y = y location placement",
        "                  loc_z = z location placement",
        "                   side = top, bottom",
        "             rotation[] = object rotation",
        "                mask[0] = true enables component mask",
        "                mask[1] = mask length",
        "                mask[2] = mask setback",
        "                mask[3] = mstyle default",
        "",
        "                   type = single_vertical_a",
        "                 pcb_id = parent PCB",
        "                  loc_x = x location placement",
        "                  loc_y = y location placement",
        "                  loc_z = z location placement",
        "                   side = top, bottom",
        "             rotation[] = object rotation",
        "                size[1] = size_y",
        "                mask[0] = true enables component mask",
        "                mask[1] = mask length",
        "                mask[2] = mask setback",
        "                mask[3] = mstyle default"
        ]];
    usbc = [["single_horizontal", "single_vertical"],[
        " CLASS NAME: usbc",
        "DESCRIPTION: creates usbc ports",
        "",
        "      USAGE: usbc, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                   type = single_horizontal_a, single_vertical_a",
        "                 pcb_id = parent PCB",
        "                  loc_x = x location placement",
        "                  loc_y = y location placement",
        "                  loc_z = z location placement",
        "                   side = top, bottom",
        "             rotation[] = object rotation",
        "                mask[0] = true enables component mask",
        "                mask[1] = mask length",
        "                mask[2] = mask setback",
        "                mask[3] = mstyle default"
        ]];
    video = [["hdmi_a", "hdmi_a_vertical", "dp-hdmi_a", "hdmi_micro", "hdmi_mini", "dp_mini", "dp_vertical", "vga"],[
        " CLASS NAME: video",
        "DESCRIPTION: creates video connectors",
        "",
        "      USAGE: video, type, pcb_id, loc_x, loc_y, loc_z, side, rotation[], size[], data[], mask[]",
        "",
        "                    type = hdmi_a, hdmi_a_vertical, dp-hdmi_a, hdmi_micro, hdmi_mini, dp_mini, vga",
        "                  pcb_id = parent PCB",
        "                   loc_x = x location placement",
        "                   loc_y = y location placement",
        "                   loc_z = z location placement",
        "                    side = top, bottom",
        "              rotation[] = object rotation",
        "                 mask[0] = true enables component mask",
        "                 mask[1] = mask length",
        "                 mask[2] = mask setback",
        "                 mask[3] = mstyle default"
        ]];

    if(Class =="antenna") {
        for(i=[0:1:len(antenna[0])-1]) {
            antenna(antenna[0][i], 130+(i*20), i*20, 0, "top", 0, [0,0,0], [0], 0, false, [0]);
            color(text_color) translate([135+(i*20), i*20, 0]) 
                text(str(antenna[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(antenna[1])-1]) {
            color(text_color) translate([ctext_offset, 10, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(antenna[1][i], 5,  font = text_font);
        }
    }
    if(Class =="audio") {
        for(i=[0:1:len(audio[0])-1]) {
            audio(audio[0][i], 70+(i*20), i*20, 0, "top", 0, [6.5,10,4],[5,0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([85+i*20, i*20, 0]) 
                text(str(audio[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(audio[1])-1]) {
            color(text_color) translate([ctext_offset, 100, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(audio[1][i], 5,  font = text_font);
        }
    }
    if(Class =="b2b") {
        for(i=[0:1:len(b2b[0])-1]) {
            if(b2b[0][i] == "df40") {
                for(c=[8:10:100]) {
                    b2b(b2b[0][i], 100, c-8, 0, "top", 0, [c,0,1.5],["default","black", "male"], 
                        0, false, [false,10,2,"default"]);
                    b2b(b2b[0][i], 135, c-8, 0, "top", 0, [c,0,1.5],["default","black", "female"], 
                        0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([105, -12, 0]) text(str(b2b[0][i]), font = text_font, direction="ltr");
            }
        }
        for(i=[0:1:len(b2b[1])-1]) {
            color(text_color) translate([ctext_offset, 100, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(b2b[1][i], 5,  font = text_font);
        }
    }
    if(Class =="battery") {
        for(i=[0:1:len(battery[0])-1]) {
            battery(battery[0][i], 75+(i*20), i*25, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([108+(i*2), i*25, 0]) 
                text(str(battery[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(battery[1])-1]) {
            color(text_color) translate([ctext_offset, 50, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(battery[1][i], 5, font = text_font);
        }
    }
    if(Class =="button") {
        for(i=[0:1:len(button[0])-1]) {
            button(button[0][i], 75+(i*12), i*15, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([90+(i*12), i*15, 0]) 
                text(str(button[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(button[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(button[1][i], 5,  font = text_font);
        }
    }
    if(Class =="cm") {
        for(i=[0:1:len(cm[0])-1]) {
            cm(cm[0][i], 100, i*45, 0, "top", 0, [0,0,0],[0,"#008066"], 0, false, [false,10,2,"default"]);
            color(text_color) translate([175, i*45, 0]) 
                text(str(cm[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(cm[1])-1]) {
            color(text_color) translate([ctext_offset, 330, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(cm[1][i], 5,  font = text_font);
        }
    }
    if(Class =="cm_holder") {
        for(i=[0:1:len(cm_holder[0])-1]) {
            cm_holder(cm_holder[0][i], 100, i*45, 0, "top", 0, [0,0,0],["#008066"], 0, false, [false,10,2,"default"]);
            color(text_color) translate([175, i*45, 0]) 
                text(str(cm_holder[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(cm_holder[1])-1]) {
            color(text_color) translate([ctext_offset, 60, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(cm_holder[1][i], 5,  font = text_font);
        }
    }
    if(Class =="db") {
        for(i=[0:1:len(db[0])-1]) {
            db(db[0][i], 100, i*45, 0, "top", 0, [0,0,0],["male"], 0, false, [false,10,2,"default"]);
            db(db[0][i], 140, i*45, 0, "top", 0, [0,0,0],["female"], 0, false, [false,10,2,"default"]);
            color(text_color) translate([170, i*45, 0]) 
                text(str(db[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(db[1])-1]) {
            color(text_color) translate([ctext_offset, 130, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(db[1][i], 5,  font = text_font);
        }
    }
    if(Class =="discrete") {
        for(i=[0:1:len(discrete[0])-1]) {
            if(discrete[0][i] == "ir_1") {
                for(c=[0:2:10]) {
                    discrete(discrete[0][i], 75, c*8, 0, "top", 0, [0,0,c],[0], 0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([65, -12, 0]) text(str(discrete[0][i]), font = text_font, direction="ltr");
            }
            if(discrete[0][i] == "ir_dual") {
                discrete(discrete[0][i], 20, 0, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
                color(text_color) translate([3, -12, 0]) text(str(discrete[0][i]), font = text_font, direction="ltr");
            }
            if(discrete[0][i] == "capacitor") {
                for(c=[0:2:10]) {
                    discrete(discrete[0][i], 160, 5+(c*8), 0, "top", 0, [8,0,4+c],[0], 0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([160, -12, 0]) text(str(discrete[0][i]), font = text_font, direction="ltr");
            }
            if(discrete[0][i] == "led") {
                for(c=[0:2:10]) {
                    discrete(discrete[0][i], 105, 5+(c*8), 0, "top", 0, [5,0,4+c],["default","red"], 
                        0, false, [false,10,2,"default"]);
                    discrete(discrete[0][i], 115, 5+(c*8), 0, "top", 0, [5,0,4+c],["default","green"], 
                        0, false, [false,10,2,"default"]);
                    discrete(discrete[0][i], 125, 5+(c*8), 0, "top", 0, [5,0,4+c],["default","yellow"], 
                        0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([105, -12, 0]) text(str(discrete[0][i]), font = text_font, direction="ltr");
            }
        }
        for(i=[0:1:len(discrete[1])-1]) {
            color(text_color) translate([ctext_offset, 140, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(discrete[1][i], 5,  font = text_font);
        }
    }
    if(Class =="display") {
        for(i=[0:1:len(display[0])-1]) {
            display(display[0][i], 100, i*45, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([160, i*45, 0]) 
                text(str(display[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(display[1])-1]) {
            color(text_color) translate([ctext_offset, 130, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(display[1][i], 5,  font = text_font);
        }
    }
    if(Class =="fan") {
        for(i=[0:1:len(fan[0])-1]) {
            fan(fan[0][i], 80+(i*20), i*20, 0, "top", 0, [6.5,10,4],[5,0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([95+(i*20), i*20, 0]) 
                text(str(fan[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(fan[1])-1]) {
            color(text_color) translate([ctext_offset, 80, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(fan[1][i], 5,  font = text_font);
        }
    }
    if(Class =="fpc") {
        for(i=[0:1:len(fpc[0])-1]) {
            if(fpc[0][i] == "fh19") {
                for(c=[8:4:28]) {
                    fpc(fpc[0][i], 50, c-8, 0, "top", 0, [c,0,0],["smt","side", "#ede1ca","#a47c5b"], 
                            0, false, [false,10,2,"default"]);
                    fpc(fpc[0][i], 75, c-8, 0, "top", 0, [c,0,0],["smt","side", "white", "black"], 
                            0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([50, -12, 0]) text(str(fpc[0][i]), font = text_font, direction="ltr");
            }
            if(fpc[0][i] == "fh12") {
                for(c=[8:4:28]) {
                    fpc(fpc[0][i], 100, (c*2)-16, 0, "top", 0, [c,0,0],["smt","top", "#ede1ca","#a47c5b"], 
                        0, false, [false,10,2,"default"]);
                    fpc(fpc[0][i], 125, (c*2)-16, 0, "top", 0, [c,0,0],["smt","top", "white", "black"], 
                        0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([100, -12, 0]) text(str(fpc[0][i]), font = text_font, direction="ltr");
            }
        }
        for(i=[0:1:len(fpc[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(fpc[1][i], 5,  font = text_font);
        }
    }
    if(Class =="gpio") {
        gpio("open",90,0,0,"top",0,[20,2,6],["thruhole","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        color(text_color) translate([150, 0, 0]) text(str("open 20x2"), font = text_font);
        gpio("open",90,20,0,"top",0,[13,2,6],["smt","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        color(text_color) translate([135, 20, 0]) text(str("open 13x2"), font = text_font);
        gpio("open",90,40,0,"top",0,[10,2,6],["smt","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        color(text_color) translate([130, 40, 0]) text(str("open 10x2"), font = text_font);
        gpio("open",90,60,0,"top",0,[7,2,6],["smt","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        color(text_color) translate([125, 60, 0]) text(str("open 7x2"), font = text_font);
        gpio("encl_header_12",90,80,0,"top",0,[7,2,6],["smt","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        color(text_color) translate([125, 80, 0]) text(str("encl_header_12"), font = text_font);
        gpio("encl_header_30",90,100,0,"top",0,[7,2,6],["smt","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        color(text_color) translate([130, 100, 0]) text(str("encl_header_30"), font = text_font);
        for(i=[0:1:len(gpio[1])-1]) {
            color(text_color) translate([ctext_offset, 140, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(gpio[1][i], 5, font = text_font);
        }
    }
    if(Class =="header") {
        header("open",100,40,0,"top",0,[2,3,6],["smt","black","male",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",110,40,0,"top",0,[3,2,6],["thruhole","black","male",2.54,"silver",0,0,0],0,false,[10,2,"default"]);
        header("open",122,40,0,"top",0,[3,2,6],["smt","black","female",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",132,40,0,"top",0,[1,6,6],["thruhole","black","female",2.54,"#fee5a6",0,0,0],0,false,[10,2,"default"]);

        header("open",92,40,0,"top",0,[2,8,4],["smt","black","male",2,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",85,40,0,"top",0,[2,3,4],["thruhole","black","male",2,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",77,40,0,"top",0,[2,8,4],["smt","black","female",2,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",68,40,0,"top",0,[2,6,6],["thruhole","black","female",2,"silver",0,0,0],0,false,[10,2,"default"]);

        header("open",108,20,0,"top",0,[2,8,3],["smt","black","male",1,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",115,20,0,"top",0,[2,3,3],["thruhole","black","male",1,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        header("open",122,20,0,"top",0,[2,8,4],["smt","black","female",1,"silver",0,0,0],0,false,[10,2,"default"]);
        header("open",132,20,0,"top",0,[2,6,7],["thruhole","black","female",1,"#fee5a6",0,0,0],0,false,[10,2,"default"]);
        for(i=[0:1:len(header[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(header[1][i], 5, font = text_font);
        }
    }
    if(Class =="heatsink") {
        for(i=[0:1:len(heatsink[0])-1]) {
            if(i <= 6) {
                heatsink(heatsink[0][i], 0, i*55, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
                color(text_color) translate([50, i*55, 0]) 
                    text(str(heatsink[0][i]), font = text_font, direction="ltr");
            }
            if(i > 6 && i <= 12) {
                heatsink(heatsink[0][i], 180, (i*50)-320, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
                color(text_color) translate([240, (i*50)-320, 0]) 
                    text(str(heatsink[0][i]), font = text_font, direction="ltr");
            }
            if(i > 12  && i <= 15) {
                heatsink(heatsink[0][i], 320, (i*100)-1300, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
                color(text_color) translate([420, (i*100)-1300, 0]) 
                    text(str(heatsink[0][i]), font = text_font, direction="ltr");
            }
            if(i > 15 && i <= 21) {
                heatsink(heatsink[0][i], 520, (i*85)-1350, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
                color(text_color) translate([605, (i*85)-1350, 0]) 
                    text(str(heatsink[0][i]), font = text_font, direction="ltr");
            }
            if(i > 21) {
                heatsink(heatsink[0][i], 700, (i*50)-1100, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
                color(text_color) translate([790, (i*50)-1100, 0]) 
                    text(str(heatsink[0][i]), font = text_font, direction="ltr");
            }
        }
        for(i=[0:1:len(heatsink[1])-1]) {
            color(text_color) translate([ctext_offset, 410, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(heatsink[1][i], 5, font = text_font);
        }
    }
    if(Class =="ic") {
        for(i=[0:1:len(ic[0])-1]) {
            if(ic[0][i] == "generic") {
                for(c=[4:2:16]) {
                    ic(ic[0][i], (c*8)+30, 10, 0, "top", 0, [c,c,.8],["dimgrey"], 0, false, [false,10,2,"default"]);
                    ic(ic[0][i], (c*4)+70, 30, 0, "top", 0, [7,c,.8],["dimgrey"], 0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([0, -12, 0]) text(str(ic[0][i]), font = text_font, direction="ltr");
            }
        }
        for(i=[0:1:len(ic[1])-1]) {
            color(text_color) translate([ctext_offset, 80, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(ic[1][i], 5, font = text_font);
        }
    }
    if(Class =="jst") {
        translate([100,90,0]) {
        // thruhole side entry
        jst("xh",-15,0,0,"top",0,[3,0,0],["thruhole","side","green"],0,false,[10,2,"default"]);
        jst("ph",-30,0,0,"top",0,[4,0,0],["thruhole","side","white"],0,false,[10,2,"default"]);
        jst("zh",-40,0,0,"top",0,[3,0,0],["thruhole","side","white"],0,false,[10,2,"default"]);
        jst("sh",-50,0,0,"top",0,[3,0,0],["thruhole","side","white"],0,false,[10,2,"default"]);

        // thruhole top entry
        jst("xh",-15,20,0,"top",0,[3,0,0],["thruhole","top","orange"],0,false,[10,2,"default"]);
        jst("ph",-30,20,0,"top",0,[4,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("zh",-40,20,0,"top",0,[3,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("sh",-50,20,0,"top",0,[3,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);

        jst("pa",0,-30,0,"top",0,[7,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("pa",0,-40,0,"top",0,[6,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("pa",0,-50,0,"top",0,[5,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("pa",0,-60,0,"top",0,[4,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("pa",0,-70,0,"top",0,[3,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);
        jst("pa",0,-80,0,"top",0,[2,0,0],["thruhole","top","white"],0,false,[10,2,"default"]);

        // smt side entry
        jst("xh",0,0,0,"top",0,[3,0,0],["smt","side","white"],0,false,[10,2,"default"]);
        jst("ph",15,0,0,"top",0,[4,0,0],["smt","side","white"],0,false,[10,2,"default"]);
        jst("zh",30,0,0,"top",0,[3,0,0],["smt","side","white"],0,false,[10,2,"default"]);
        jst("sh",40,0,0,"top",0,[3,0,0],["smt","side","white"],0,false,[10,2,"default"]);

        // smt top entry
        jst("xh",0,20,0,"top",0,[3,0,0],["smt","top","white"],0,false,[10,2,"default"]);
        jst("ph",15,20,0,"top",0,[4,0,0],["smt","top","white"],0,false,[10,2,"default"]);
        jst("zh",30,20,0,"top",0,[3,0,0],["smt","top","white"],0,false,[10,2,"default"]);
        jst("sh",40,20,0,"top",0,[3,0,0],["smt","top","white"],0,false,[10,2,"default"]);
        }
        for(i=[0:1:len(jst[1])-1]) {
            color(text_color) translate([ctext_offset, 140, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(jst[1][i], 5, font = text_font);
        }
    }
    if(Class =="memory") {
        for(i=[0:1:len(memory[0])-1]) {
            memory(memory[0][i], 80, i*25, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([160, i*25, 0]) 
                text(str(memory[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(memory[1])-1]) {
            color(text_color) translate([ctext_offset, 130, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(memory[1][i], 5, font = text_font);
        }
    }
    if(Class =="molex") {
        for(i=[0:1:len(molex[0])-1]) {
            if(molex[0][i] == "7478") {
                for(c=[3:4:12]) {
                    molex(molex[0][i], 70, (c*4)-6, 0, "top", 0, [c,0,0],["thruhole","top"], 
                            0, false, [false,10,2,"default"]);
                    molex(molex[0][i], 105, (c*4)-6, 0, "top", 0, [c,0,0],["thruhole","side"], 
                            0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([115, i*25, 0]) 
                    text(str(molex[0][i]), font = text_font, direction="ltr");
            }
            if(molex[0][i] == "5046") {
                for(c=[3:4:12]) {
                    molex(molex[0][i], 165, (c*4)-6, 0, "top", 0, [c,0,0],["thruhole","side"], 
                            0, false, [false,10,2,"default"]);
                }
            color(text_color) translate([180, 0, 0]) 
                    text(str(molex[0][i]), font = text_font, direction="ltr");
            }
        }
        for(i=[0:1:len(molex[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(molex[1][i], 5, font = text_font);
        }
    }
    if(Class =="network") {
        for(i=[0:1:len(network[0])-1]) {
            network(network[0][i], i*20, i*40, 0, "top", 0, [0,0,0], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([20+(i*20), i*40, 0]) 
                text(str(network[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(network[1])-1]) {
            color(text_color) translate([ctext_offset, 340, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(network[1][i], 5, font = text_font);
        }
    }
    if(Class =="pcb") {
        for(i=[0:1:len(pcb[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(pcb[1][i], 5, font = text_font);
        }
    }
    if(Class =="pcbadd") {
        for(i=[0:1:len(pcbadd[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(pcbadd[1][i], 5, font = text_font);
        }
    }
    if(Class =="pcbhole") {
        for(i=[0:1:len(pcbhole[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(pcbhole[1][i], 5, font = text_font);
        }
    }
    if(Class =="pcbsoc") {
        for(i=[0:1:len(pcbsoc[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(pcbsoc[1][i], 5, font = text_font);
        }
    }
    if(Class =="pcbsub") {
        for(i=[0:1:len(pcbsub[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(pcbsub[1][i], 5, font = text_font);
        }
    }
    if(Class =="pcbpad") {
        for(i=[0:1:len(pcbpad[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(pcbpad[1][i], 5, font = text_font);
        }
    }
    if(Class =="pcie") {
        pcie("x4", 100, 25, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
        color(text_color) translate([140, 0, 0]) 
            text(str("x1"), font = text_font, direction="ltr");
        pcie("x1", 100, 0, 0, "top", 0, [0,0,0],[0], 0, false, [false,10,2,"default"]);
        color(text_color) translate([145, 25, 0]) 
            text(str("x4"), font = text_font, direction="ltr");
        for(i=[0:1:len(pcie[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(pcie[1][i], 5, font = text_font);
        }
    }
    if(Class =="pillar") {
        for(c=[5:1:12]) {
            pillar("hex", 100, (c*15)-70, 0, "top", 0, [c,3,c],[0,"#fee5a6"], 
                    0, false, [false,10,2,"default"]);
            pillar("round", 135, (c*15)-70, 0, "top", 0, [c,3,c],[0,"white"], 
                    0, false, [false,10,2,"default"]);
        }
        for(i=[0:1:len(pillar[1])-1]) {
            color(text_color) translate([ctext_offset, 160, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(pillar[1][i], 5, font = text_font);
        }
    }
    if(Class =="power") {
        for(i=[0:1:len(power[0])-1]) {
            power(power[0][i], i*20, i*40, 0, "top", 0, [0,0,0], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([20+(i*20), i*40, 0]) text(str(power[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(power[1])-1]) {
            color(text_color) translate([ctext_offset, 290, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(power[1][i], 5, font = text_font);
        }
    }
    if(Class =="smd") {
        for(i=[0:1:len(smd[0])-1]) {
            smd(smd[0][i], 100+(i*20), 10+(i*40), 0, "top", 0, [3,2,1], ["red"], 0, false, [false,10,2,"default"]);
            color(text_color) translate([106+(i*20), 10+(i*40), 0]) 
                text(str(smd[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(smd[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(smd[1][i], 5, font = text_font);
        }
    }
    if(Class =="storage") {
        for(i=[0:1:len(storage[0])-1]) {
            storage(storage[0][i], i*20, i*40, 0, "top", 0, [3,2,1], ["red"], 0, false, [false,10,2,"default"]);
            color(text_color) translate([40+(i*20), i*40, 0]) text(str(storage[0][i]), 
                font = text_font, direction="ltr");
        }
        for(i=[0:1:len(storage[1])-1]) {
            color(text_color) translate([ctext_offset, 350, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(storage[1][i], 5, font = text_font);
        }
    }
    if(Class =="switch") {
        for(i=[0:1:len(switch[0])-1]) {
            switch(switch[0][i], 100+(i*20), 10+(i*40), 0, "top", 0, [3,2,1], ["red"], 0, false, [false,10,2,"default"]);
            color(text_color) translate([120+(i*20), 10+(i*40), 0]) 
                text(str(switch[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(switch[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(switch[1][i], 5, font = text_font);
        }
    }
    if(Class =="terminal") {
        for(i=[0:1:len(terminal[0])-1]) {
            c_color = i == 0 ? "lightgreen" : "dimgray";
            t_height = i == 0 ? 14 : 10;
            for(c=[2:1:8]) {
                terminal(terminal[0][i], 100*(i+1), (c*20)-30, 0, "top", 0, [c,8.3,t_height], [5,c_color,5],
                    0, false, [false,10,2,"default"]);
            }
            color(text_color) translate([95*(i+1), 0, 0]) 
                text(str(terminal[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(terminal[1])-1]) {
            color(text_color) translate([ctext_offset, 190, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(terminal[1][i], 5, font = text_font);
        }
    }
    if(Class =="uart") {
        for(i=[0:1:len(uart[0])-1]) {
            uart(uart[0][i], 80+(i*20), i*40, 0, "top", 0, [0,0,0], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([120+(i*20), i*40, 0]) 
                text(str(uart[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(uart[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(uart[1][i], 5, font = text_font);
        }
    }
    if(Class =="usb2") {
        for(i=[0:1:len(usb2[0])-1]) {
            usb2(usb2[0][i], i*20, i*40, 0, "top", 0, [10,10,10], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([20+(i*20), i*40, 0]) 
            text(str(usb2[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(usb2[1])-1]) {
            color(text_color) translate([ctext_offset, 230, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(usb2[1][i], 5, font = text_font);
        }
    }
    if(Class =="usb3") {
        for(i=[0:1:len(usb3[0])-1]) {
            usb3(usb3[0][i], i*20, i*40, 0, "top", 0, [10,10,10], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([20+(i*20), i*40, 0]) 
                text(str(usb3[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(usb3[1])-1]) {
            color(text_color) translate([ctext_offset, 220, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(usb3[1][i], 5, font = text_font);
        }
    }
    if(Class =="usbc") {
        for(i=[0:1:len(usbc[0])-1]) {
            usbc(usbc[0][i], 60+(i*20), i*40, 0, "top", 0, [0,0,0], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([80+(i*20), i*40, 0]) 
                text(str(usbc[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(usbc[1])-1]) {
            color(text_color) translate([ctext_offset, 110, ctext_height-i*7]) rotate([90, 0, 0]) 
                text(usbc[1][i], 5, font = text_font);
        }
    }
    if(Class =="video") {
        for(i=[0:1:len(video[0])-1]) {
            video(video[0][i], i*20, i*40, 0, "top", 0, [0,0,0], [0], 0, false, [false,10,2,"default"]);
            color(text_color) translate([20+(i*20), i*40, 0]) 
                text(str(video[0][i]), font = text_font, direction="ltr");
        }
        for(i=[0:1:len(video[1])-1]) {
            color(text_color) translate([ctext_offset, 240, ctext_height-i*7]) rotate([90, 0, 0]) text(video[1][i], 5, font = text_font);
        }
    }
}

// display all models
if(view == "All Devices") {
    translate ([-825,0,0]) sbc("m2");
    linear_extrude(height = 2) {translate([-820,-20,0]) text("Odroid-M2");}
    color("green",.5) translate([-815,-20,-1]) cube([65,10,1]);

    translate ([-825,115,12]) sbc("m1s");
    linear_extrude(height = 2) {translate([-820,100,0]) text("Odroid-M1s");}
    color("green",.5) translate([-815,100,-1]) cube([65,10,1]);

    translate ([-825,215,12]) sbc("m1");
    linear_extrude(height = 2) {translate([-815,200,0]) text("Odroid-M1");}
    color("green",.5) translate([-815,200,-1]) cube([65,10,1]);

    translate ([-710,0,0]) sbc("hc4");
    linear_extrude(height = 2) {translate([-710,-20,0]) text("Odroid-HC4");}
    color("green",.5) translate([-710,-20,-1]) cube([72,10,1]);

    translate ([-580,0,0]) sbc("c5");
    linear_extrude(height = 2) {translate([-580,-20,0]) text("Odroid-C5");}
    color("green",.6) translate([-580,-20,-1]) cube([63,10,1]);

    translate ([-580,100,0]) sbc("c4");
    linear_extrude(height = 2) {translate([-580,80,0]) text("Odroid-C4");}
    color("green",.6) translate([-580,80,-1]) cube([63,10,1]);

    translate ([-580,200,0]) sbc("c2");
    linear_extrude(height = 2) {translate([-580,180,0]) text("Odroid-C2");}
    color("green",.5) translate([-580,180,-1]) cube([63,10,1]);

    translate ([-580,300,0]) sbc("c1+");
    linear_extrude(height = 2) {translate([-580,280,0]) text("Odroid-C1+");}
    color("green",.5) translate([-580,280,-1]) cube([70,10,1]);

    translate ([-460,0,0]) sbc("xu4");
    linear_extrude(height = 2) {translate([-460,-20,0]) text("Odroid-XU4");}
    color("green",.5) translate([-460,-20,-1]) cube([72,10,1]);

    translate ([-460,100,0]) sbc("xu4q");
    linear_extrude(height = 2) {translate([-460,80,0]) text("Odroid-XU4Q");}
    color("green",.6) translate([-460,80,-1]) cube([82,10,1]);

    translate ([-460,200,0]) sbc("hc1");
    linear_extrude(height = 2) {translate([-460,180,0]) text("Odroid-HC1/HC2");}
    color("green",.5) translate([-460,180,-1]) cube([103,10,1]);

    translate ([-460,290,0]) sbc("mc1");
    linear_extrude(height = 2) {translate([-460,270,0]) text("Odroid-MC1");}
    color("green",.5) translate([-460,270,-1]) cube([74,10,1]);

    translate ([-460,370,0]) sbc("show2");
    linear_extrude(height = 2) {translate([-460,350,0]) text("Show2");}
    color("orange",.5) translate([-460,350,-1]) cube([41,10,1]);

    translate ([-340,0,12]) sbc("n2+");
    linear_extrude(height = 2) {translate([-340,-20,0]) text("Odroid-N2+");}
    color("green",.5) translate([-340,-20,-1]) cube([71,10,1]);

    translate ([-340,135,0]) sbc("n2l");
    linear_extrude(height = 2) {translate([-340,120,0]) text("Odroid-N2L");}
    color("green",.5) translate([-340,120,-1]) cube([70,10,1]);

    translate ([-340,225,0]) sbc("n2lq");
    linear_extrude(height = 2) {translate([-340,210,0]) text("Odroid-N2LQ");}
    color("green",.5) translate([-340,210,-1]) cube([80,10,1]);

    translate ([-340,315,18]) sbc("n2");
    linear_extrude(height = 2) {translate([-340,305,0]) text("Odroid-N2");}
    color("green",.5) translate([-340,305,-1]) cube([63,10,1]);

    translate ([-340,470,0]) sbc("n1");
    linear_extrude(height = 2) {translate([-340,450,0]) text("Odroid-N1");}
    color("green",.5) translate([-340,450,-1]) cube([63,10,1]);

    translate ([-220,0,0]) sbc("h4_ultra");
    linear_extrude(height = 2) {translate([-220,-20,0]) text("Odroid-H4_Ultra/H3+");}
    color("yellow",.5) translate([-220,-20,-1]) cube([130,10,1]);

    translate ([-220,150,0]) sbc("h4");
    linear_extrude(height = 2) {translate([-220,135,0]) text("Odroid-H4");}
    color("yellow",.5) translate([-220,135,-1]) cube([84,10,1]);

    translate ([-220,300,0]) sbc("h3");
    linear_extrude(height = 2) {translate([-220,280,0]) text("Odroid-H3/H3+");}
    color("green",.5) translate([-220,280,-1]) cube([84,10,1]);

    translate ([-220,450,0]) sbc("h2");
    linear_extrude(height = 2) {translate([-220,430,0]) text("Odroid-H2/H2+");}
    color("green",.5) translate([-220,430,-1]) cube([84,10,1]);

    translate ([-80,-202,0]) sbc("soedge_rk1808");
    linear_extrude(height = 2) {translate([-75,-222,0]) text("SoEdge RK1808");}
    color("green",.3) translate([-75,-222,-1]) cube([100,10,1]);

    translate ([-80,-125,0]) sbc("soedge_a-baseboard");
    linear_extrude(height = 2) {translate([-75,-145,0]) text("SoEdge A Baseboard");}
    color("green",.3) translate([-75,-145,-1]) cube([130,10,1]);

    translate ([-80,0,0]) sbc("rockpro64");
    linear_extrude(height = 2) {translate([-60,-20,0]) text("RockPro 64");}
    color("green",.3) translate([-60,-20,-1]) cube([71,10,1]);

    translate ([-80,115,0]) sbc("rock64");
    linear_extrude(height = 2) {translate([-60,95,0]) text("Rock 64");}
    color("green",.3) translate([-60,95,-1]) cube([50,10,1]);

    translate ([-80,202,0]) sbc("quartz64a");
    linear_extrude(height = 2) {translate([-75,187,0]) text("Quartz 64 A");}
    color("green",.3) translate([-75,187,-1]) cube([72,10,1]);

    translate ([-80,320,0]) sbc("quartz64b");
    linear_extrude(height = 2) {translate([-75,300,0]) text("Quartz 64 B");}
    color("green",.3) translate([-80,300,-1]) cube([72,10,1]);

    translate ([-80,410,0]) sbc("h64b");
    linear_extrude(height = 2) {translate([-60,390,0]) text("H64 B");}
    color("yellow",.3) translate([-60,390,-1]) cube([38,10,1]);

    translate ([-80,500,0]) sbc("star64");
    linear_extrude(height = 2) {translate([-60,485,0]) text("Star 64");}
    color("green",.3) translate([-60,485,-1]) cube([43,10,1]);

    translate ([-80,610,0]) sbc("a64");
    linear_extrude(height = 2) {translate([-60,595,0]) text("A64");}
    color("green",.3) translate([-60,595,-1]) cube([33,10,1]);

    translate ([-80,715,0]) sbc("a64lts");
    linear_extrude(height = 2) {translate([-60,700,0]) text("A64-LTS");}
    color("green",.3) translate([-60,700,-1]) cube([43,10,1]);

    translate([90,-90,0]) sbc("rpicm4");
    linear_extrude(height = 2) { translate([90,-110,0]) text("RPi CM4"); }
    color("green",.3) translate([90,-110,-1]) cube([55,10,1]);

    translate([90,-170,0]) sbc("rpicm4l");
    linear_extrude(height = 2) { translate([90,-190,0]) text("RPi CM4L"); }
    color("green",.3) translate([90,-190,-1]) cube([63,10,1]);

    translate([90,-240,0]) sbc("rpicm3");
    linear_extrude(height = 2) { translate([90,-260,0]) text("RPi CM3"); }
    color("yellow",.3) translate([90,-260,-1]) cube([55,10,1]);

    translate([90,-300,0]) sbc("rpipico");
    linear_extrude(height = 2) { translate([90,-320,0]) text("RPi Pico"); }
    color("green",.3) translate([90,-320,-1]) cube([52,10,1]);

    translate([90,-360,0]) sbc("rpipicow");
    linear_extrude(height = 2) { translate([90,-380,0]) text("RPi Pico W"); }
    color("green",.3) translate([90,-380,-1]) cube([70,10,1]);

    translate([75,0,0]) sbc("rpi5");
    linear_extrude(height = 2) { translate([90,-20,0]) text("RPi 5"); }
    color("green",.3) translate([90,-20,-1]) cube([35,10,1]);

    translate([75,90,0]) sbc("rpi4b");
    linear_extrude(height = 2) { translate([90,70,0]) text("RPi 4B"); }
    color("yellow",.3) translate([90,70,-1]) cube([42,10,1]);

    translate([75,180,0]) sbc("rpi3b+");
    linear_extrude(height = 2) { translate([75,160,0]) text("RPi 3B+"); }
    color("green",.3) translate([75,160,-1]) cube([50,10,1]);

    translate([75, 270, 0]) sbc("rpi3b");
    linear_extrude(height = 2) { translate([75,250,0]) text("RPi 3B"); }
    color("yellow",.3) translate([75,250,-1]) cube([42,10,1]);

    translate([75, 360, 0]) sbc("rpi3a+");
    linear_extrude(height = 2) { translate([75,340,0]) text("RPi 3A+"); }
    color("yellow",.3) translate([75,340,-1]) cube([50,10,1]);

    translate([75, 450, 0]) sbc("rpi1b+");
    linear_extrude(height = 2) { translate([75,430,0]) text("RPi 1B+"); }
    color("yellow",.3) translate([75,430,-1]) cube([50,10,1]);

    translate([75, 540, 0]) sbc("rpi1a+");
    linear_extrude(height = 2) { translate([75,520,0]) text("RPi 1A+"); }
    color("yellow",.3) translate([75,520,-1]) cube([50,10,1]);

    translate([75,620,0]) sbc("rpizero2w");
    linear_extrude(height = 2) { translate([75,605,0]) text("RPi Zero2 W"); }
    color("yellow",.3) translate([75,605,-1]) cube([78,10,1]);

    translate([75,680,0]) sbc("rpizero");
    linear_extrude(height = 2) { translate([75,662,0]) text("RPi Zero"); }
    color("yellow",.3) translate([75,662,-1]) cube([53,10,1]);

    translate([75,760,0]) sbc("rpicm4+ioboard");
    linear_extrude(height = 2) { translate([75,732,0]) text("RPi CM4 IO Board"); }
    color("yellow",.3) translate([75,732,-1]) cube([103,10,1]);

    translate([190,700,0]) sbc("rock4b+");
    linear_extrude(height = 2) { translate([190,680,0]) text("ROCK 4A/B+"); }
    color("yellow",.3) translate([190,680,-1]) cube([82,10,1]);

    translate([190,605,0]) sbc("rock4c");
    linear_extrude(height = 2) { translate([190,585,0]) text("ROCK 4C"); }
    color("yellow",.3) translate([190,585,-1]) cube([63,10,1]);

    translate([190,517,0]) sbc("rock4c+");
    linear_extrude(height = 2) { translate([195,505,0]) text("ROCK 4C+"); }
    color("yellow",.3) translate([195,505,-1]) cube([70,10,1]);

    translate([190,415,0]) sbc("rock5b-v1.3");
    linear_extrude(height = 2) { translate([195,400,0]) text("ROCK 5B v1.3"); }
    color("yellow",.3) translate([195,400,-1]) cube([95,10,1]);

    translate([190,315,0]) sbc("rock5bq");
    linear_extrude(height = 2) { translate([195,292,0]) text("ROCK 5BQ v1.42"); }
    color("green",.3) translate([195,292,-1]) cube([102,10,1]);

    translate([190,210,0]) sbc("rock5b");
    linear_extrude(height = 2) { translate([195,190,0]) text("ROCK 5B v1.42"); }
    color("green",.3) translate([195,190,-1]) cube([95,10,1]);

    translate([190,105,0]) sbc("rock5b+");
    linear_extrude(height = 2) { translate([195,83,0]) text("ROCK 5B+"); }
    color("yellow",.3) translate([195,83,-1]) cube([70,10,1]);

    translate([190,0,0]) sbc("nio12l");
    linear_extrude(height = 2) { translate([195,-20,0]) text("NIO 12L"); }
    color("green",.3) translate([195,-20,-1]) cube([55,10,1]);

    translate([335,0,0]) sbc("vim4");
    linear_extrude(height = 2) { translate([335,-20,0]) text("Vim4"); }
    color("green",.3) translate([335,-20,-1]) cube([32,10,1]);

    translate([335,90,0]) sbc("vim3");
    linear_extrude(height = 2) { translate([335,70,0]) text("Vim3"); }
    color("green",.3) translate([335,70,-1]) cube([32,10,1]);

    translate([335,185,0]) sbc("vim3l");
    linear_extrude(height = 2) { translate([335,165,0]) text("Vim3L"); }
    color("green",.3) translate([335,165,-1]) cube([39,10,1]);

    translate([335,270,0]) sbc("vim2");
    linear_extrude(height = 2) { translate([335,250,0]) text("Vim2"); }
    color("green",.3) translate([335,250,-1]) cube([32,10,1]);

    translate([335,360,0]) sbc("vim1");
    linear_extrude(height = 2) { translate([335,340,0]) text("Vim1"); }
    color("green",.3) translate([335,340,-1]) cube([32,10,1]);

    translate([445,0,0]) sbc("tinkerboard-r2");
    linear_extrude(height = 2) { translate([445,-20,0]) text("Tinkerboard"); }
    color("yellow",.3) translate([445,-20,-1]) cube([72,10,1]);

    linear_extrude(height = 2) { translate([445,-35,0]) text("R2/R2S"); }
    color("yellow",.3) translate([445,-35,-1]) cube([48,10,1]);

    translate([445,90,0]) sbc("tinkerboard-2");
    linear_extrude(height = 2) { translate([445,70,0]) text("Tinkerboard 2/2S"); }
    color("yellow",.3) translate([445,70,-1]) cube([104,10,1]);

    translate([445,185,0]) sbc("tinkerboard-s");
    linear_extrude(height = 2) { translate([445,165,0]) text("Tinkerboard S"); }
    color("yellow",.3) translate([445,165,-1]) cube([85,10,1]);

    translate([445,275,0]) sbc("tinkerboard");
    linear_extrude(height = 2) { translate([445,255,0]) text("Tinkerboard"); }
    color("yellow",.3) translate([445,255,-1]) cube([72,10,1]);

    translate([565,0,0]) sbc("opi5");
    linear_extrude(height = 2) { translate([565,-20,0]) text("OrangePi 5"); }
    color("green",.3) translate([565,-20,-1]) cube([70,10,1]);

    translate([565,90,0]) sbc("opizero");
    linear_extrude(height = 2) { translate([565,73,0]) text("Zero/ZeroPlus"); }
    color("yellow",.3) translate([565,73,-1]) cube([86,10,1]);

    translate([565,185,0]) sbc("opizero2");
    linear_extrude(height = 2) { translate([565,165,0]) text("OPi Zero2"); }
    color("yellow",.3) translate([565,165,-1]) cube([63,10,1]);

    translate([565,275,0]) sbc("opir1plus_lts");
    linear_extrude(height = 2) { translate([565,255,0]) text("OPi R1 Plus LTS"); }
    color("yellow",.3) translate([565,255,-1]) cube([102,10,1]);

    translate([565,375,0]) sbc("opir1");
    linear_extrude(height = 2) { translate([565,350,0]) text("OPi R1"); }
    color("green",.3) translate([565,350,-1]) cube([45,10,1]);

    translate([565,460,0]) sbc("opi5max");
    linear_extrude(height = 2) { translate([565,440,0]) text("OrangePi 5 Max"); }
    color("green",.3) translate([565,440,-1]) cube([95,10,1]);

    translate([565,560,0]) sbc("opi3b-v2.1");
    linear_extrude(height = 2) { translate([565,540,0]) text("OrangePi 3B v2.1"); }
    color("orange",.3) translate([565,540,-1]) cube([95,10,1]);

    translate ([680,0,0]) sbc("alta");
    linear_extrude(height = 2) {translate([680,-20,0]) text("Alta");}
    color("yellow",.5) translate([680,-20,-1]) cube([24,10,1]);

    translate ([680,90,0]) sbc("solitude");
    linear_extrude(height = 2) {translate([680,70,0]) text("Solitude");}
    color("yellow",.5) translate([1150,70,-1]) cube([50,10,1]);

    translate ([680,185,0]) sbc("sweetpotato");
    linear_extrude(height = 2) {translate([680,165,0]) text("Sweet Potato");}
    color("yellow",.5) translate([680,165,-1]) cube([80,10,1]);

    translate ([680,275,0]) sbc("lepotato");
    linear_extrude(height = 2) {translate([680,255,0]) text("Le Potato");}
    color("yellow",.5) translate([680,255,-1]) cube([57,10,1]);

    translate ([680,360,0]) sbc("tritium-h5");
    linear_extrude(height = 2) {translate([680,340,0]) text("Tritium H5");}
    color("yellow",.5) translate([680,340,-1]) cube([64,10,1]);

    translate ([680,450,0]) sbc("tritium-h3");
    linear_extrude(height = 2) {translate([680,430,0]) text("Tritium H3");}
    color("yellow",.5) translate([680,430,-1]) cube([64,10,1]);

    translate ([680,550,0]) sbc("tritium-h2+");
    linear_extrude(height = 2) {translate([680,530,0]) text("Tritium H2+");}
    color("yellow",.5) translate([680,530,-1]) cube([72,10,1]);

    translate ([790,0,0]) sbc("jetsonnano");
    linear_extrude(height = 2) {translate([780,-20,0]) text("Jetson Nano");}
    color("green",.5) translate([780,-20,-1]) cube([76,10,1]);

    translate ([920,0,0]) sbc("licheerv+dock");
    linear_extrude(height = 2) {translate([900,-20,0]) text("LicheeRV + Dock");}
    color("green",.5) translate([900,-20,-1]) cube([105,10,1]);

    translate ([1010,0,0]) sbc("visionfive2");
    linear_extrude(height = 2) {translate([1020,-20,0]) text("VisionFive2");}
    color("green",.5) translate([1022,-20,-1]) cube([73,10,1]);

    translate ([1125,0,0]) sbc("atomicpi");
    linear_extrude(height = 2) {translate([1160,-20,0]) text("AtomicPi");}
    color("green",.5) translate([1162,-20,-1]) cube([56,10,1]);

    translate ([1290,0,0]) sbc("bpif3");
    linear_extrude(height = 2) {translate([1340,-20,0]) text("BPiF3");}
    color("yellow",.5) translate([1340,-20,-1]) cube([36,10,1]);

    translate ([1460,0,0]) sbc("milk-v_duos");
    linear_extrude(height = 2) {translate([1450,-20,0]) text("Milk-V Duo S");}
    color("green",.5) translate([1450,-20,-1]) cube([78,10,1]);

    translate ([200,-160,0]) sbc("rak19007");
    linear_extrude(height = 2) {translate([200,-180,0]) text("WiseBlock");}
    color("green",.5) translate([208,-180,-1]) cube([55,10,1]);
    linear_extrude(height = 2) {translate([215,-195,0]) text("19007");}
    color("green",.5) translate([215,-195,-1]) cube([40,10,1]);
    
    translate ([280,-160,0]) sbc("cnano-avr128da48");
    linear_extrude(height = 2) {translate([300,-180,0]) text("Cnano");}
    color("green",.5) translate([300,-180,-1]) cube([43,10,1]);
    linear_extrude(height = 2) {translate([280,-195,0]) text("AVR128DA48");}
    color("green",.5) translate([280,-195,-1]) cube([85,10,1]);

    translate ([390,-160,0]) sbc("nodemcu-32s");
    linear_extrude(height = 2) {translate([375,-180,0]) text("nodemcu-32s");}
    color("green",.5) translate([375,-180,-1]) cube([85,10,1]);

    translate ([470,-160,0]) sbc("cs-solarmeter");
    linear_extrude(height = 2) {translate([470,-180,0]) text("cs-solarmeter");}
    color("green",.5) translate([470,-180,-1]) cube([85,10,1]);

    translate ([590,-160,0]) sbc("feather-m0_express");
    linear_extrude(height = 2) {translate([570,-180,0]) text("feather-m0_express");}
    color("green",.5) translate([570,-180,-1]) cube([85,10,1]);

    translate ([590,-220,0]) sbc("feather-m0_wifi");
    linear_extrude(height = 2) {translate([570,-230,0]) text("feather-m0_wifi");}
    color("green",.5) translate([570,-230,-1]) cube([85,10,1]);

    translate ([590,-270,0]) sbc("feather-m4_express");
    linear_extrude(height = 2) {translate([570,-290,0]) text("feather-m4_express");}
    color("green",.5) translate([570,-290,-1]) cube([85,10,1]);

}