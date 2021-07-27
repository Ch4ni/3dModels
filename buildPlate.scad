
module roundedcube(xx, yy, height, radius, circle_resolution=36) {
    difference(){

        cube([xx,yy,height]);

        difference(){
            translate([-.5,-.5,-.2])
            cube([radius+.5,radius+.5,height+.5]);

            translate([radius,radius,height/2])
            cylinder(height,radius,radius,true, $fn=circle_resolution);
        }
        translate([xx,0,0])
        rotate(90)
        difference(){
            translate([-.5,-.5,-.2])
            cube([radius+.5,radius+.5,height+.5]);

            translate([radius,radius,height/2])
            cylinder(height,radius,radius,true, $fn=circle_resolution);
        }

        translate([xx,yy,0])
        rotate(180)
        difference(){
            translate([-.5,-.5,-.2])
            cube([radius+.5,radius+.5,height+.5]);

            translate([radius,radius,height/2])
            cylinder(height,radius,radius,true, $fn=circle_resolution);
        }

        translate([0,yy,0])
        rotate(270)
        difference(){
            translate([-.5,-.5,-.2])
            cube([radius+.5,radius+.5,height+.5]);

            translate([radius,radius,height/2])
            cylinder(height,radius,radius,true, $fn=circle_resolution);
        }
    }
}


totalZ=2;
resolution=360;

switchWidth=14.1; // I measured the switches at 13.8mm, but that proved a little snug

numRows=4;
numCols=4;
switchPadding=2;
sidePadding=10;
topPadding=10;
botPadding=topPadding;

totalX = (2 * sidePadding) + (numCols * switchWidth) + ((numCols-1) * switchPadding);
totalY = topPadding + botPadding + (numRows * switchWidth) + ((numRows - 1) * switchPadding);


difference() {
    roundedcube(totalX,totalY,totalZ,2.5, circle_resolution=resolution);
    offsetX=(totalX-switchWidth)/2;
    offsetY=(totalY-switchWidth)/2;
    translate([offsetX,offsetY,-1]) cube([switchWidth, switchWidth, totalZ+2]);
}
