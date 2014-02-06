Basic features
==============

Markdown to tex parser
----------------------

Parse a markdown formatted string and make it output tex instead of the 
usual html. This can also be done with pandoc, but there are a few features 
missing. Let's try to write a tex renderer for marked.

    marked = require("marked")
    texRenderer = require("./renderer")


Tex features
============

Code blocks with syntax highlighting
------------------------------------

Output the markdown code blocks as fancy listing thingy with syntax 
highlighting. This also be done using the renderer. People use different tex 
packages for code rendering. The most common are listing (built-in) and 
listings, I think. Pandoc uses verbatim.

For the syntax highlighting marked allows adding a custom function to do some 
custom rendering there. The render provides a function that supports syntax 
with the minted package, which is pretty cool and extremely feature rich and 
supports a whole bunch of languages, but needs python to be installed and the 
`-shell-escape` options for latex. So people still might want to use their 
custom functions.

- Make linenumbers that can span over multiple blocks of code examples.
- Add captions (`\caption`) and labels (`\label`).
- The correct programming language for syntax highlighting can be determined 
  - by deriving it from the file ending (e.g. litcoffee to produce 
    coffeescript code blocks).
  - by using github flavored markdown and explicitely stating it there.
  - by overriding stuff with a global language option.


Markdown features
=================

- Add some additional and unwelcomed markdown for captions and labels for 
  blocks of code.


Fancy features
==============

- File watching mechanism like in the coffeescript compiler.
- Directory compiler like in the coffeescript compiler.
- Also output the source code without description which can than be run 
  through a compiler.
- Option to easily call compilers automatically.
- Sourcemaps for languages that support it.
