---
layout: post
title: "Professional audio production in Ubuntu 10.10 Maverick"
published: true
categories: ["Ruby", "Hacking"]
---

Ubuntu Linux can be set up for decently professional audio production without too much work. There are also specific studio distributions, but I don't want to go to another distribution only to accomplish a new task, when i already have a system installed. This is how you set up a professional audio environment based on Jack (and Ardour) on Ubuntu 10.10 Maverick Meercat:

1. Install the packages: `sudo apt-get install jackd qjackctl patchage ardour`

2. Run `qjackctl`, also known as "Applications -> Sound & Video -> JACK Control".

3. Go to "setup" -> "options" -> "Execute script after startup," and type: `pacmd load-module module-jack-sink channels=2 & patchage &`

4. Quit and re-run JACK Control.

5. Open Ubuntu sound settings -> Output, and select “Jack sink”.

From now on, whenever you need Jack, just repeat the last two steps. Use Patchage (or JACK Control) to route audio and MIDI, and Ardour to record and mix. Get some funky free plugins, and this setup is plenty for a lot of use cases. Afaik, The Jack/Ardour combo is more or less the one and only professional Linux DAW these days.

[Source](http://ubuntuforums.org/showthread.php?t=1640172)
