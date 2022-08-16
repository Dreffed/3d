$fn = 100;
wall_thickness = 2;


// modules
module nut_insert(radius, depth, pad=2){
    linear_extrude(height = depth){
        difference(){
            circle(r=radius + pad);
            circle(r=radius,$fn=6);
        };
    };
 }
 
module bolt_mounts(x,y,z=5, nut_radius=5.4/2, pad=2){    
    translate([0,0,0]){
        nut_insert(radius=nut_radius, depth=z, pad=pad);
    };
    translate([0,y,0]){
        nut_insert(radius=nut_radius, depth=z, pad=pad);
    };
    translate([x,0,0]){
        nut_insert(radius=nut_radius, depth=z, pad=pad);
    };
    translate([x,y,0]){
        nut_insert(radius=nut_radius, depth=z, pad=pad);
    };
 };
 
module text_emboss(phrase, letter_height=5, letter_size=8, font="Liberation Sans"){
    linear_extrude(height = letter_height) {
        text(phrase, size = letter_size, font = font, halign = "center", valign = "center", $fn = 16);
	};
};

module raspi_zero(pad=2){
    pocket_depth = 5;
    m3_nut_radius = 5.4/2;
    board_x = 65 + m3_nut_radius;
    board_y = 30 + m3_nut_radius;
    bolt_x = 58;
    bolt_y = 23;

    difference(){
        cube([board_x, board_y, pad]);
        translate([board_x/2, board_y/2, -1]){
            text_emboss("Raspi Zero W", letter_height = pocket_depth, letter_size = 7);    
        };
    };
    translate([m3_nut_radius + pad, m3_nut_radius + pad, 0]){
        bolt_mounts(x=bolt_x, y=bolt_y, z=pad + pocket_depth, pad=pad);
    };
};

f="Liberation Sans";
//f="C059";
//f="Century Schoolbook L";
//f="D050000L";
//f="DejaVu Sans Mono";
//f="Droid Sans Fallback";
//f="Nimbus Sans L";
//f="Nimbus Sans Narrow";
//f="Noto Mono";
//f="P052";
//f="URW Bookman L";
//f="URW Chancery L";
//f="URW Gothic L";
//f="URW Palladio L";
//f="Z003";
//text_emboss("Raspi Zero W", font=f);

raspi_zero(pad=wall_thickness);
