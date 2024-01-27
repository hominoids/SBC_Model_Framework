# SBC Model Framework


## Introduction

This project is a lightweight and dynamic framework for the generation of SBC and micro-controller models written in OpenSCAD.

![Image](sbc.png)

###    Total Devices: 81
###              SBC: 69
###   Carrier Boards:  3
###  Compute Modules:  8
### Micro Controllers: 1

## Using the Framework

Any of the models can be called by passing the requested SBC model in the form of sbc("model"). 
```
include <sbc_models.scad>
sbc("rpi5");
```
```
          USAGE: sbc(model, enableheatsink = "default", fansize = 0, enablegpio =  "default", enablemask = false)

                     model = "c1+","c2","c4","xu4","xu4q","mc1","hc1","hc4","n1","n2","n2+","n2l","n2lq",
                             "m1","m1s","h2","h2+","h3","h3+","show2",
                             "rpizero","rpizero2w","rpi1a+","rpi1b+","rpi3a+","rpi3b","rpi3b+","rpi4b","rpi5",
                             "rpicm1","rpicm3","rpicm3l","rpicm3+","rpicm4","rpicm4l","rpicm1","rpicm4+ioboard",
                             "rock64","rockpro64","quartz64a","quartz64b","h64b","star64",
                             "rock4a","rock4a+","rock4b","rock4b+","rock4c","rock4c+","rock5b-v1.3","rock5b",
                             "vim1","vim2","vim3l","vim3","vim4",
                             "tinkerboard","tinkerboard-s","tinkerboard-2","tinkerboard-2s","tinkerboard-r2","tinkerboard-r2s",
                             "opi5","opizero","opizero2","opir1plus_lts","opir1",
                             "lepotato","sweetpotate","tirtium-h2+","tritium-h3","tritium-h5","solitude","alta"
                             "jetsonnano",
                             "licheerv+dock",
                             "visionfive2",
                             "atomicpi"
            enableheatsink = "disable", "off", "default", "none", "open", "fan_open", "fan_1", "fan_2", "fan_hex", 
                             "vent", "vent_hex_5mm", "vent_hex_8mm", "custom"
                   fansize = 0, 30, 40, 50, 60, 70, 80, 92
                enablegpio = "disable", "off", "default", "none", "open", "block", "knockout", "vent" 
                enableuart = "default", "none", "open", "knockout"
                enablemask = true or false
```
## Modifying and Adding Components
The framework is setup so that both SBC and components can be easily added or modified and the resulting models can be used regardless of the state of completion. The framework consists of three parts, the SBC data set (sbc_models.cfg), the main module(sbc_models.scad) and a library of components(sbc_library.scad).

sbc_models.cfg is an ASCII file that can be modified with any text editor. It contains a data for the description of a given SBC.

Version 2:
class, type, pcbid, loc_x, loc_y, loc_z, face, [rotation], [size_x, size_y, size_z], [data_1, data_2...], [mask]

The schema is as follows:
```

                                     r                                      s
                                     o                                      e
                 p                   t     s s s   d d d d d d d d        l t    m
   c             c  l  l  l          a     i i i   a a a a a a a a        e      s
   l       t     b  o  o  o   f      t     z z z   t t t t t t t t    m   n b    t
   a       y        c  c  c   a      i     e e e   a a a a a a a a    a   g a    y
   s       p     i            c      o                                s   t c    l
   s,      e,    d  x, y, z,  e,     n,    x,y,z,  1,2,3,4,5,6,7,8    k   h k    e

"video","hdmi_a",0,10,-1, 0,"top",[0,0,0],[4,6,9],[2,0,0,0,0,0,0,0],[true,8,2,"default"]

```

Part of the schema has a fixed length and includes the SBC model, PCB xyz size, corner radius, top and bottom maximum component heights, up to 10 thru holes and up to 4 SOC. This part of the schema is the same length for all SBC definitions. The number of component entries is unlimited in quantity and I'll discuss that in a minute. I believe the basic PCB data is self explanatory. The physical dimensions(xyz) must be known in order to create it. The top and bottom maximum component Z height can be useful for designs using this library. PCB holes are limited to 10 defined by their xy center location and diameter. The number can be easily expanded if this becomes restrictive.

