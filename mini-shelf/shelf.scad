// How many mm high is one unit
unitHeight = 110; // [50:500]
// How many mm wide is one unit
unitWidth = 70; // [50:500]
// How many mm deep is one unit
unitDepth = 70; // [50:500]
// Number of units high
heightInUnits = 1; // [1:4]
// Number of units wide
widthInUnits = 1; // [1:4]
// Add unit sizing text to the underside of the top of the shelf
showSizingText = true;
// Top only (use as base)
topOnly = false;

module noop() {}

tolerance = 0.5;
wallThickness = 4; // Do not make less than 2
pegThickness = wallThickness / 2;
holeThickness = pegThickness + tolerance;

// x = height
// y = width
// z = depth

repeatWidth = (unitWidth +  (2 * wallThickness));

wallHeight = (heightInUnits * (unitHeight + wallThickness)) - wallThickness;
wallWidth = widthInUnits * repeatWidth;
wallDepth = unitDepth;

module peg() {
    color([0,1,0])
    cube([
        pegThickness,
        pegThickness,
        (wallDepth + wallThickness) * 0.8 - tolerance,
    ]);
}

module hole() {
    color([1,0,1])
    cube([
        holeThickness,
        holeThickness,
        wallDepth * 0.8 + tolerance,
    ]);
}

module back() {
    translate([
        wallThickness - tolerance,
        0,
        0,
    ])
    difference() {
        cube([
            wallHeight+tolerance,
            wallWidth,
            wallThickness
        ]);
        description();
    };
}

module description() {
    if(showSizingText) {
        rotate([0, 180, 90])
        translate([
            wallWidth * -0.5,
            wallHeight * -0.5,
           -tolerance
        ])
        linear_extrude(pegThickness+tolerance)
            text( 
                str(
                    "H:", unitHeight, ",",
                    "W:", unitWidth, ",",
                    "D:", unitDepth
                ), 
                size = 5,
                halign="center"
            );
        
    }
}


module wall() {
    color([1,0,0])
    cube([
        wallHeight + tolerance,
        wallThickness,
        wallDepth + wallThickness,
    ]);
    
    
    translate([
        wallHeight,
        wallThickness - pegThickness,
        (wallDepth + wallThickness) * 0.1 - (tolerance/2),
    ])
    peg();
}

module left_wall() {
    translate([
        wallThickness - tolerance,
        0,
        0,
    ])
    wall();
}

module right_wall() {
    rotate([180, 0, 0])
    translate([
        wallThickness - tolerance, 
        (-unitWidth - (2*wallThickness)) * widthInUnits ,
        -unitDepth - wallThickness
    ])
    wall();
}

module left_hole() {
    translate([
        -tolerance,
        (wallThickness / 2) - (tolerance/2),
        (wallDepth + wallThickness) * 0.1 + (tolerance/2),
    ])
    hole();
}

module right_hole() {
    translate([
        -tolerance, 
        repeatWidth - wallThickness - (tolerance/2),
        (wallDepth + wallThickness) * 0.1 + (tolerance/2),
    ])
    hole();
}

module top() {
    color([0,1,1])
    difference () {
        cube([
            wallThickness,
            wallWidth,
            wallDepth + wallThickness
        ]);
        // Holes must be repeated ad each interval between units
        for (i=[0:widthInUnits-1]) {
            translate([0, i*repeatWidth, 0]) {                
                left_hole();
                right_hole();
            }
        }
    }

}

module shelf() {
    if(!topOnly) {
        left_wall();
        right_wall();
        back();
    }
    top();
}

rotate([
    0,
    -90,
    0,
])
shelf();
