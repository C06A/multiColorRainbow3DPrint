# Multicolor design to 3DPrint a Rainbow with clouds

This project was my response to the challenge by [3D printing Nerd](https://www.youtube.com/watch?v=quFqjUUYN6E).

The history of the master branch shows the step-by-step progress of improvement of the design.
The final variation includes the customization, so it can be used directly on [Thingiverse](https://www.thingiverse.com/thing:3100539).

1. There are different ways to create solids in OpenSCAD. For rainbow let's start with rectangular
cross-section
2. Move the cross-section into distance from the Z-axes
3. User one of extrusion function to make a bow
4. Instead of copy-paste let's make a module do call multiple times. The module takes 2 arguments,
   one of which optional with default value
5. The same module can make as border of the rainbow. For that,
   override the default value of the optional argument
6. In order to avoid duplication of the code or values, let's define constants
and use their names instead of numeric values
7. Instead of copy-paste the same code for each color,
   let's define the pairs of color and radius and use them in the loop
8. Another way to build solids is to use 3D shape functions. For the clouds let's use cylinder
9. Each cloud built off a set of cylinders. Let's also define the pairs of radius and coordinates
of base center for each cylinder and loop over collection of them. All values here defined
   relative to the radius of the rainbow and will scale with latter
10. Follow the same approach let's create the right cloud. Both left and right clouds
    could be created from the single collection of pairs, but keeping separate may be useful later
11. In order to add the border around the cloud let's add black cylinders with a bit bigger radius.
    Then white cylinder later will override the middle of black cylinder with white cloud
