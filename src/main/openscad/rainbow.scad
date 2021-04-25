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

color("black")
  segment(radius, 2);

for (i = sections) {
  color(i[0])
    segment(i[1]);
}

color("black")
  segment(radius - 6 * width - 2, 2);

module segment(radius, width = 10) {
  rotate_extrude(angle = 180)
    translate([radius, 0, 0])
      square([width, rainbowThick]);
}
