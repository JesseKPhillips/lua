# Lua

This is the repository of Lua development code and translation to D. It
contains the full history of all commits but is mirrored irregularly. For
complete information about Lua, visit [Lua.org](https://www.lua.org/).

Please **do not** send pull requests Lua Bug Fixes. To report Lua issues, post
a message to the [Lua mailing list](https://www.lua.org/lua-l.html).

Download official Lua releases from
[Lua.org](https://www.lua.org/download.html).

# What is Lua?
Lua is a powerful, efficient, lightweight, embeddable scripting language. It supports procedural programming, object-oriented 
programming, functional programming, data-driven programming, and data description.

Lua combines simple procedural syntax with powerful data description constructs based on associative arrays and extensible 
semantics. Lua is dynamically typed, runs by interpreting bytecode with a register-based virtual machine, and has automatic
memory management with incremental garbage collection, making it ideal for configuration, scripting, and rapid prototyping.

# Why choose Lua?
Lua is a proven, robust language

Lua has been used in many industrial applications (e.g., Adobe's Photoshop Lightroom), with an emphasis on embedded systems 
(e.g., the Ginga middleware for digital TV in Brazil) and games (e.g., World of Warcraft and Angry Birds). Lua is currently the 
leading scripting language in games. Lua has a solid reference manual and there are several books about it. Several versions of
Lua have been released and used in real applications since its creation in 1993. Lua featured in HOPL III, the Third ACM 
SIGPLAN History of Programming Languages Conference, in 2007. Lua won the Front Line Award 2011 from the Game Developers 
Magazine.

# Translation to D

This repository is not official in any capacity. I intend to try and start a conversation of the C source code to D.

The plan is to include D in the build pipeline and migrate files with the fewest dependencies. The idea is that there will always
be a working implementation of Lua.

The thought behind this translation is that integration with D might be more powerful if Lua was implemented in D. 
