Mini Shelf (WIP)
================

> **Warning** this design is still being worked on and tested.
>
> Things currently under consideration:
> - tolerances of the width (is there enough room to place units next to each other)
> - text position (on back or under lid)
> - back wall text to show what should go in the shelf
> - fonts
>
> This design has not been printed yet!

The mini shelf is a single modular shelving unit. 

Shelving units are measured in mm for their internal space. Once an individual units dimensions are given, differently
sized but compatible modules will be created by changing the "width in units". In order to be compatible the internal
volume is slightly larger than X units high and Y units wide when X or Y are larger than one, since it must also contain
the missing walls.

I originally made this to make shelves for small flavoured coffee jars.

Options:
--------

Unit Size (the internal dimensions of a 1x1x1 shelg)
- **unitHeight** - How many mm high is one unit
- **unitWidth** - How many mm wide is one unit
- **unitDepth** - How many mm deep is one unit

Once you've designed a single unit you can make compatible modules by changing these values
- **heightInUnits** - Number of units high
- **widthInUnits** - Number of units wide

Other

- **showSizingText** - Add unit sizing text to the underside of the top of the shelf. This is useful incase you want to 
  make more units and can't remember what size the originals were
- **topOnly** - only print the top of a shelf. This can be used as a stand

