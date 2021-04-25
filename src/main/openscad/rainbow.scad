radius = 100;
width = 10;
rainbowThick = 5;

color("black")
  segment(radius + width, 2);

color("red")
  segment(radius);

color("orange")
  segment(radius - width);

color("black")
  segment(radius - width - 2, 2);

module segment(radius, width = 10) {
  rotate_extrude(angle = 180)
    translate([radius, 0, 0])
      square([width, rainbowThick]);
}
