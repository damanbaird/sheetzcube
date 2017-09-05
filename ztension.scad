$fn=100;
tensioner();
module tensioner(){
    difference(){
        cube([9,12,18]);
        translate([-0.5,2.5,-0.5]){
            cube([11,7,16]);
        }
        rotate([90,0,0])
            translate([4.5,4.5,-13])
                cylinder(h=22,r=1.4);
        translate([4.5,6,0])
            cylinder(r=2,h=20);
    }
}
