---
---



$ ->

  $.fn.smartBackgroundImage = (url) ->
    t = this
    # create an img so the browser will download the image:
    $('<img />').attr('src', url).load ->
      t.each ->
        $(this).css('background', 'url('+url+') fixed no-repeat center center' )
      $('#bg-fade').fadeOut(1500)
    this

  $('html').smartBackgroundImage(randomBg())

  $("a").each ->
    if (this + "") == location.href.toLowerCase()
      $(this).addClass("selected")

