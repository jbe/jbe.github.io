---
---


timed_loop = (interval, times, fun) ->
  counter = 0
  timer = false
  payload = () ->
    if counter < times
      fun(counter)
      counter += 1
    else
      clearInterval(timer)
  timer = setInterval(payload, interval)

Josse =
  swap_bg: (url) ->
    load_image = () ->
      $("html").css('background-image', 'url('+url+')' )
      timed_loop 30, 40, (i) ->
        $('body').css("background-color", "rgba(4, 4, 4, " + (1 - i / 40) + ")")

    loaded = false
    faded = false
    $('<img />').attr('src', url).load ->
      loaded = true
      load_image if faded
    timed_loop 30, 40, (i) ->
      $('body').css("background-color", "rgba(4, 4, 4, " + (i / 40) + ")")
      if i == 39
        faded = true
        load_image() if loaded





$ ->

  isMac = navigator.platform.toUpperCase().indexOf('MAC') != -1
  isWindows = navigator.platform.toUpperCase().indexOf('WIN') != -1
  isLinux = navigator.platform.toUpperCase().indexOf('LINUX') != -1

  if isWindows
    subhead = $('header h2')
    subhead.css('position', 'relative')
    subhead.css('top', '-0.25em')
    
    $('#main ul.links li span').css('top', '0')

  
  timer = 0

  $('header.sitewide, #main').css({'position': 'relative', 'z-index': '1'})

  width = 0
  height = 0

  set_background = false

  $(window).resize ->
    width = $('html').width()
    height = $('html').height()
    $('canvas#matrix').attr('width', width)
    $('canvas#matrix').attr('height', height)


    if width >= 1000 and !set_background
      Josse.swap_bg("https://farm5.staticflickr.com/4082/4880605810_0104158039_o_d.jpg")
      set_background = true

  $(window).resize()

  enter_nerd_mode = () ->
    #$('.nerd-mode').after("<iframe width='100%' height='20' scrolling='no' frameborder='no' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/181874646&amp;color=ff5500&amp;inverse=false&amp;auto_play=false&amp;show_user=true'></iframe>")
    $('body').prepend("<canvas id='matrix' style='position: fixed; height: 100%; width: 100%; z-index: 0;'></canvas>")
    $('canvas#matrix').attr('width', width)
    $('canvas#matrix').attr('height', height)
    c1 = document.getElementById("matrix")
    ctx1 = c1.getContext("2d")


    yPositions = Array(300).join(0).split('')

    Matrix = () ->
      ctx1.fillStyle='rgba(0,0,0,.05)'
      ctx1.fillRect(0,0,width,height)
      ctx1.fillStyle="#0f0"
      ctx1.font = '8pt Georgia';

      yPositions.map (y, index) ->
        text = String.fromCharCode(1e2+Math.random() * 33)
        x = (index * 10) + 10
        ctx1.fillText(text, x, y)
        if y > 100 + Math.random() * 1e4
          yPositions[index]=0
        else
          yPositions[index] = y + 10

    timer = setInterval(Matrix, 30)

  leave_nerd_mode = () ->
    clearInterval(timer)
    $('canvas#matrix').remove()

  nerd = false

  $('#nerd-mode-button').click () ->
    if width > 600
      nerd = not nerd
      if nerd then enter_nerd_mode() else leave_nerd_mode()
    else
      alert('Nerd mode is only available on large screens.')

###
  $("body a").each (i, elm) ->
    href = $(elm).attr('href')
    console.log(href)
    if href.indexOf("//" == -1) or href.indexOf("localhost" != -1)
      $(elm).click (event) ->
        event.preventDefault()
        console.log href
        jqxhr = $.get href, (data) ->
          console.log(data)
        jqxhr.fail ->
          console.log("fail!")
          window.location = href
        #jqxhr.always ->
###



