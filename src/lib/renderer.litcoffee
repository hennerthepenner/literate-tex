Tex Renderer for marked
=======================

marked needs a hash with some functions to be able to use the renderer. There 
are inline renderer methods and block renderer methods.

    module.exports = class Renderer


Inline renderer methods
-----------------------

### strong

Print normal emphasis (markdown: `*`, `_`) as italic.

      em: (text) -> "\\textit{#{text}}"

      
Print strong emphasis (markdown: `**`, `__`) as bold.

      strong: (text) -> "\\textbf{#{text}}"


Block renderer methods
----------------------

### paragraph

Print paragraph as a paragraph with a blank line.

      paragraph: (text) -> "#{text}\n\n"
