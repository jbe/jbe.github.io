




$ ->

  backgrounds = [
    "http://farm5.static.flickr.com/4045/4571342018_b4ec986e58_o.jpg"
    "http://farm5.static.flickr.com/4046/4571321784_e83c23276f_o.jpg"
    "http://farm4.static.flickr.com/3479/4571338740_8599866219_o.jpg"
    "http://farm4.static.flickr.com/3535/4570625161_1cfdc5b7c6_o.jpg"
    "http://farm5.static.flickr.com/4017/4570511073_d5b0ef0a3a_o.jpg"
    "http://farm5.static.flickr.com/4056/4571113662_8bce32df9b_o.jpg"
    "http://farm4.static.flickr.com/3488/4570471883_7444d138f7_o.jpg"
    "http://farm4.static.flickr.com/3467/4570411331_f64723d3c1_o.jpg"
    "http://farm3.static.flickr.com/2724/4256785954_3efb21c8c3_o.jpg"
    "http://farm3.static.flickr.com/2751/4149716761_fa20eb04e7_o.jpg"
    "http://farm3.static.flickr.com/2739/4150485674_386a913ae9_o.jpg"
  ]

  randomBg = ->
    backgrounds[Math.floor( Math.random() * backgrounds.length )]


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

