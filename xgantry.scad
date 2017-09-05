$fn=100;
fudge = 0.0;
rod_radius=4;
// joint
difference(){
    translate([0,0,4]){
        cube([20,48,15]);
        bearing_bosses();
//        endstop_bump();
        string_attachment();
    }
    bearing_channel();
    smooth_rods();
    clamp_cuts();
    string();
    bearings();
}

module bearing_channel(){
    rotate([-90,0,0]){
        translate([10,0,-1]){
            cylinder(h=50, r=5);
            translate([0,0,13]){
                cylinder(h=24, r=7.5 + fudge);
            }
        }
    }
}

module smooth_rods(){
    rotate([90,0,90]){
        translate([6,11,9]){
            cylinder(h=30, r=rod_radius);
            translate([36,0,0]){
                cylinder(h=30, r=rod_radius);
            }
        }
    }
}

module clamp_cuts(){
        translate([10,-1,11]){
        cube([11,6,1]);
        translate([0,44,0]){
            cube([11,5,1]);
        }
    }
}

module string(){
        rotate([90,0,0]){
        translate([8,14,-49]){
            cylinder(h=50, r=2);
        }
    }    
}

module bearings(){
    color("green",1)
    translate([15,24,0]){
        translate([0,11,0]){
            cylinder(h=40, r=1.4);
        }
        translate([0,-11,0]){
            cylinder(h=40, r=1.4);
        }
    }
}
module bearing_bosses(){
    translate([15,24,15]){
        translate([0,11,0]){
            cylinder(h=1, r=4);
        }
        translate([0,-11,0]){
            cylinder(h=1, r=4);
        }
    }
}
module string_attachment(){
    translate([-3,15,9]){
        difference(){
            cube([3,20,2]);
            mirror([1,0,0]){
                translate([-3,0,0]){
                    triangle(5,3,2);
                }
            }
            rotate([0,0,180]){
                translate([-3,-20,0]){
                    triangle(5,3,2);
                }
            }
        }
    }
}
module triangle(o_len, a_len, depth){
    linear_extrude(height=depth){
        polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
    }
}
module endstop_bump(){
    translate([-10,0,-4]){
        difference(){
            color("blue",1)cube([10,4,8]);
            rotate([90,0,0]){
                translate([4,4,-5]){
                    cylinder(r=1.4,h=6);
                }
            }
        }
    }
}