I choose to accommodate multiple SOC and not include them as a component for a couple of reasons. There are already SBC's that are specialized and include multiple processing units. I refer to them all in this framework as SOC but they could also be micro-controllers, neural-net processors, or dedicated communication processors on the PCB, to name a few. By defining them separately from components, additional information such as size and height can be included without burdening every component entry with this additional information. Four entries should be sufficient but it too can be easily expanded in the future without significant modification of the program. SOC entries can be rotated and also be placed on either side of the PCB. If a hole or SOC is not needed leave scalar values as zero and text entries empty.

The last entry in the schema is for components. A component is anything that is attached to the PCB. Any number of components from the library can be placed per SBC. The algorithm will automatically place as many or as few as defined. There are six values per component. The xy component location for the top of the PCB are measured from the lower left corner of PCB to the lower left corner of component or opening, with holes measured to the center. Bottom side components are measured from top left corner to top left corner of component when the PCB is rotated around the x axis. All measurements are in mm and as a general rule PCB orientation is with long side of the PCB along the x axis.

The rotation value does not rotate the component around the xy location. It is a reference to the direction that the component faces and whichever corner of the component is in the lower left after rotation, will assume the xy location specified for the component entry. This allows a uniform means to measure the placement of components regardless of their orientation on the PCB. The schema entry labeled component_side is the side of the PCB the component is to be placed on. So far we covered component_x, component_y, component_rotation and component_side. The last two entries are component_class and component_type. These entries together determine what component is placed. Each component class contains one or more component types. There are currently 34 component classes with corresponding component types.

## Component classes and types:
    
```
        antenna  - "ipex"
     *  audio    - "out-in-spdif", "jack_3.5", "audio_micro", "mic_round"
        b2b      - "df40"(parametric)
        battery  - "bat_hold_1", "rtc_micro"
     *  button   - "momentary_6x6x9", "momentary_6x6x4", "momentary_6x6x4_90", "momentary_4x2x1_90",
                   "momentary_4x2x1", "momentary_7x3x3_90", "momentary_4.5x3.5x2.5_90"
        cm       - "cm1","cm3","cm3l","cm4","cm4l","jetsonnano"
     *  discrete - "ir_1", "ir_dual", "capacitor"(parametric), "led"(parametric)
     *  display  - "lcd_2.2"
        fan      - "fan_micro","encl_pmw","encl_pmw_h"
     *  fpc      - "fh19"(parametric), "fh12"(parametric)
     *  gpio     - "encl_header_12", "encl_header_30", "header_40", "header_26", "header_20"
        header   - "open"(parametric)
     *  heatsink - "40mm_active_10", "40mm_passive_10", "40mm_passive_25", "32mm_passive_10",
                   "c1+_oem", "c2_oem", "c4_oem", "hc4_oem", "xu4_oem", "xu4q_oem", "n1_oem", "n2l_oem", "n2lq_oem"
                   "n2_oem", "n2+_oem", "m1_oem", "m1s_oem", "h2_oem", "h3_oem",
                   "atomicpi", "khadas_oem", "khadas_fan_oem", "radxa_oem", "rpi5_oem", "stub"
                   "pine64_active_10", "pine64_passive_20", "pine64_passive_30"
        ic       - "generic"(parametric)
        jst      - "xh", "ph", "zh", "sh", "pa" (all parametric)
     *  memory   - "emmc", "emmc_plug", "sodimm_5.2", "sodimm_9.2"
        molex    - "7478"(parametric)
     *  network  - "rj45_single", "rj45_single_short", "rj45_reverse_single", "rj45_low_profile1",
                   "rj45_low_profile2", "rj45_double_stacked", "rj45-usb2_double", "rj45-usb3_double"
        pcb      - "round", "slot", "rectangle", "polygon", "dxf", "cm1", "cm3", "cm4"
        pcbhole  - "round"
        pcbadd   - "round", "slot", "rectangle", "polygon", "dxf"
        pcbsub   - "round", "slot", "rectangle", "polygon", "dxf"
        pcbsoc   - "flat"(parametric), "raised"(parametric), "mid-raised", "rk3399", "rk3588"
        pcie     - "x1","x4"
        pillar   - "hex"(parametric), "round"(parametric)
     *  power    - "pwr2.5_5x7.5", "pwr5.5_7.5x11.5", "pwr5.5_10x10", "pwr5.5_9.5x7", "pj-202ah", "molex_4x1", "small_encl_satapwr"
        smd      - "led"(parametric)
     *  storage  - "microsdcard", "microsdcard2", "microsdcard3", "microsdcard3_i", "sata_header",
                   "sata_power_vrec", "sata_encl_power", "m.2_header", "m.2_stud"
     *  switch   - "slide_4x9"
     *  terminal - "gtb"(parametric)
     *  uart     - ""molex_5267", "molex_5268" 
     *  usb2     - "micro", "single_horizontal_a", "single_vertical_a", "double_stacked_a"
     *  usb3     - "single_horizontal_a", "single_vertical_a", "double_stacked_a", "double_stacked_usb3-usbc","double_stacked_usb3-usb2"
     *  usbc     - "single_horizontal", "single_vertical"
     *  video    - "hdmi_a", "hdmi_a_vertical", "dp-hdmi_a", "hdmi_micro", "hdmi_mini"
                   "dp_mini", "mipi_csi", "mipi_dsi"
```
Simply put, new SBC are defined in sbc_model.cfg and new components are added to sbc component libraries. To add an SBC, modify sbc_models.cfg by creating or copying of an existing SBC entry. Update the relative SBC data and components for the new SBC. When a component type needs to be added, simply add code that draws that component type in the class module the component belongs to, located in sbc_library.scad. There is no checking or validation of any kind so in reality any class can contain any component type. The names are simply the ones I choose to impose some structure that makes sense for my use of the library moving forward.

