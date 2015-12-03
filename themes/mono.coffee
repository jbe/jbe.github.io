window.ybg = (video) ->
  wrapper = document.getElementById('ybg')
  wrapper.innerHTML = ''
  frame = document.createElement('iframe')
  frame.setAttribute('frameborder', '0')
  frame.setAttribute('height', '100%')
  frame.setAttribute('width', '100%')
  frame.setAttribute('src', 'https://youtube.com/embed/' + video + '?t=0m0s&autoplay=1&controls=0&showinfo=0&autohide=1')
  wrapper.appendChild frame
