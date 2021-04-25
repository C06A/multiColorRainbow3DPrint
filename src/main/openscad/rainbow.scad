/* [Detalization] */

// rounds' segments
$fn = 25; // [10:rough,25:default,100:fine]

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


for (i = sections) {
  color(i[0])
    segment(i[1]);
}

color("black") {
  segment(radius, borderWidth);
  segment(radius - len(sections) * width - borderWidth, borderWidth);

  cloudBorder(cloudsLeft);
  cloudBorder(cloudsRight);
}

color("white") {
  cloud(cloudsLeft);
  cloud(cloudsRight);
}

module segment(radius, width = width) {
  rotate_extrude(angle = 180)
    translate([radius, 0, 0])
      square([width, rainbowThick]);
}

module cloudBorder(definitions) {
  color("black")
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
