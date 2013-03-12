(function() {
  $(function() {
    var backgrounds, randomBg;
    backgrounds = ["http://farm4.static.flickr.com/3467/4570411331_f64723d3c1_o.jpg"];
    randomBg = function() {
      return backgrounds[Math.floor(Math.random() * backgrounds.length)];
    };
    $.fn.smartBackgroundImage = function(url) {
      var t;
      t = this;
      $('<img />').attr('src', url).load(function() {
        t.each(function() {
          return $(this).css('background', 'url(' + url + ') fixed no-repeat center center');
        });
        return $('#bg-fade').fadeOut(1500);
      });
      return this;
    };
    $('html').smartBackgroundImage(randomBg());
    return $("a").each(function() {
      if ((this + "") === location.href.toLowerCase()) {
        return $(this).addClass("selected");
      }
    });
  });
}).call(this);
