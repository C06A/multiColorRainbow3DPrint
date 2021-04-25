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
12. Little reorganisation of the code to combine all black elements together and remove
    colors out of the modules
13. Add to the values information for configurator
    1. Single line comments before constant definition contains the description of the value
    2. in-line comment in the same row defines the widget to select the value and limitations
    3. Multi-line comment with text in square brackets defines the name of the group
14. To print all this in different colors the model should be rendered separately for each color
    1. Let's add boolean parameter for each color controlling if include element or not
    2. Combining them in the collection allows easy way to check if specific color should be included
    3. Instead of call for function "color("...")" let's call a new module
15. Remove rainbow from inside the cloud, so they won't overlap when printed separetely
    1. Combine all rainbow colors and borders with union function
    2. Subtract from rainbow both clouds and their borders
16. Add presets to isolate each color for slicing/printing
    1. In the Customizer panel deselect all colors
    2. Enable single color and safe preset or rendered STL file
17. Instead of predefined radiuses calculate them based on selected colors
    1. Use a recursive module to calculate the radius of each color
    2. Use the similar recursive module to calculate the radius of the border
