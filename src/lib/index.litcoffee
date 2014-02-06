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

Github uses linguist to run statistic analysis of source code to determine the 
programming language used. That library is written in ruby and cannot easily 
be included in this project. I think there are some other means of determining 
the correct programming language for syntax highlighting:
- using github flavored markdown and explicitely stating it there. Since 
  explicit is better than implicit, it's should be used if given.
- by overriding stuff with a global language option.


- Make linenumbers that can span over multiple blocks of code examples.
- Add captions (`\caption`) and labels (`\label`).


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
- derive the programming language from the file ending (e.g. litcoffee to 
  produce coffeescript code blocks).
