$fn=100;
//pulley();
module pulley(){
    capstan();
    translate([0,0,4.5]){
        mount();
    }
}
capstan();
module capstan(){
    difference(){
        cylinder(r=7,h=12, center=true);
        rotate_extrude(convexity=2)
            translate([10,-2,0])
                circle(r=5);
        translate([0,0,-2])
            drive_hole();
    }
}
module mount(){
    difference(){
        cylinder(r=4.5, h=8);
        drive_hole();
    }
}
//drive_hole();
module drive_hole(){
    difference(){
        cylinder(r=2.7, h=9);
//        cylinder(r=2.5, h=9);
        translate([1.7,-2.5,-3]){
//        translate([1.5,-2.5,-3]){
            cube([5,5,8]);
            translate([-8.3,0,0]){
//            translate([-8,0,0]){
                cube([5,5,8]);
            }
        }
    }
}
