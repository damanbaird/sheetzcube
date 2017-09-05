$fn=100;
fudge = 0.0;
rod_radius=4;
// X gantry
translate([0,11,0]){
    // rods
    rotate([90,0,90]){
        translate([8,11,rod_radius]){
            rod();
            translate([36,0,0]){
                rod();
            }
        }
    }
    // joint
    translate([-8,2,0]){
        difference(){
            cube([20,48,20]);
            rotate([-90,0,0]){
                translate([10,0,0]){
                    cylinder(h=50, r1=7.5 + fudge, r2=7.5 + fudge);
                }
            }
            rotate([90,0,90]){
                translate([6,11,6]){
                    cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
                    translate([36,0,0]){
                        cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
                    }
                }
            }
        }
    }
}
// joint
difference(){
    translate([-10,-10,-10]){
        cube([20,20,20]);
        //pulley lug
        translate([4,4,20]){
            cylinder(h=1, r=4);
        }
        translate([16,16,20]){
            cylinder(h=1, r=4);
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
        //pulley screw holes
        translate([4,4,0]){
            cylinder(h=21,r=1.4);
        }
        translate([16,16,0]){
            cylinder(h=21,r=1.4);
        }
        //expansion cuts
        translate([10,10,0]){
            cube([10,1,10]);
        }
        translate([10,10,0]){
            cube([1,10,10]);
        }
    }
}
//motor
translate([-6,-18,-8]){
    color("blue",1){
        cylinder(h=19,r=14);
    }
}
translate([0,rod_radius,0]){
    rotate([-90,0,0]){
        rod();
        translate([304.8+rod_radius*2,0,0]){
            rod();
        }
    }
}
translate([rod_radius,0,0]){
    rotate([90,0,90]){
        rod();
        translate([304.8+rod_radius*2,0,0]){
            rod();
        }
    }
}
translate([0,0,-rod_radius]){
    rotate([180,0,0]){
        rod();
        translate([304.8+rod_radius*2,0,0]){
            rod();
        }
        translate([0,-304.8-rod_radius*2,0]){
            rod();
        }
        translate([304.8+rod_radius*2,-304.8-rod_radius*2,0]){
            rod();
        }
    }
}
module rod(){
    color("silver",1.0){
        cylinder(h=304.8, r1=rod_radius, r2=rod_radius);
    }
}
