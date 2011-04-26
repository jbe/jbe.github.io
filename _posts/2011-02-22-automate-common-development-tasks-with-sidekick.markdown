---
layout: post
title: "Automate common development tasks with Sidekick"
published: true
categories: ["Ruby", "Hacking"]
---

When programming, it can be useful to automatically perform tasks on certain events. For instance, while working on a web page, you might want to

- recompile templates when they are edited
- restart dev servers when code changes
- continuously run tests, notifying via growl or libnotify
- get a reminder to take a break each hour

[Sidekick](https://github.com/jbe/sidekick) is a simple command line tool and configuration language to make things like this super extra easy.

{% highlight ruby %}
# .sidekick file
watch('**/*.rb') { restart_passenger }
auto_compile 'assets/css/*.sass', 'public/css/:name.css'
every(60*60) { notify 'one hour has passed.' }
{% endhighlight %}

{% highlight bash %}
$ gem install sidekick
$ sidekick
{% endhighlight %}

It is still beta, but i use it myself without trouble. Not tested outside Linux.

Bug reports, ideas, forks and pull requests are welcome. [Sourcecode on Github](https://github.com/jbe/sidekick).
