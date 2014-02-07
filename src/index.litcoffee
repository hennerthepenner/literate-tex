Features
========

It would be nice to convert markdown documents to tex snippets that can be 
included in LaTeX or XeTeX documents. The library marked with the TeX renderer 
should do the trick for rendering. What else is there is included:

- File watching mechanism like in the coffeescript compiler.
- Directory compiler like in the coffeescript compiler.
- derive the programming language from the file ending (e.g. litcoffee to 
  produce coffeescript code blocks).

This should be done:

- Add captions (`\caption`) and labels (`\label`) to code blocks. Add some 
  additional and unwelcomed markdown for captions and labels for blocks of 
  code?

This would be nice:

- Also output the source code without description which can than be run 
  through a compiler.
- Option to easily call compilers automatically.
- Sourcemaps for languages that support it.


Implementation
==============

The user __has to__ specify an input directory (watched) and an output 
directory.

    [node, bin, sourceBaseDir, texBaseDir] = process.argv
    if not sourceBaseDir or not texBaseDir
      console.log("Usage: literate-tex <inputDirectory> <outputDirectory>")
      return

Let's assume, we have a literate coffeescript file like so:
/projects/literate-tex/src/bla/test.litcoffee

Let's also assume, we watch the `src` directory. And let's say, we want the 
output here: /projects/literate-tex/tex/bla/test.tex

Node.js has some helpful functions in the path API:

    path = require("path")

We have to make sure, that the file:
  /projects/literate-tex/src/bla/test.litcoffee
is converted and saved at:
  /projects/literate-tex/tex/bla/test.tex

    precompile = (sourceFile, sourceBaseDir) ->
      sourceDir = path.dirname(sourceFile)
      relDir = path.relative(sourceBaseDir, sourceDir)
      texDir = path.join(texBaseDir, relDir)
      sourceFilename = path.basename(sourceFile)
      sourceExt = path.extname(sourceFilename)
      basename = path.basename(sourceFilename, sourceExt)
      texFilename = basename + ".tex"
      texFile = path.join(texBaseDir, relDir, texFilename)
      convert(sourceFile, texFile, sourceExt)
      log(relDir, sourceFilename)

The coffeescript compiler prints out the time of compilation, which is really 
helpful at times.

    log = (relDir, filename) ->
      now = new Date()
      prepend = (num) -> if num < 10 then "0#{num}" else "#{num}"
      hour = prepend(now.getHours())
      min = prepend(now.getMinutes())
      sec = prepend(now.getSeconds())
      console.log("#{hour}:#{min}:#{sec} - precompiled #{relDir}/#{filename}")

When the path to the new file and the filename itself is figured out, use it 
to do the conversion using marked and the tex renderer.

    fs = require("fs")
    marked = require("marked")
    TexRenderer = require("marked-texrenderer")

    convert = (sourceFile, texFile, ext) ->
      literate = fs.readFileSync(sourceFile, encoding: "utf8")

      opts = 
        renderer: new TexRenderer()
        defaultLanguage: "coffeescript"
        packageOptions: "[H]"
      rendered = marked(literate, opts)

      fs.writeFileSync(texFile, rendered)

The kckr project can be used to do the watching. Though it claims to be as 
fancy as the coffeescript compiler, it's not that good, but still pretty 
awesome.

    Kckr = require("kckr").Kckr

Unfortunately kckr doesn't do kickoffs (i.e. compiling everything on startup) 
and watching together. So, do it step by step. First do the kickoff run.

    opts = 
      sources: [sourceBaseDir]
      callback: precompile
      verbose: false
      pattern: /.litcoffee|.md/
      kickonce: true
    kickoff = new Kckr(opts)

And then do it again with watching.

    opts.kickonce = false
    watcher = new Kckr(opts)
