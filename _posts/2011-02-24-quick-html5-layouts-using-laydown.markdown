---
layout: post
title: "Quick HTML5 layouts using Laydown"
published: true
categories: ["Ruby", "Hacking"]
---

Most of the web apps i write more or less share the same base layout. I hardly ever include body code, except possibly a wrapper. In other words, the only thing that changes from app to app are the title, icon, stylesheets, keywords, description, an esoteric head tag for some exotic purpose and so on — some of them depending on the request. So why not specify this using pure Ruby?

Laydown [Laydown](https://github.com/jbe/laydown) provides instant simple boilerplate layout templates:

{% highlight ruby %}
require 'laydown'
 
layout = Laydown.new( # using Ruby 1.9 hash syntax
  charset:      'utf-8' # default
  title:        'A man in a #{@where}',
  description:  'Very interesting',
  favicon:      'pill.png',
  keywords:     ['man', :@keywords]
 
  css:          ['site.css', :@css],
  js:           ['app.js', :@js],
  inline_js:    ['alert("#{msg}");'],
 
  head:         '<meta soundtrack="Piazzolla">',
  body:         :yield # default
  body_class:   ['dark', :@body_class],
  ga_code:      'some-google-analytics-id'
  )
 
@where    = 'cave'
@keywords = ['cave', 'interesting']
@css      = 'somesheet.css'
 
layout.render(self, :msg => 'hello') { '<p>body text</p>' }
# => your html5 layout

{% endhighlight %}

Note how symbols are converted to variable or method invocations, and string interpolations are applied when rendering.

As a bonus, laydown is faster than most template languages, and easy to integrate, thanks to [Temple](http://timeless.judofyr.net/temple) and [Tilt](https://github.com/rtomayko/tilt). [The source is on Github](https://github.com/jbe/laydown).

{% highlight bash %}
gem install laydown
{% endhighlight %}
