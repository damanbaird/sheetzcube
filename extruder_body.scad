$fn=100;

extruder_body();
module motor_test(){
    difference(){
        cube([30,50,1]);
        motor_mounts();
    }
}
module extruder_body(){
    difference(){
        cube([60,50,17]);
        motor_mounts();
        filament_hole();
        tube_connector();
        translate([0,0,3]){
            tensioner_connection();
            tensioner();
        }
        rod_relief();
        zip_ties();
    }
}
//motor_mounts();
module motor_mounts(){
    translate([22,25,-1]){
        rotate([0,0,200]){
            motor_mount_and_hole();
        }
    }
    translate([38,25,16]){
        mirror([0,0,1]){
            rotate([0,0,-20]){
                motor_mount_and_hole();
            }
        }
    }
}
//color("blue",1)motor_mount_and_hole();
module motor_mount_and_hole(){
    translate([0,0,-3]){
        cylinder(r=6,h=25);
        translate([8.3,-17.2,0]){
            cylinder(r=2.1,h=25);
        }
        translate([8.3,17.8,0]){
            cylinder(r=2.1,h=25);
        }
    }
}
//filament_hole();
module filament_hole(){
    rotate([0,90,0]){
        translate([-10.5,28.5,-1]){
            cylinder(r=1.3, h=62);
        }
    }
}
//tube_connector();
module tube_connector(){
    rotate([0,90,0]){
        translate([-10.5,28.5,-1]){
            color("red",1)cylinder(r=2.8,h=5.5);
        }
    }
}
//tensioner();
module tensioner(){
    translate([13,29.5,-1]){
        difference(){
            translate([0,0,-5]){
                cube([34,21,25]);
            }
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
//tensioner_connection();
module tensioner_connection(){
    //nut holes
    translate([0,43,4]){
        translate([3,0,0]){
            color("pink",1)cube([7,3.5,10]);
        }
        translate([50,0,0]){
            color("pink",1)cube([7,3.5,10]);
        }
    }
    //screw holes
    rotate([90,0,0]){
        translate([0,8.5,-51]){
            translate([6.5,0,0]){
                color("pink",1)cylinder(r=2.1,h=11);
            }
            translate([53.5,0,0]){
                color("pink",1)cylinder(r=2.1,h=11);
            }
        }
    }
}
module rod_relief(){
    rotate([0,90,0]){
        translate([-17/2,-1,-1]){
            cylinder(r=4,h=70);
        }
    }
}
module zip_ties(){
    translate([8,3,-1]){
        cube([6,3,19]);
        translate([40,0,0]){
            cube([6,3,19]);
        }
    }
}