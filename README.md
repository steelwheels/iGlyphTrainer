# iGlyphTrainer
The repository contains the application "iGlyphTrainer"
and some library/frameworks to support it.

# Copyright
Copyright (C) 2015 [Steel Wheels Project](https://sites.google.com/site/steelwheelsproject/).

This software is distributed under
[GNU GENERAL PUBLIC LICENSE Version 2.0](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)
or [GNU LESSER GENERAL PUBLIC LICENSE Version 2.1](https://www.gnu.org/licenses/lgpl-2.1-standalone.html).

# Related document
* [User's manual](https://sites.google.com/site/steelwheelsproject/home/products/iglyphhacktrainer)
* [AppStore page](https://itunes.apple.com/jp/app/iglyphtrainer-training-program/id1007405158?mt=8)

# Contents
1. KGGlyphData       : Define the data structure of glyph and sentence of the glyphs
2. KGGameData        : Define the primary data structure
3. KGControls        : Define basic user interface controller such as label and button
4. KGGlyphGraphics   : Define drawer and editor classes to draw/edit glyph graphics
5. KGGlyphView       : Define view class for glyph graphics, progress bar, ...
6. iGlyphHackTrainer : Application

# Required software
To build this application, following software is also required.
When you install these framework, keep the order to keep the dependency.

1. [Coconut framework](https://github.com/steelwheels/Coconut)
2. [CoconutGraphics framework](https://github.com/steelwheels/CoconutGraphics)
3. [KiwiControl frameworks](https://github.com/steelwheels/KiwiControls):

# ChangeLog
## Version 1.0.1
* Suppress "landscape mode". Use "portrait mode" only
* Bug fix. Fix the bug which display wrong max/min number of glyphs in "Setup View".
* Update the "Setup" window title from "Setting" to "Setup".
* Fix the relation ship of the shape of the glyph and it's name
  * "Aspiration" : Fix the shape of glyph
  * "Begin" : Fix the shape of glyph
  * "Contact" : Fix the name to "Contract"
