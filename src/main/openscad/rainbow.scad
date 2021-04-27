/* [Shapes] */

// rounds' segments
$fn = 25; // [10:rough,25:default,100:fine]
// Shape of clouds
cloudShape = "flat"; // [flat,sphare]

/* [Color parts] */
black = true;
red = true;
orange = true;
yellow = true;
green = true;
blue = true;
indigo = false;
purple = true;
violet = false;
white = true;

parts = [
    ["black", black],
    ["red", red],
    ["orange", orange],
    ["yellow", yellow],
    ["green", green],
    ["blue", blue],
    ["indigo", indigo],
    ["purple", purple],
    ["violet", violet],
    ["white", white]
  ];

/* [Dimensions] */
// The big radius of the rainbow
radius = 100; // [80:200]
// the width of each color of rainbow
width = 10; // [1:10]
// How thick should be the rainbow
rainbowThick = 5; // [2:10]
// Change of thickness between colors
thickStep = 0; // [-2:.1:2]
// How thick should be clouds
cloudThick = 6; // [2:15]
// How width will be black border
borderWidth = 2; // [1:5]
// The number of the first color
startColorNum = 0; // [0:8]
// The number of the last clolr
endColorNum = 6; // [0:8]

/* [Hidden] */
cloudsLeft = [
    [.22 * radius, [- radius, 0, 0]],
    [.18 * radius, [- (.8 * radius), width, 0]],
    [.22 * radius, [- (.6 * radius), 0, 0]],
    [.11 * radius, [- (.4 * radius), 1 * width, 0]]
  ];

cloudsRight = [
    [.15 * radius, [radius, 0, 0]],
    [.18 * radius, [.8 * radius, 0, 0]],
    [.15 * radius, [.6 * radius, 1.2 * width, 0]],
    [.18 * radius, [.4 * radius, -1, 0]],
    [.12 * radius, [.58 * radius, - .2 * width, 0]]
  ];

difference() {
  union() {
    sections();
    make("black") {
      segment(radius + width, rainbowThick - thickStep, borderWidth);
      bowBorder();
    }
  }

  cloudBorder(cloudsLeft);
  cloudBorder(cloudsRight);

  cloud(cloudsLeft);
  cloud(cloudsRight);
}

make("black") {
  cloudBorder(cloudsLeft);
  cloudBorder(cloudsRight);
}

make("white") {
  cloud(cloudsLeft);
  cloud(cloudsRight);
}

module bowBorder(index = 1, off = startColorNum) {
  if (index < (len(parts) - 1)) {
    col = parts[index];
    if (col[1]) {
      bowBorder(index + 1, off + 1);
    } else {
      bowBorder(index + 1, off);
    }
  } else {
    borderOffset = max(off, endColorNum);
    segment(radius - (borderOffset - 1) * width - borderWidth, rainbowThick + borderOffset * thickStep, borderWidth);
  }
}

module sections(index = 1, off = 0) {
  if (index < (len(parts) - 1)) {
    col = parts[index];
    if (col[1]) {
      make(col[0])
      segment(radius - (off + startColorNum) * width, rainbowThick + off * thickStep);

      sections(index + 1, off + 1);
    } else {
      sections(index + 1, off);
    }
  }
}

module segment(radius, thick, width = width) {
  rotate_extrude(angle = 180)
    translate([radius, 0, 0])
      square([width, thick]);
}

module cloudBorder(definitions) {
  if (cloudShape == "flat")
  make("black")
  difference() {
    cloud(definitions, borderWidth);
    cloud(definitions);
  }
}

module cloud(definitions, off = 0) {
  for (i = definitions)
  translate(i[1])
    if (cloudShape == "flat")
      cylinder(cloudThick, i[0] + off, i[0] + off);
    else
      sphere(i[0]);
}

module make(clr) {
  for (i = parts) {
    if (clr == i[0] && i[1]) {
      color(i[0])
        children();
    }
  }
}
