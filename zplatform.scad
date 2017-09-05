$fn=100;
rod_radius=4;
rotate([90,0,0]){
    //xplatform
    difference(){
        union(){
            minkowski(){
                cube([222,4,7],true);
                sphere(rod_radius);
            }
            translate([0,2,-7]){
                smooth_rod_holder();
            }
            translate([99,2,-3.5]){
                minkowski(){
                    sphere(rod_radius);
                    cube([12,20,7]);
                }
            }
            translate([-111,2,-3.5]){
                minkowski(){
                    sphere(rod_radius);
                    cube([12,20,7]);
                }
            }
            string_attachment();
        }
        left_rod();
        right_rod();
        rotate([90,0,0])clamp_cut();
        translate([0,1,-7]){
            smooth_bearings();
            zip_ties();
        }
        string_hole();
    }
}
module smooth_rod_holder(){
    translate([0,0,0]){
        difference(){
            minkowski(){
                cube([30,12,25],true);
                sphere(2);
            }
            translate([0,-1,0])smooth_bearings();
        }
    }
}

module left_rod(){
    rotate([90,0,0]){
        translate([-104.5,0,-40]){
            cylinder(h=50,r=rod_radius);
        }
    }
}
module right_rod(){
    rotate([90,0,0]){
        translate([104.5,0,-40]){
            cylinder(h=50,r=rod_radius);
        }
    }
}
module smooth_bearings(){
    rotate([0,0,0]){
        translate([0,-10,-12]){
            color("grey",1){
                cylinder(h=24, r=7.6);
                translate([0,0,-10]){
                    cylinder(h=50, r=5.1);
                }
            }
        }
    }
}
module zip_ties(){
    color("red",1){
        translate([-12,-20,-2]){
            cube([2,40,6]);
        }
        translate([10,-20,-2]){
            cube([2,40,6]);
        }
    }
}

module clamp_cut(){
    translate([-125,-0.5,-30]){
        cube([20,1,50]);
    }
    translate([105,-0.5,-30]){
        cube([20,1,50]);
    }
}
module string_hole(){
    translate([-2,-1,-50]){
        color("blue",1)cube([4,4,100]);
    }
}
module string_attachment(){
    translate([-1,10,-16]){
        difference(){
            color("green",1) cube([2,8,20]);
            rotate([0,-90,0]){
                translate([0,5,-2.5]){
                    color("orange",1)triangle(3,5,3);
                }
            }
            rotate([0,90,0]){
                translate([-20,5,-0.5]){
                    color("orange",1)triangle(3,5,3);
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