// How many mm high is one unit
unitHeight = 110; // [10:500]
// How many mm wide is one unit
unitWidth = 70; // [10:500]
// How many mm deep is one unit
unitDepth = 70; // [10:500]
// Number of units high
heightInUnits = 1; // [1:4]
// Number of units wide
widthInUnits = 1; // [1:4]

module noop() {}

wallThickness = 4; // Do not make less than 2
pegThickness = 2;

// x = height
// y = width
// z = depth


module back() {
    cube([
        heightInUnits * unitHeight,
        widthInUnits * (unitWidth + (2*wallThickness)),
        wallThickness
    ]);
}


module wall() {
    color([1,0,0])
    cube([
        unitHeight*heightInUnits,
        wallThickness,
        unitDepth + (2*wallThickness),
    ]);
}

module left_wall() {
    wall();
}

module right_wall() {
    translate([
        0, 
        widthInUnits * (unitWidth + (2*wallThickness)) - wallThickness,
        0
    ])
    wall();
}

module top() {
    color([0,0,1])
    cube([
        wallThickness,
        widthInUnits * (unitWidth + (2*wallThickness)),
        unitDepth + (2*wallThickness)
    ]);
}

module shelf() {
    left_wall();
    right_wall();
    back();
    top();
}

shelf();
