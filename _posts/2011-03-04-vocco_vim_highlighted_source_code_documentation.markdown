---
layout: post
title: "Vocco: Vim highlighted source code documentation"
published: true
categories: ["Ruby", "Hacking"]
---

I made a Ruby gem for generating documentation using Vim. Given a Dir.glob-type string, it renders `:TOhtml` syntax highlighted html for all matching files, using local Vim settings. It also adds a drop down index menu to each file, along with notes. Markdown comments saved as `thefile.rb.md` become side notes for `thefile.rb` and so on &ndash; good for literate documentation. The note files can be kept in a separate directory (or several) if you like.

Homepage: [Vocco](http://jbe.github.com/vocco/README.html) (rendered by Vocco)

Github: [Vocco source](https://github.com/jbe/vocco)
