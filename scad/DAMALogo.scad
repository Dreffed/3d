$fn = 100;

cr = 50;
or = 160;
d = 5;
w = 1;
s = 10;
a = 360 / s;
size = 10;
font = "";
xoff = 0;
yoff = (size/2) + (3 * w);
zoff = 0;

module divider(cr, or, d, w) {
    translate([0, (or-cr)/2 + cr, 0]) {
        cube([w,or-cr,d], center=true);
    };
};

module textbox(content, font, size, xoff, yoff, zoff, d, halign = "center", valign = "center"){
    translate ([xoff, yoff, zoff]) {
        color("black") linear_extrude(height = d) {
            text(content, font = font, size = size, halign= halign, valign = valign);
        };
    };
 };

module rottextbox(i, text01, text02, size, xoff, yoff, zoff, d) {
    rotate([0, 0, a * i]){
        color("black") translate([(or - cr)/2,0,0]){
            if (text02 == "") {
                textbox(text01, font, size, xoff, 0, zoff, d, halign = "left");
            }
            else {
                textbox(text01, font, size, xoff, yoff, zoff, d, halign = "left");
                textbox(text02, font, size, xoff, -yoff, zoff, d, halign = "left");
            };
        };
    };
};

//difference() {
    union() {
        color("white") difference() {
            cylinder(r=or, h=d, center=true);
            translate([0, 0, w]) {
                cylinder(r=or-w, h=d-w, center=true);
            };
        };
        difference() {
            cylinder(r=cr, h=d, center=true);
            translate([0, 0, w]) {
                cylinder(r=cr-w, h=d-w, center=true);
            };
        };        
        for (i = [0:s-1]){
            rotate([0, 0, a*i]){
                divider(cr, or, d, w);
            };    
        };
    };
    // center text
    textbox("Data", font, size, xoff, yoff, zoff, d);
    textbox("Goverance", font, size, xoff, -yoff, zoff, d);
    
    rottextbox(0, "Data Security", "", size, xoff, yoff, zoff, d);
    rottextbox(1, "Data Storage ", "& Operations", size, xoff, yoff, zoff, d);
    rottextbox(2, "Data Modelling", "& Design", size, xoff, yoff, zoff, d);
    rottextbox(3, "Data", "Architecture", size, xoff, yoff, zoff, d);
    rottextbox(4, "Data Quality", "", size, xoff, yoff, zoff, d);
    rottextbox(5, "MetaData", "", size, xoff, yoff, zoff, d);
    rottextbox(6, "DW & BI", "", size, xoff, yoff, zoff, d);
    rottextbox(7, "Reference", "& Master Data", size, xoff, yoff, zoff, d);
    rottextbox(8, "Document & ", "Content Mngmnt", size, xoff, yoff, zoff, d);
    rottextbox(9, "Data Integration", "& Interoperability", size, xoff, yoff, zoff, d);

    /*

    rotate([0, 0, a * 3]){
        translate([(or - cr)/2,0,0]){
            textbox("Data", font, size, xoff, yoff, zoff, d, halign = "left");
            textbox("Architecture", font, size, xoff, -yoff, zoff, d, halign = "left");
        };
    };
    // */
//};
