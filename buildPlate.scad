
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

switchWidth=14.0; // I measured the switches at 13.8mm, but that proved a little snug

numRows=4;
numCols=6;
switchPadding=3;
sidePadding=10;
topPadding=20;
botPadding=5;

totalX = (2 * sidePadding) + (numCols * switchWidth) + ((numCols-1) * switchPadding);
totalY = topPadding + botPadding + (numRows * switchWidth) + ((numRows - 1) * switchPadding);

switchPositions=[for(i=[1:1:numCols], j=[1:1:numRows]) 
        [sidePadding + ((i-1)*switchWidth) + ((i-1) * switchPadding), 
        topPadding + ((j-1)*switchWidth) + ((j-1) * switchPadding), -1]];

union() {
    difference() {
        roundedcube(totalX,totalY,totalZ,2.5, circle_resolution=resolution);
        for(i=switchPositions){
            translate(i) cube([switchWidth, switchWidth, totalZ+2]);
        } 
    }
    cylinder(3*totalZ, 1, false);
}

