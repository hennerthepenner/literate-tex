Features
========

It would be nice to convert markdown documents to tex snippets that can be 
included in LaTeX or XeTeX documents. The library marked with the TeX renderer 
should do the trick for rendering. What else is there to be included:

- Add captions (`\caption`) and labels (`\label`) to code blocks. Add some 
  additional and unwelcomed markdown for captions and labels for blocks of 
  code?
- File watching mechanism like in the coffeescript compiler.
- Directory compiler like in the coffeescript compiler.
- Also output the source code without description which can than be run 
  through a compiler.
- Option to easily call compilers automatically.
- Sourcemaps for languages that support it.
- derive the programming language from the file ending (e.g. litcoffee to 
  produce coffeescript code blocks).
