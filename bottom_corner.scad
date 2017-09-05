$fn=100;
difference(){
    union(){
        minkowski(){
            cube([15,15,18],true);
            sphere(2);
        }
        translate([15,0,0]){
            minkowski(){
                cube([20,15,18],true);
                sphere(2);
            }
        }
        translate([0,-15,0]){
            minkowski(){
                cube([15,20,18],true);
                sphere(2);
            }
        }
        translate([0,0,15]){
            minkowski(){
                cube([15,15,20],true);
                sphere(2);
            }
        }
    }
    rods_and_reliefs();
}
module rods_and_reliefs(){
    rotate([90,0,0]){
        //this one accounts for difference in rod lengths
        translate([0,0,7]){
            cylinder(h=50,r=4);
            rotate([0,0,180]){
                translate([-0.5,0,0]){
                    cube([1,30,50]);
                }
            }
        }
    }
    rotate([0,90,0]){
        translate([0,0,4]){
            cylinder(h=50,r=4);
            rotate([0,0,-90]){
                translate([-0.5,0,0]){
                    cube([1,30,50]);
                }
            }
        }
    }
    rotate([0,0,90]){
        translate([0,0,4]){
            cylinder(h=50,r=4);
            rotate([0,0,-45]){
                translate([-0.5,0,0]){
                    cube([1,19,50]);
                }
            }
        }
    }
}