$fn = 100;
difference(){
    translate([-6,-30,0]) {
        cube([12,60,40]);
    };

    translate([-4,-28,2]) {
        cube([8,56,125]);
    };

    translate([1,-23,10]) {
        cube([6,46,35]);
    };
    translate([0,-28,31]){
        rotate([90,0,90]){
            difference(){
                cube(10);
                cylinder(h=12, r=5);
            }
        }
    };
    translate([0,28,31]) {
        rotate([270,-90,270]){
            difference(){
                cube(10);
                cylinder(h=12, r=5);
            }
        }
    };
}
