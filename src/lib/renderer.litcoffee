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

Code rendering is a bit tricky. Let's spare that for a later time and just use 
a dummy function.

      code: (code, language) -> "#{code}\n\n"

Print paragraph as a paragraph with a blank line.

      paragraph: (text) -> "#{text}\n\n"

HTML can't be displayed in tex. So just pass it unchanged.

      html: (html) -> html

Maps the different levels of headings to tex sections and paragraphs. There is 
only support for 5 levels of headings.

      heading: (text, level) ->
        return "#{text}\n\n" if level < 1 or level > 5

        headingMap = [
          "\\section{#{text}}",        # Level 1
          "\\subsection{#{text}}",     # Level 2
          "\\subsubsection{#{text}}",  # Level 3
          "\\paragraph{#{text}}",      # Level 4
          "\\subparagraph{#{text}}",   # Level 5
        ]
        headingMap[level - 1] + "\n\n"

Horizontal rulers are difficult to do in tex. Let's use this to enforce a page 
break.
      
      hr: () -> "\\pagebreak\n\n"

Print lists as itemized and enumerated environment. Print list items as item.

      list: (body, ordered) ->
        if ordered
          "\\begin{enumerate}\n#{body}\\end{enumerate}\n\n"
        else
          "\\begin{itemize}\n#{body}\\end{itemize}\n\n"

      listitem: (text) -> "\\item #{text}\n"

Print tables are difficult. Let's take care of that later.

      table: (header, body) -> "#{header}#{body}\n\n"

      tablerow: (content) -> content

      tablecell: (content, flags) -> content
