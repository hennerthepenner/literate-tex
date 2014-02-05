Renderer = require("../lib/renderer")
marked = require("marked")
should = require("should")


describe "Renderer", () ->
  # Helper function to make marked use the tex renderer
  render = (inputText) -> marked(inputText, renderer: new Renderer())

  it "renders paragraphs by adding a blank line", (done) ->
    render("bla").should.eql("bla\n\n")
    done()

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
