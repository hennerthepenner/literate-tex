Tex Renderer for marked
=======================

marked needs a hash with some functions to be able to use the renderer. There 
are inline renderer methods and block renderer methods.

    module.exports = Renderer = 


Inline renderer methods
-----------------------

### strong

Print strong emphasis (markdown: `**`, `__`) as bold.

      strong: (text) -> "\\textbf{text}"
