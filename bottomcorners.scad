$fn=100;
fudge = 0.0;
rod_radius=4;
difference(){
    translate([-10,-10,-10]){
        union(){
            cube([20,20,20]);
            translate([20,0,0]){
                cube([20,20,20]);
            }
            translate([0,20,0]){
                cube([20,20,20]);
            }
            translate([0,0,-20]){
                cube([20,20,20]);
            }
        }
    }
    translate([0,rod_radius,0]){
        rotate([-90,0,0]){
            cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
    translate([rod_radius,0,0]){
        rotate([90,0,90]){
            cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
    translate([0,0,-rod_radius]){
        rotate([180,0,0]){
            cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
    translate([-10,-10,-10]){
        //expansion cuts
        translate([10,10,0]){
            cube([10,1,10]);
        }
        translate([10,10,0]){
            cube([1,50,50]);
        }
    }
}
