literate-tex
============

literate-tex is yet another precompiler for markdown flavored literate 
programming, but it focuses on the output as tex files. It's written in 
literate coffeescript.


Options
-------

Since literate-tex uses marked, you can use all the options available in 
marked. In addition to that there are a few more:

__`packageName`__ (`String`): Name of the package to be used for the 
environment for code blocks. Examples are `verbatim` (this is what pandoc 
uses), `lstlisting`, `listing`. Defaults to `listing`.

__`packageOptions`__ (`String`): Options to be passed to the environment for 
code blocks, e.g. `H` for positioning on the page. Defaults to none.

__`resetLineNumbers`__ (`true`|`false`): Whether or not to reset the line 
number on the next block of code. When a document contains several blocks of 
code, usually the line numbers start over beginning with 1. Defaults to `true`.

__`minted`__ (`Object`): Hash of options to be passed to minted. Defaults to 
`{linenos: true, bgcolor: "codebg", firstnumber: 1}`.
