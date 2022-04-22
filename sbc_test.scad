include <sbc_models.scad>

translate ([-365,0,12]) sbc("m1");
linear_extrude(height = 2) {translate([-355,-20,0]) text("Odroid-M1");}

translate ([-240,0,0]) sbc("hc4");
linear_extrude(height = 2) {translate([-240,-20,0]) text("Odroid-HC4");}

translate ([-120,0,0]) sbc("c4");
linear_extrude(height = 2) {translate([-120,-20,0]) text("Odroid-C4");}

translate ([-120,100,0]) sbc("c2");
linear_extrude(height = 2) {translate([-120,80,0]) text("Odroid-C2");}

translate ([-120,200,0]) sbc("c1+");
linear_extrude(height = 2) {translate([-120,180,0]) text("Odroid-C1+");}

translate ([0,0,0]) sbc("xu4");
linear_extrude(height = 2) {translate([0,-20,0]) text("Odroid-XU4");}

translate ([0,100,0]) sbc("xu4q");
linear_extrude(height = 2) {translate([0,80,0]) text("Odroid-XU4Q");}

translate ([0,200,0]) sbc("hc1");
linear_extrude(height = 2) {translate([0,180,0]) text("Odroid-HC1/HC2");}

translate ([0,290,0]) sbc("mc1");
linear_extrude(height = 2) {translate([0,270,0]) text("Odroid-MC1");}

translate ([120,0,12]) sbc("n2+");
linear_extrude(height = 2) {translate([120,-20,0]) text("Odroid-N2+");}

translate ([120,140,18]) sbc("n2");
linear_extrude(height = 2) {translate([120,120,0]) text("Odroid-N2");}

translate ([120,290,0]) sbc("n1");
linear_extrude(height = 2) {translate([120,270,0]) text("Odroid-N1");}

translate ([240,0,0]) sbc("h2");
linear_extrude(height = 2) {translate([240,-20,0]) text("Odroid-H2/H2+");}
