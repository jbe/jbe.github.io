console.log "Hi there!"



body = document.getElementsByTagName('body')[0]
if /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)
  body.className += ' handheld'
else
  body.className += ' not-handheld'

