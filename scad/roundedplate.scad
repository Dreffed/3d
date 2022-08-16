$fn=100;
w = 65;
h = 30;
d = 2;

module roundplate(w,h,d){
    translate([(d/2), (d/2), 0]) {
        union () {            
            cube([w-(d/2),h-(d/2),d]);
            // round the corners
            // bottom
            translate([0, 0, d/2]) {
                rotate([0, 90, 0]) cylinder(r=d/2, h=w-(d/2));
                sphere(r=d/2);
            };
            // top
            translate([0, h-(d/2), d/2]) {
                rotate([0, 90, 0]) cylinder(r=d/2, h=w-(d/2));
                sphere(r=d/2);
            };
            // left
            translate([0, 0, d/2]) {
                rotate([-90,0,0]) {
                    cylinder(r=d/2, h=h-(d/2));
                };
            };
            // right
            translate([w-d/2, 0, d/2]) {
                rotate([-90,0,0]) {
                    cylinder(r=d/2, h=h-(d/2));
                };
                sphere(r=d/2);
                translate([0, h-(d/2), 0]){
                    sphere(r=d/2);
                };
            };
        };
    };
}

roundplate(w,h,d);

