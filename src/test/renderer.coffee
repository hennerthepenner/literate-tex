Renderer = require("../lib/renderer")
marked = require("marked")
should = require("should")


describe "Renderer", () ->
  # Helper function to make marked use the tex renderer
  render = (inputText) -> marked(inputText, renderer: new Renderer())

  ###
  # Inline rendering
  ###

  it "renders strong text to bold face", (done) ->
    render("**bla**").should.eql("\\textbf{bla}\n\n")
    render("__bla__").should.eql("\\textbf{bla}\n\n")
    done()

  it "renders emphasized text to italic", (done) ->
    render("*bla*").should.eql("\\textit{bla}\n\n")
    render("_bla_").should.eql("\\textit{bla}\n\n")
    done()

  it "renders codespan text to monotype", (done) ->
    render("`bla`").should.eql("\\texttt{bla}\n\n")
    done()

  it "renders linebreaks to linebreaks", (done) ->
    render("bla\nblub").should.eql("bla\nblub\n\n")
    done()

  it "doesn't render strikethroughs", (done) ->
    render("~~bla~~").should.eql("bla\n\n")
    done()

  it "renders links to urls", (done) ->
    # From the daring fireball markdown documentation:
    markdown = 'This is [an example](http://example.com/ "Title") inline link.'
    tex = "This is \\url{http://example.com/} inline link.\n\n"
    render(markdown).should.eql(tex)
    done()

  it "doesn't render images", (done) ->
    render("![bla](/path/to/img.jpg)").should.eql("\n\n")
    done()

  ###
  # Block rendering
  ###

  it "renders code blocks", (done) ->
    markdown = """
               This is coffeescript:

                   console.log(bla)
               """
    tex = """
          This is coffeescript:

          \\begin{listing}
          console.log(bla)
          \\end{listing}\n\n"""
    render(markdown).should.eql(tex)
    done()

  it "renders paragraphs by adding a blank line", (done) ->
    render("bla").should.eql("bla\n\n")
    done()

  it "doesn't change html", (done) ->
    render("<p>bla</p>").should.eql("<p>bla</p>")
    done()

  it "renders headings as sections and paragraphs", (done) ->
    # Setext versions
    render("bla\n===").should.eql("\\section{bla}\n\n")
    render("bla\n---").should.eql("\\subsection{bla}\n\n")
    # atx versions (but no more than 5 levels)
    render("# bla").should.eql("\\section{bla}\n\n")
    render("## bla").should.eql("\\subsection{bla}\n\n")
    render("### bla").should.eql("\\subsubsection{bla}\n\n")
    render("#### bla").should.eql("\\paragraph{bla}\n\n")
    render("##### bla").should.eql("\\subparagraph{bla}\n\n")
    render("###### bla").should.eql("bla\n\n")
    done()

  it "renders horizontal lines as page breaks", (done) ->
    render("***").should.eql("\\pagebreak\n\n")
    done()

  it "renders lists as itemized or enumerated thingy", (done) ->
    itemized = "\\begin{itemize}\n\\item bla\n\\end{itemize}\n\n"
    render("* bla").should.eql(itemized)
    render("- bla").should.eql(itemized)
    render("+ bla").should.eql(itemized)
    enumerated = "\\begin{enumerate}\n\\item bla\n\\end{enumerate}\n\n"
    render("1. bla").should.eql(enumerated)
    render("8. bla").should.eql(enumerated)
    done()

  it "doesn't render tables", (done) ->
    markdown = """
               First Header  | Second Header
               ------------- | -------------
               Content Cell  | Content Cell
               Content Cell  | Content Cell
               """
    tex = "First HeaderSecond HeaderContent CellContent CellContent CellContent Cell\n\n"
    render(markdown).should.eql(tex)
    done()
