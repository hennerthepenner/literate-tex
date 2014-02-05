Basic features
==============

- Parse a markdown formatted string and make it output tex instead of the 
  usual html. This can also be done with pandoc, but there are a few features 
  missing. Let's try to write a tex renderer for marked.


Tex features
============

- Output the markdown blockquotes as fancy listing thingy with syntax 
  highlighting.
- Make linenumbers that can span over multiple blocks of code examples.
- Add captions (`\caption`) and labels (`\label`).
- The syntax highlighting can be derived from the file ending (e.g. 
  litcoffee to produce coffeescript code blocks).


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
