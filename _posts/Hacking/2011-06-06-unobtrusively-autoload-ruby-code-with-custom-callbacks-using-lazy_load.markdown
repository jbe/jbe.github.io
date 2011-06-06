---
layout: post
title: "Unobtrusively autoload Ruby code with custom callbacks using LazyLoad"
published: true
categories:
  - Hacking
  - Ruby
link: "https://github.com/jbe/lazy_load"
---

Some times, it is useful to "soft require" Rubygems. For example, if a dependency is unavailable, we might want to fall back to another implementation. If we are lazy loading (autoloading) code as we go along, we might also want to handle load errors in a graceful way, should they arise. This particularly applies to user facing code dealing with, for instance, a lot of template engine Gems which are lazy loaded on demand without any prior gurantee of them being available.

[LazyLoad](https://github.com/jbe/lazy_load) is a simple way to lazily autoload code with callbacks in Ruby. It is a slightly more elaborate and "softer" alternative to the [autoload](http://ruby-doc.org/core/classes/Module.html#M000443) method included in Ruby.

{% highlight bash %}

gem install lazy_load

{% endhighlight %}

{% highlight ruby %}

LazyLoad.map(:Tilt, 'tilt',
  'Tilt not found. Possible fix: gem install tilt')

LazyLoad::Tilt
# => Tilt

  # or if Tilt is not available:
LazyLoad::Tilt
# => LazyLoad::DependencyError: Tilt not found. Possible fix: gem install tilt'  

{% endhighlight %}

As a bonus, LazyLoad does not monkey patch. This is because it is scoped (unlike autoload). So when you register a callback for the Foo constant, referencing `LazyLoad::Foo` will trigger the callback. Simply referencing Foo will not trigger the callback.

More samples and source code:

[LazyLoad on Github](https://github.com/jbe/lazy_load)
