---
---



$ ->

  isMac = navigator.platform.toUpperCase().indexOf('MAC') != -1
  isWindows = navigator.platform.toUpperCase().indexOf('WIN') != -1
  isLinux = navigator.platform.toUpperCase().indexOf('LINUX') != -1

  if isWindows
    subhead = $('header h2')
    subhead.css('position', 'relative')
    subhead.css('top', '-0.25em')
    
    $('#main ul.links li span').css('top', '-0.5em')

  $.fn.smartBackgroundImage = (url) ->
    t = this
    # create an img so the browser will download the image:
    $('<img />').attr('src', url).load ->
      t.each ->
        $(this).css('background', 'url('+url+') fixed no-repeat center center' )
      $('#bg-fade').fadeOut(1500)
    this

  timer = 0

  $('header.sitewide, #main').css({'position': 'relative', 'z-index': '1'})

  width = 0
  height = 0

  $(window).resize ->
    width = $('html').width()
    height = $('html').height()
    $('canvas#matrix').attr('width', width)
    $('canvas#matrix').attr('height', height)

  $(window).resize()

  enter_nerd_mode = () ->
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



  #$('html').smartBackgroundImage(randomBg())

  #$("a").each ->
  #  if (this + "") == location.href.toLowerCase()
  #    $(this).addClass("selected")


