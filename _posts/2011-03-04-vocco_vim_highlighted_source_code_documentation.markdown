---
layout: post
title: "Vocco: Vim highlighted source code documentation"
published: true
categories: ["Ruby", "Hacking"]
---

I made a Ruby gem for generating documentation using Vim. Given a Dir.glob-type string, it generates syntax highlighted html for all matching files, using local Vim settings. It also adds a drop down index menu to each file, along with notes. Markdown comments saved as `thefile.rb.md` becomes a side note for thefile.rb in the generated docs -- good for literate documentation. The note files can also be kept in a separate directory (or several).

Homepage: [Vocco](http://jbe.github.com/vocco/README.html)

Github: [Vocco source](https://github.com/jbe/vocco)