## Accuracy
In the past there was been no way of validating whether a SBC Model Framework model and it’s components were dimensionaly accurate in their size and placement other then trial and error. SBC Case Builder provides a much needed model validation tool to assure model accuracy thru the use of test cases. It works on the very simple premise that if the real SBC fits the test case then the virtual model is accurate or otherwise shows were corrections are needed. This will further increased the overall accuracy of models.

Some SBC in SBC Model Framework have not been validated or are missing component data and may produce one or more aspects of a case incorrectly. SBC status is noted in sbc.png, README.md and at the beginning of the SBC entry defined in sbc_models.cfg, all a part of SBC Model Framework. The color coded indicator of an SBC’s verification and completion as indicated in sbc.png is as follows:

GREEN = verified and complete
YELLOW = unverified, most likely usable and/or missing minor information
ORANGE = unverified, may be usable but missing component data
RED = unverified, not usable due to incomplete component data

The SBC that I do not own have been created using manufacturer supplied mechanical drawings and 3D models when available. Some of the drawings are missing information or have errors that effect all or part of the drawings and subsequent SBC models. If you own an SBC that is not represented or verified in SBC Model Framework, please consider adding it or helping to verify existing SBC data. An SBC can be verified to be accurate if a printed shell case from SBC Case Builder fits. Any misalignment is corrected in the SBC Model Framework model data(sbc_models.cfg).  PR's or other means of communication with corrections are much appreciated and needed to work towards 100% SBC model verification.  Please contribute if you can.  Got a dead SBC, contribute it so I can check and verify it's model with a SBC Case Builder test case.
```
GREEN = verified to be correct using SBC Case Builder.
YELLOW = unverified, mostlikely usable and/or missing minor information.
ORANGE = unverified, may be usable but missing component data.
RED = unverified, not usable due to incomplete component data.
```

### Hardkernel Odroid: 20

c1+, c2, c4, xu4, xu4q, mc1, hc1, hc4, m1, m1_noheatsink, m1s, n1, n2, n2+, n2+_noheatsink, n2l, n2q, h2/h2+, h3/h3+ - GREEN, verified.

show2 - ORANGE, unverified, unknown status.



### Nividia: 1

jetsonnano - GREEN, verified.



### Pine64: 6

All created from mechanical drawings except rockpro64 which was contributed. The SOC data is missing for many of these SBC.

rock64 - YELLOW, unverified mostlikely usable and/or missing minor information.

rockpro64 - YELLOW, unverified mostlikely usable and/or missing minor information.

quartz64a - YELLOW, unverified mostlikely usable and/or missing minor information.

quartz64b - YELLOW, unverified mostlikely usable and/or missing minor information.

h64b - YELLOW, unverified mostlikely usable and/or missing minor information.

star64 - yellow, unverified mostlikely usable and/or missing minor information.

a64 - red, unverified, not usable due to incomplete component data.


### Raspberry Pi: 11

All created from mechanical drawings and or 3D models except rpi3b+ which was contributed. The SOC data is missing for these SBC.

