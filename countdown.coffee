do ->
  # 画布宽度
  SCREEN_WIDTH = 1024

  # 画布高度
  SCREEN_HEIGHT = 768

  doc = document

  canvas = doc.getElementById('canvas')

  context = canvas.getContext('2d')


  # 设置画布大小
  canvas.width = SCREEN_WIDTH
  canvas.height = SCREEN_HEIGHT

  for i,ti in digit[1]
    for j,tj in digit[1][ti]
      if digit[1][ti][tj] == 1
        console.log 111


  context.fillStyle = '#f60'
  context.beginPath()
  context.arc(100, 100, 50, 0, 2*Math.PI)
  context.closePath()
  #context.fill()

  return