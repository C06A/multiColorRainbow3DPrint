radius = 100;
width = 10;
rainbowThick = 5;

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

color("black")
  segment(radius, 2);

for (i = sections) {
  color(i[0])
    segment(i[1]);
}

color("black")
  segment(radius - 6 * width - 2, 2);

cloud(cloudsLeft);

module segment(radius, width = 10) {
  rotate_extrude(angle = 180)
    translate([radius, 0, 0])
      square([width, rainbowThick]);
}

module cloud(definitions) {
  color("white")
    for (i = definitions)
    translate(i[1])
      cylinder(6, i[0], i[0]);
}