rpicm4+ioboard - YELLOW, unverified mostlikely usable and/or missing minor information.

rpicm4,rpicm4l,rpicm3+,rpicm3,cm3l,cm1 - YELLOW, unverified mostlikely usable and/or missing minor information.

rpizero/rpizerow - YELLOW, unverified mostlikely usable and/or missing minor information.

rpizero2w - YELLOW, unverified mostlikely usable and/or missing minor information.

rpi1a+ - YELLOW, unverified mostlikely usable and/or missing minor information.

rpi1b+ - YELLOW, unverified mostlikely usable and/or missing minor information.

rpi3a+ - YELLOW, unverified mostlikely usable and/or missing minor information.

rpi3b - YELLOW, unverified mostlikely usable and/or missing minor information.

rpi3b+ - YELLOW, unverified mostlikely usable and/or missing minor information.

rpi4b - YELLOW, unverified mostlikely usable and/or missing minor information.

rpi5 - rpi5_noheatsink - green, verified.



### Radxa: 5

Created from mechanical drawings, the SOC data is missing for these SBC.

rock4a - YELLOW, unverified mostlikely usable and/or missing minor information.

rock4b - YELLOW, unverified mostlikely usable and/or missing minor information.

rock4a+ - YELLOW, unverified mostlikely usable and/or missing minor information.

rock4b+ - YELLOW, unverified mostlikely usable and/or missing minor information.

rock4c - YELLOW, unverified mostlikely usable and/or missing minor information.

rock4c+ - YELLOW, unverified mostlikely usable and/or missing minor information.

rock5b-v1.3 - YELLOW, unverified mostlikely usable and/or missing minor information.

rock5b - GREEN, verified.

rock5bq - GREEN, verified.


### Khadas: 5

Created from mechanical drawings and 3D models.

vim1 - YELLOW, unverified mostlikely usable and/or missing minor information.

vim2 - YELLOW, unverified mostlikely usable and/or missing minor information.

vim3l - YELLOW, unverified mostlikely usable and/or missing minor information.

vim3 - YELLOW, unverified mostlikely usable and/or missing minor information.

vim4 - YELLOW, unverified mostlikely usable and/or missing minor information.



### Asus: 6

tinkerboard - YELLOW, unverified mostlikely usable and/or missing minor information.

tinkerboard-s - YELLOW, unverified mostlikely usable and/or missing minor information.

tinkerboard-2 - YELLOW, unverified mostlikely usable and/or missing minor information.

tinkerboard-2s - YELLOW, unverified mostlikely usable and/or missing minor information.

tinkerboard-r2 - YELLOW, unverified mostlikely usable and/or missing minor information.

tinkerboard-r2s - YELLOW, unverified mostlikely usable and/or missing minor information.



### OrangePi: 6

opi5 - YELLOW, unverified mostlikely usable and/or missing minor information.

opizero/opizeroplus - YELLOW, unverified mostlikely usable and/or missing minor information.

opizero2 - YELLOW, unverified mostlikely usable and/or missing minor information.

opir1plus_lts - YELLOW, unverified mostlikely usable and/or missing minor information.

opir1 - GREEN, verified to be correct using SBC Case Builder.



### Libre Computer: 7

lepotato - YELLOW, unverified mostlikely usable and/or missing minor information.

sweetpotate - YELLOW, unverified mostlikely usable and/or missing minor information.

tirtium-h2+ - YELLOW, unverified mostlikely usable and/or missing minor information.

tritium-h3 - YELLOW, unverified mostlikely usable and/or missing minor information.

tritium-h5 - YELLOW, unverified mostlikely usable and/or missing minor information.

solitude - YELLOW, unverified mostlikely usable and/or missing minor information.

alta - YELLOW, unverified mostlikely usable and/or missing minor information.



### StarFive: 1

visonfive2 - GREEN, verified to be correct using SBC Case Builder.



### Sipeed: 1

licheerv+dock - GREEN, verified to be correct using SBC Case Builder.



### Digital Loggers, Inc.: 1

atomicpi - YELLOW, unverified mostlikely usable and/or missing minor information.



### RAK WisBlock: 1

rak19007 - YELLOW, unverified mostlikely usable and/or missing minor information.


License: GPLv3.


### Notes

  More information can be found at this [Hard Kernel forum thread](https://forum.odroid.com/viewtopic.php?f=53&t=33823)

