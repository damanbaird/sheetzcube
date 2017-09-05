$fn=100;
fudge = 0.0;
rod_radius=4;
smoothrod_gap=36;

//hot end holder
rotate([-90,0,0]){
    difference(){
        union(){
            // hot end holder
            translate([-11,0,0]){
                cube([smoothrod_gap+30,41,6]);
            }
            // pulley standoffs x2
            translate([24,0,5]){
                cylinder(r=3,h=2);
            }
            translate([24,36,5]){
                cylinder(r=3,h=2);
            }
            // nub for pulley block
            translate([19,-4,0]){
                cube([10,6,6]);
            }
            // part cooler mount
            translate([1.7,0,-35]){
                rotate([0,-20,0]){
                    fan_mount();
                }
            }
            // induction probe
            translate([smoothrod_gap+15,0,-25]){
                probe_holder();
            }
        }
        translate([1.7,0,-35]){
            rotate([0,-20,0]){
                fan_mounting_holes();
            }
        }
        zipties();
        hotend();
        smooth_bearings();
        pulley();
    }
}

//zip tie holes
module zipties(){
    color("pink",1){
        translate([14,10,-1]){
            translate([-18,14,0]){
                cube([2,6,8]);
            }
            translate([0,14,0]){
                cube([2,6,8]);
            }
            translate([smoothrod_gap-18,0,0]){
                translate([0,14,0]){
                    cube([2,6,8]);
                }
            }
        }
    }
}
//hotend hole
module hotend(){
    color("black",1){
        translate([24,15,-1]){
            //hotend insert
            cylinder(h=8, r=8.1);
            translate([0,6,0]){
                cylinder(h=8,r=6.1);
            }
            //nut slot
            translate([-5.75/2,-11,0]){
                cube([5.75,4,8]);
            }
            //screw tunnel
            translate([0,0,4]){
                rotate([90,0,0]){
                    cylinder(h=24,r=1.5);
                }
            }
        }
    }
}    
//bearings
rotate([180,0,0]){
//    smooth_bearings();
}
module smooth_bearings(){
    rotate([-90,0,0]){
        translate([6,2,8]){
            color("grey",1){
                cylinder(h=24, r=7.5 + fudge);
                translate([0,0,-10]){
                    cylinder(h=50, r=5);
                }
                translate([smoothrod_gap,0,0]){
                    cylinder(h=24, r=7.5 + fudge);
                    translate([0,0,-10]){
                        cylinder(h=50, r=5);
                    }
                }
            }
        }
    }
}

module pulley(){
    color("blue",1){
        translate([24,0,3]){
            translate([]){
                cylinder(h=5,r=1.4);
            }
            translate([0,36,-5]){
                cylinder(h=10,r=1.4);
            }
        }
    }
}

module fan_mount(){
    difference(){
        union(){
            cube([4,41,41]);
            nozzle();
        }
        fan_mounting_holes();
        translate([-1,20.5,20.5]){
            rotate([0,90,0]){
                color("teal",1)cylinder(r=17,h=6);
            }
        }
    }
}
module fan_mounting_holes(){
    rotate([0,90,0]){
        translate([-3,3,-1]){
            translate([-35,35,0]){
                color("red")cylinder(r=1.4, h=6);
            }
            translate([0,0,0]){
                color("red")cylinder(r=1.4, h=6);
            }
            translate([-35,0,0]){
                color("red")cylinder(r=1.4, h=6);
            }
        }
    }
}
module nozzle(){
    translate([0,11,-15]){
        difference(){
            union(){
                translate([0,0,3]){
                    cube([2,30,12]);
                }
                translate([-2,0,0]){
                    rotate([0,-52,0]){
                        cube([2,30,22]);
                    }
                }
                translate([-19,0,0]){
                    cube([19,2,15]);
                }
                translate([-19,28,0]){
                    cube([19,2,15]);
                }
            }
            rotate([0,-52,0]){
                translate([-20,-1,0]){
                    color("blue")cube([19,32,50]);
                }
            }
        }
    }
}
module probe_holder(){
    translate([0,11,00]){
        cube([4,30,31]);
    }
    translate([0,11,0]){
        difference(){
            cube([20,30,4]);
            translate([12,11,-1]){
                color("green",1)cylinder(r=6,h=6);
            }
        }
    }
}