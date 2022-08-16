$fn= 100;
r = 6;
w = 35;
l = 98;
h = 15;
o = 6;


// position the mounts...
translate([0, 0, 0]) {
    difference(){
        cylinder(r=r, h=h+o);
        translate([0, 0, h]){
            cylinder(r=r/6,h=3 * r);
        };        
    };
};

translate([0, w - (r/2), 0]) {
    difference(){
        cylinder(r=r, h=h+o);
        translate([0, 0, h]){
            cylinder(r=r/6,h=3 * r);
        };        
    };
};
translate([l - (r/2), 0, 0]) {
    difference(){
        cylinder(r=r, h=h+o);
        translate([0, 0, h]){
            cylinder(r=r/6,h=3 * r);
        };        
    };
};
translate([l - (r/2), w - (r/2), 0]) {
    difference(){
        cylinder(r=r, h=h+o);
        translate([0, 0, h]){
            cylinder(r=r/6,h=3 * r);
        };        
    };
};

// round the upper ends...
translate([0, w - (r/2), 0]) {
    sphere(r=r);
};
translate([l - (r/2), w - (r/2), 0]) {
    sphere(r=r);
}

translate([0, - o - r/2, 0]) {
    sphere(r=r);
};
translate([l - (r/2), - o - r/2, 0]) {
    sphere(r=r);
}


// put in the cross braces...
translate([0, w- r/2, 0]){
    rotate([90,0,0]){
        cylinder(r=r, h=w+o);
    };
};

translate([l - (r/2), w- r/2, 0]){
    rotate([90,0,0]){
        cylinder(r=r, h=w+o);
    };
};

translate([0, - o - r/2, 0]){
    rotate([0,90,0]){
        cylinder(r=r, h=l-r/2);
    };
};