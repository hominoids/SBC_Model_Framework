include <sbc_models.scad>

translate ([0,0,0]) sbc("rockpro64");
linear_extrude(height = 2) {translate([0,-20,0]) text("RockPro 64");}