Renderer = require("../lib/renderer")
marked = require("marked")


describe "Renderer", () ->
  # Helper function to make marked use the tex renderer
  render = (inputText) -> marked(inputText, renderer: new Renderer())

  it "renders strong text to bold face", (done) ->
    render("**text**").should.eql("\\textbf{text}")
    render("__text__").should.eql("\\textbf{text}")
    done()
