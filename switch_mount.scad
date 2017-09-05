$fn=100;
fudge = 0.0;
rod_radius=4;
mount();
module mount(){
    difference(){
        union(){
            cube([10,8,26]);
            translate([11,0,0]){
                cube([5,8,26]);
            }
        }
        switch_mount();
        mounting_hole();
    }
}
//mounting_hole();
module mounting_hole(){
    rotate([90,0,0]){
        translate([9,9,-18]){
            cylinder(h=30, r=rod_radius + fudge);
        }
    }
}
//switch_mount();
module switch_mount(){
    rotate([0,90,0]){
        translate([-3,0,0]){
            screw_hole();
        }
        translate([-22,0,0]){
            screw_hole();
        }
    }
}
module screw_hole(){
    translate([0,4,-2]){
        cylinder(h=22,r=1.4);
    }
}