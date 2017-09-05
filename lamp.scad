$fn=100;
screw_distance = 83;
width = 15;
screw_size = 1.4;
//light_holder();
module light_holder(){
    difference(){
        cube([width, 95, 4],true);
        translate([0, - screw_distance/2, -5/2]){
            cylinder(r=screw_size, h=5);
        }
        translate([0, screw_distance/2, -5/2]){
            cylinder(r=screw_size, h=5);
        }
    }
}
trio();
module trio(){
    translate([0,-10,0]){
        rotate([85,0,0]){
            light_holder();
        }
    }
    translate([8.5,5.2,0]){
        rotate([85,0,120]){
            light_holder();
        }
    }
    translate([-8.5,5.2,0]){
        rotate([85,0,240]){
            light_holder();
        }
    }
    translate([0,0,95/2-1.8]){
        rotate([0,0,90]){
            color("blue",1)cylinder(r=8.5,h=3,$fn=3, center=true);
        }
    }
    translate([0,0,-95/2+1.4]){
        rotate([0,0,90]){
            color("yellow",1)cylinder(r=32.2,h=3,$fn=3, center=true);
        }
    }
}
shade();
module shade(){
    difference(){
        translate([0,0,-95/2+0.5]){
            cylinder(r=36, center=true);
        }
        translate([0,0,-95/2+1.4]){
            rotate([0,0,90]){
                cylinder(r=35,h=3,$fn=3, center=true);
            }
        }
    }
    difference(){
        color("white",0.3)sphere(r=60);
        translate([0,0,-147.5]){
            cube([200,200,200],true);
        }
        color("white",0.3)sphere(r=59);
        translate([0,-30,-95/2+3]){
            rotate([90,0,0]){
                cylinder(r=2,h=20);
            }
        }
    }
}