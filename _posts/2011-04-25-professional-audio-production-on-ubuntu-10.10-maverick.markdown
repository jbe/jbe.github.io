---
layout: post
title: "Professional audio production on Ubuntu 10.10 Maverick"
published: true
categories: ["Ruby", "Hacking"]
---

Ubuntu 10.10 can be set up as a professional audio production environment without much work. There are also distributions specifically for studio use, but this "simple" solution works great for me:

1. In the terminal: `sudo apt-get install jackd qjackctl patchage ardour`

2. Run `qjackctl`. Also known as "Sound & Video -> JACK Control" in the applications menu.

3. Click “setup” -> “options” -> “Execute script after startup,” and type: `pacmd load-module module-jack-sink channels=2 & patchage &`

4. Quit and re-run `qjackctl`.

5. Open Ubuntu sound settings -> Output, and select “Jack sink”.

From now on, whenever you want the studio environment, repeat the last two steps. Use Ardour for mixing. Use Patchage (or qjackctl) to route audio and MIDI.

[Source](http://ubuntuforums.org/showthread.php?t=1640172)
