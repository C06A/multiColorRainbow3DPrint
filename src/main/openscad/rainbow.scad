color("black")
  segment(110, 2);

color("red")
  segment(100);

color("orange")
  segment(90);

color("black")
  segment(90 - 2, 2);

module segment(radius, width = 10) {
  rotate_extrude(angle = 180)
    translate([radius, 0, 0])
      square([width, 5]);
}
