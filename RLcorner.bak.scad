$fn=100;
fudge = 0.0;
rod_radius=4;
difference(){
    translate([-10,-10,-10]){
        //joint
        cube([30,20,20]);
        //bearing boss
        translate([4,16,20]){
            cylinder(h=1, r=4);
        }
        //motor mount
        color("pink",1){
            translate([-5,-10,0]){
                minkowski(){
                    cube([41,19,10]);
                    cylinder(r=1,h=1);
                }
            }
        }
   }
   //opposite rod
    translate([0,rod_radius,0]){
        rotate([-90,0,0]){
            cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
    //side rod
    translate([rod_radius,0,0]){
        rotate([90,0,90]){
            cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
    //bottom rod
    translate([0,0,-rod_radius]){
        rotate([180,0,0]){
            cylinder(h=30, r1=rod_radius + fudge, r2=rod_radius + fudge);
        }
    }
    translate([-10,-10,-10]){
       //bearing mount
        translate([4,16,-1]){
            cylinder(h=23,r=1.4);
        }
        //expansion cuts
        translate([10,10,0]){
            cube([30,1,10]);
        }
        translate([10,10,0]){
            cube([1,10,10]);
        }
    }
    //motor
    translate([6,-18,-12]){
        cylinder(h=24,r=14);
    }
    //pulley relief
    translate([6,-11,1]){
        cylinder(h=10,r=10.5);
    }
    //motor mount holes
    translate([23.2,-18,-10]){
        cylinder(h=21,r=1.4);
    }
    translate([-11.2,-18,-10]){
        cylinder(h=21,r=1.4);
    }
}
//motor
//translate([-6,-18,-12]){
//    color("blue",1){
//        cylinder(h=24,r=14);
//    }
//}
