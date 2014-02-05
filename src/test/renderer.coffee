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
