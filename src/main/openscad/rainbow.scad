/* [Detalization] */

// rounds' segments
$fn = 25; // [10:rough,25:default,100:fine]

/* [Color parts] */
black = true;
red = true;
orange = true;
yellow = true;
green = true;
blue = true;
purple = true;
white = true;

parts = [
    ["black", black],
    ["red", red],
    ["orange", orange],
    ["yellow", yellow],
    ["green", green],
    ["blue", blue],
    ["purple", purple],
    ["white", white]
  ];

/* [Dimensions] */
// The big radius of the rainbow
radius = 100; // [80:200]
// the width of each color of rainbow
width = 10; // [1:10]
// How thick should be the rainbow
rainbowThick = 5; // [2:10]
// How thick should be clouds
cloudThick = 6; // [2:15]
// How width will be black border
borderWidth = 2; // [1:5]

/* [Hidden] */
sections = [
    ["red", radius - width],
    ["orange", radius - 2 * width],
    ["yellow", radius - 3 * width],
    ["green", radius - 4 * width],
    ["blue", radius - 5 * width],
    ["purple", radius - 6 * width]
  ];

cloudsLeft = [
    [.22 * radius, [- radius, 0, 0]],
    [.18 * radius, [- (.8 * radius), width, 0]],
    [.22 * radius, [- (.6 * radius), 0, 0]],
    [.11 * radius, [- (.4 * radius), 1 * width, 0]]
  ];

cloudsRight = [
    [.1 * radius, [radius, 0, 0]],
    [.16 * radius, [.8 * radius, 0, 0]],
    [.15 * radius, [.6 * radius, 1.2 * width, 0]],
    [.15 * radius, [.4 * radius, 0, 0]],
    [.1 * radius, [.58 * radius, - .2 * width, 0]]
  ];

difference() {
  union() {
    for (i = sections) {
      make(i[0])
      segment(i[1]);
    }
    make("black") {
      segment(radius, borderWidth);
      segment(radius - len(sections) * width - borderWidth, borderWidth);
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

module segment(radius, width = width) {
  rotate_extrude(angle = 180)
    translate([radius, 0, 0])
      square([width, rainbowThick]);
}

module cloudBorder(definitions) {
  make("black")
  difference() {
    cloud(definitions, borderWidth);
    cloud(definitions);
  }
}

module cloud(definitions, off = 0) {
  for (i = definitions)
  translate(i[1])
    cylinder(cloudThick, i[0] + off, i[0] + off);
}

module make(clr) {
  for (i = parts) {
    if (clr == i[0] && i[1]) {
      color(i[0])
        children();
    }
  }
}
