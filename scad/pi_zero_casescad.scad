$fn = 100;
module mounts(){
    union(){  
        translate([3.5,3.5]) difference(){
            cylinder(h=2, r=3.5, center=true);
            cylinder(h=10, r=2, center=true);
        };
        translate([30 - 3.5,3.5]) difference(){
            cylinder(h=2, r=3.5, center=true);
            cylinder(h=10, r=2, center=true);
        };
        translate([3.5,65 - 3.5]) difference(){
            cylinder(h=2, r=3.5, center=true);
            cylinder(h=10, r=2, center=true);
        };
        translate([30 - 3.5, 65 - 3.5]) difference(){
            cylinder(h=2, r=3.5, center=true);
            cylinder(h=10, r=2, center=true);
        };  
    }
}

mounts();