$fn=100;
difference(){
    cube([10,50,10]);
    rotate([-90,0,0]){
        translate([5,-5,-5]){
            cylinder(h=60,r=4);
        }
    }
    rotate([0,0,0]){
        translate([5,20,0]){
            cylinder(h=50,r=1);
        }
    }
}