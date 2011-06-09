---
layout: post
title: "Unobtrusively autoload Ruby code with custom callbacks using LazyLoad"
published: true
categories:
  - Hacking
  - Ruby
link: "https://github.com/jbe/lazy_load"
---

[LazyLoad](https://github.com/jbe/lazy_load) is a simple way to lazily autoload code with callbacks. It is a slightly more elaborate and "softer" alternative to the [autoload](http://ruby-doc.org/core/classes/Module.html#M000443) method included in Ruby.

{% highlight bash %}

gem install lazy_load

{% endhighlight %}

{% highlight ruby %}

  LazyLoad.map(:Tilt, 'tilt',
    'Tilt not found. Possible fix: gem install tilt')

  # or equivalent with a callback:

  LazyLoad.map(:Tilt) do
    begin
      require 'tilt'
      Tilt
    rescue LoadError
      raise(LazyLoad::DependencyError,
        'Tilt not found. Possible fix: gem install tilt')
    end
  end

  Tilt
  # => NameError: uninitialized constant Object::Tilt

  LazyLoad::Tilt
  # => Tilt

  # or if Tilt is not available:
  LazyLoad::Tilt
  # => LazyLoad::DependencyError: Tilt not found. Possible fix: gem install tilt'

  LazyLoad::Foo
  # => NameError: uninitialized constant LazyLoad::Foo

{% endhighlight %}

As a bonus, LazyLoad does not monkey patch. This is because it is scoped (unlike autoload). So when you register a callback for the Foo constant, referencing `LazyLoad::Foo` will trigger the callback. Simply referencing `Foo` will not trigger the callback.

More samples and source code:

[LazyLoad on Github](https://github.com/jbe/lazy_load)
