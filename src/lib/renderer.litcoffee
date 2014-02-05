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

Print inline code (markdown backticks) as mono typed.

      codespan: (text) -> "\\texttt{#{text}}"

Print linebreak as text with a line break.

      br: (text) -> "#{text}\n"

Strikethrough (markdown: `~~`) isn't supported, because it requires special 
packages to be loaded (ulem or soul) and can cause problems with non-ASCII 
characters.

      del: (text) -> text

Print links as `urls`. Is there a good way to present the title and a text 
alongside the href? Ignore them for now

      link: (href, title, text) -> "\\url{#{href}}"

Images aren't supported, yet.

      image: (href, title, text) -> ""


Block renderer methods
----------------------

### paragraph

Print paragraph as a paragraph with a blank line.

      paragraph: (text) -> "#{text}\n\n"
