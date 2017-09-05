$fn=100;
fudge = -0.05;
rod_radius=4;
mirror([0,0,0]){
        difference(){
        translate([-10,-9,-10]){
            minkowski(){
                cube([26,18,18]);
                sphere(1);
            }
        }
        horizontal_rod();
        smooth_rod();
        expansion_cuts();
        tension_bolt();
    }
}
module horizontal_rod(){
    translate([0,-30,0]){
        rotate([-90,0,0]){
            cylinder(h=60, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
}
//smooth_rod();
module smooth_rod(){
        translate([rod_radius+5,0,-rod_radius+4]){
        rotate([180,0,0]){
            cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
}
module expansion_cuts(){
    //expansion cuts
    translate([0,0,-8]){
        color("blue",1)cube([0.5,30,10],true);
    }
    translate([25,0,-10]){
        color("blue",1)cube([30,0.5,20],true);
    }
}
//expansion_cuts();
//tension_bolt();
module tension_bolt(){
    translate([-6,0,-30]){
        color("blue",1)cylinder(r=2,h=40);
    }
}