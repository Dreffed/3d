$fn = 100;

/*
 *  size_width      = how tall the print is
 *  wall_thickness  = the wall thickness of the print
 *
 *  ║       ─────────────
 *  ╠═════╗ ─────────   │
 *  ║     ║         │   │
 *  ║     ║ ─────   │   │
 *  ║           │   │   │
 *  ║           │   │   │
 *  ╠═══■   ─────────────
 *
 *  │   │ │     │   │   └─ clip_length + (2 * clip_pad)
 *  │   │ │     │   └─ clip_length
 *  │   │ │     └─ clip_hook
 *  │   │ │
 *  │   │ └──── clip_width
 *  │   └────── clip_width / clip_ratio
 *
 *  Shims are curved using r_inner as the radius
 *  ╗ module - corner_shim
 *
 *  ╠ module - corner_joint
 */

wall_thickness = 3;

//*
// wall cabel trunking...
r_inner = 2;
clip_ratio = 1.3; // 2
clip_pad = 5;
clip_length = 58; //30
clip_width = 17; // 15
clip_hook = 10; //clip_width / clip_ratio;
size_width = 16;
// */

/*
// headphone...
r_inner = 2;
clip_ratio = 3;
clip_pad = 10;
clip_length = 30;
clip_width = 30;
clip_hook = 10;
size_width = 40;
// */


offset_step = size_width / 2;
r_outer = r_inner + wall_thickness;

// modules to create joints...
module corner_shim(r_outer, w_thickness, extrude){
    
    r_inner = r_outer - w_thickness;
    o_step = extrude/2;
    
    translate([0, 0, o_step]) {
        intersection(){
            difference(){
                cylinder(r=r_outer, h=extrude, center=true);
                cylinder(r=r_inner, h=extrude+o_step, center=true);    
            };
            translate([r_outer/2, r_outer/2,0]){
                cube([r_outer, r_outer, extrude], center=true);
            }
        }
    }
};

module corner_joint(r_outer, w_thickness, extrude){
    translate([r_outer, r_outer + r_inner,0]){
    rotate([0,0,180]){
        corner_shim(r_outer, w_thickness, extrude);
        translate([0, 2*r_outer - w_thickness, 0]){
            rotate([0,0,-90]){
                corner_shim(r_outer, w_thickness, extrude);
        
                };
            };
        };            
    };    
};

// joints placement
corner_joint(r_outer, wall_thickness, size_width);
translate([0, clip_length, 0]){
    corner_joint(r_outer, wall_thickness, size_width);
};

// wall section
cube([wall_thickness, clip_length + (2 * clip_pad), size_width]);
// top clip
translate([0, r_inner, 0]){
    cube([r_outer + clip_width/clip_ratio, wall_thickness, size_width]);
};
translate([r_outer + clip_width/clip_ratio, r_inner*2, 0]){
    cylinder(r=r_inner, h=size_width);
};

// bottom holder
translate([0, clip_length + r_inner, 0]){
    cube([clip_width, wall_thickness, size_width]);
};
translate([clip_width + r_inner,clip_length - clip_hook,0]){
    cube([wall_thickness, clip_hook, size_width]);
};
translate([clip_width, clip_length, 0]){
    //rotate([0,0,180]){
        corner_shim(r_outer, wall_thickness, size_width);
    //};    
};



