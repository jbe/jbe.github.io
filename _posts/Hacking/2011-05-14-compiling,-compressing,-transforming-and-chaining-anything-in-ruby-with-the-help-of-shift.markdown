---
layout: post
title: "Compile, compress, transform and chain anything using Shift and Ruby"
published: true
categories:
  - Hacking
  - Ruby
---

I use [Tilt](https://github.com/rtomayko/tilt) a lot. One of the great things about it is how it makes it trival to support a lot of template languages. It also binds the compiled template inside a method in a neat way (known as "method compilation"), resulting in speedy rendering. I use Tilt for many weird tasks of all kinds.

However, Tilt only knows about two-step compilation (eg. compile, render). That is hardly ever a problem, except when I want to do something fancy with the intermediate format (the compiled template), like saving it to disk and loading it later, or manipulating it in some way. Those cases exist too. Furthermore, Tilt supports one-step formats like [Sass](http://sass-lang.com/) and [CoffeeScript](http://jashkenas.github.com/coffee-script/), but in Tilt they compile in two steps.

What if we supported n-step compilation as a part of the template interface? Then we could do `source_haml_template.compile(options).render(scope)` and `source_sass_template.compile`. We could even do `coffe_script.compile.minify`. Within a template interface framework, this is a semantic way to represent compilation.

And not just compilation, but any transformation. The [Temple](http://timelessrepo.com/temple) Gem thinks of template compilation as a many-step process, through different compilers, down to base abstraction bytecode, and then to compiled Ruby code which is fed to Tilt. These are very compatible ideas.

[Anyway, this is Shift:](https://github.com/jbe/shift)

{% highlight ruby %}

Shift.read('cup.coffee').compile.minify.write
# writes to cup.min.js :)

# Or crazier:
(Shift.read('sheet.sass').compile << '/* pidgeon */').gzip.write

{% endhighlight %}

It does more, but this illustrates the basic idea. In the above example, the interfaces are determined automatically based on the format. Each format can have any number of different actions, so `.compile`, `.minify` and `.gzip` are by no means the only things you can do. As we pass through the chain, the format changes, making sure the actions map to the right interfaces.

I have not started writing interfaces for template languages like Haml, ERB and friends yet. We'll see where attention flows. Contributions and opinions are very welcome. Check out [the project on Github](https://github.com/jbe/shift).
