$fn=100;
fudge = 0.0;
rod_radius=4;
difference(){
    translate([-10,-10,-12]){
        minkowski(){
            cube([20,20,23]);
            sphere(2);
        }
        pulley_boss();
    }
    rods();
    translate([-22,-10,-10]){
        screw_hole();
    }
}
module motor_positive(){
    translate([-4,-10,-2]){
        minkowski(){
            cube([41,19,26]);
            cylinder(r=1,h=1);
        }
    }
}
//motor_negative();
module motor_negative(){
    translate([6,-18,-23]){
        cylinder(h=40,r=14);
    }
    //motor mount holes
    translate([23.8,-18,-10]){
        cylinder(h=21,r=1.4);
    }
    translate([-11.2,-18,-10]){
        cylinder(h=21,r=1.4);
    }
}
module pulley_boss(){
    translate([16,16,25]){
        cylinder(h=8, r=4);
    }
}
module screw_hole(){
    translate([28,16,10]){
        cylinder(h=22,r=1.4);
    }
}
module rods(){
    translate([0,-rod_radius,0]){
        translate([-0.5,-30,0]){
            color("red",1)cube([1,30,20]);
        }
        rotate([90,0,0]){
            color("red",1)cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
    translate([rod_radius,0,0]){
        translate([0,-0.5,0]){
            color("green",1)cube([30,1,20]);
        }
        rotate([90,0,90]){
            color("green",1)cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
    translate([0,0,-rod_radius]){
        rotate([180,0,0]){
            cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
            rotate([0,0,135]){
                color("blue",1)cube([1,30,30]);
            }
        }
    }
}
//rods();
module switch_mount(){
    rotate([0,90,0]){
        translate([-22,-2,-37]){
            screw_hole();
        }
        translate([-3,-2,-37]){
            screw_hole();
        }
    }
}
tension_holder();
module tension_holder(){
    translate([-12,0,10]){
        difference(){
            cube([10,10,14]);
            rotate([90,0,0])
                translate([5,9,-11])
                    cylinder(r=2.1,h=12);
        }
    }
}