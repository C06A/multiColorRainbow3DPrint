color("red")
  segment(100);

color("orange")
  segment(90);

module segment(radius, width = 10) {
  rotate_extrude(angle = 180)
    translate([radius, 0, 0])
      square([width, 5]);
}
