do ->
  # 画布宽度
  SCREEN_WIDTH = 1024

  # 画布高度
  SCREEN_HEIGHT = 768

  # 画布距离顶部距离
  MARGIN_TOP = 60

  # 画布距离左侧距离
  MARGIN_LEFT = 30

  # 每个球的半径
  RADIUS = 8

  doc = document

  canvas = doc.getElementById('canvas')

  context = canvas.getContext('2d')


  # 设置画布大小
  canvas.width = SCREEN_WIDTH
  canvas.height = SCREEN_HEIGHT



  ###
   * 渲染字体
   * @param {Number}  x    球距离左侧距离 
   * @param {Number}  y    球距离顶部距离
   * @param {String}  num  要渲染的数字和符号
   * @param {Object}  ctx  画布对象
  ###
  renderDigit = (x, y, num, ctx) ->

    # 球的颜色
    ctx.fillStyle = "rgb(0, 102, 153)"

    for _index_i, _item_i in digit[num]
      console.log _item_i

      for _index_j, _item_j in digit[num][_item_i]
        if digit[num][_item_i][_item_j] == 1
          ctx.beginPath()
          ctx.arc( x + _item_j * 2 * (RADIUS + 1) + (RADIUS + 1), y + _item_i * 2 * (RADIUS + 1) + (RADIUS + 1), RADIUS, 0, 2 * Math.PI)
          ctx.closePath()
          ctx.fill()
    return

  renderDigit(MARGIN_LEFT, MARGIN_TOP, 0, context);

  return