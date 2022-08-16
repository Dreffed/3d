$fn = 100;

module cylinderClip(d, h, t, a) {
    r = d/2;
    o = d/3;
    b = 0; //(90-(1*a))/2;
    n = 45;
    
    rotate(b) {
        difference() {
            cylinder(r=r+t, h=h, center=true);
            translate([0, 0, -1]) {
                cylinder(r=r, h=h+10, center=true);
            };
            rotate(n - a) {
                translate([o, o, -1]) {
                    cube([o*2, o*2, h+10], center=true);
                };
            };
            rotate(n + a) {
                translate([o, o, -1]) {
                    cube([o*2, o*2, h+10], center=true);
                };
            };        
        };
        rotate(n - a) {
            translate([r+(t/2), 0, 0]) {
                cylinder(r=(t+2)/2, h=h, center=true);
            };
        };
        rotate(n + a) {
            translate([0, r+(t/2), 0]) {
                cylinder(r=(t+2)/2, h=h, center=true);
            };
        };
    };
};

h = 50;
t = 4;
a = 30;
d1 = 39;
d2 = 31;

// core clip
rotate(180) {
    cylinderClip(d2, h, t, a-10);
};
///*
translate([d1+t/2,0,0]) {
    cylinderClip(d1, h, t, a);
};
translate([-(d1+t/2),0,0]) {
    cylinderClip(d1, h, t, a);
};
// */