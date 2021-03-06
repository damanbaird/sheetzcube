$fn=100;
tensioner();
module tensioner(){
    difference(){
        union(){
            bolt_holder();
            slots();
            bearing_holder();
        }
    }
}
module bolt_holder(){
    difference(){
        cube([60,5,14]);
        screw_holes();
    }
}
//screw_holes();
module screw_holes(){
    rotate([90,0,0]){
        translate([0,9.5,-10]){
            translate([6.5,0,0]){
                color("pink",1)cylinder(r=2.1,h=11);
            }
            translate([53.5,0,0]){
                color("pink",1)cylinder(r=2.1,h=11);
            }
        }
    }
}
module slots(){
    translate([13,5,0]){
        difference(){
            cube([34,7,14]);
            translate([0,0,3]){
                translate([-1,-1,0]){
                    color("white",1)cube([5,23,2]);
                }
                translate([30,-1,0]){
                    color("white",1)cube([5,23,2]);
                }
            }
        }
    }
}
module bearing_holder(){
    translate([17,12,3.5]){
        difference(){
            cube([26,14,10.5]);
            translate([-1,0,2]){
                cube([28,16,6.5]);
            }
            rotate([]){
                translate([5,9,-1]){
                    translate([]){
                        cylinder(r=2,h=12);
                    }
                    translate([16,0,0]){
                        cylinder(r=2,h=12);
                    }
                }
            }
        }
    }
}