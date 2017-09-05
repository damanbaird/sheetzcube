$fn=100;
fudge = 0.0;
rod_radius=4;
difference(){
    translate([-10,-10,-15]){
        minkowski(){
            cube([24,26,23]);
            sphere(2);
        }
        pulley_boss();
        motor_positive();
    }
    rods();
    translate([-10,-10,-10]){
        screw_hole();
    }
    switch_mount();
    motor_negative();
}
module motor_positive(){
    translate([-16,-10,-2]){
        minkowski(){
            cube([41,19,17]);
            cylinder(r=1,h=1);
        }
    }
}
module motor_negative(){
    translate([-6,-18,-23]){
        cylinder(h=40,r=14);
    }
    //pulley relief
    translate([-6,-11,1]){
        cylinder(h=10,r=10.5);
    }
    //motor mount holes
    translate([11.2,-18,-10]){
        cylinder(h=21,r=1.4);
    }
    translate([-23.2,-18,-10]){
        cylinder(h=21,r=1.4);
    }
}
module pulley_boss(){
    translate([16,16,25]){
        cylinder(h=1, r=4);
    }
}
module screw_hole(){
    translate([16,16,10]){
        cylinder(h=22,r=1.4);
    }
}
module rods(){
    translate([0,rod_radius,0]){
        translate([rod_radius,-4.5,0]){
            color("red",1)cube([30,1,20]);
        }
        rotate([-90,0,0]){
            cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
    translate([rod_radius,0,0]){
        translate([-4.5,rod_radius,0]){
            color("green",1)cube([1,30,20]);
        }
        rotate([90,0,90]){
            cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
    translate([0,0,-rod_radius]){
        rotate([180,0,0]){
            cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
            rotate([0,0,45]){
                color("blue",1)cube([1,20,30]);
            }
        }
    }
}
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