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

  ball = 
    x: 512
    y: 100
    r: 20
    g: 2
    vx: -4
    vy: 0
    color: "#06f"


  # 设置画布大小
  canvas.width = SCREEN_WIDTH
  canvas.height = SCREEN_HEIGHT



  ###
   * 渲染字体
   * @param {Number}  x    球距离左侧距离 
   * @param {Number}  y    球距离顶部距离
   * @param {String}  num  要渲染的数字和符号
   * @param {Object}  ctx  画布对象
   * @return
  ###
  renderDigit = (_x, _y, _num, _ctx) ->

    # 球的颜色
    _ctx.fillStyle = "rgb(0, 102, 153)"
    if _num != null
      for _index_i, _item_i in digit[_num]
        for _index_j, _item_j in digit[_num][_item_i]
          if digit[_num][_item_i][_item_j] == 1
            _ctx.beginPath()
            _ctx.arc( _x + _item_j * 2 * (RADIUS + 1) + (RADIUS + 1), _y + _item_i * 2 * (RADIUS + 1) + (RADIUS + 1), RADIUS, 0, 2 * Math.PI)
            _ctx.closePath()
            _ctx.fill()
    return


  ###
   * 渲染时间字体
   * @param {Object}  ctx  画布对象
   * @return
   * 
  ###
  renderTime = ( _Time, _ctx ) ->

    if !_Time
      return

    # 刷新画布
    _ctx.clearRect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

    # 渲染第一个字
    renderDigit(MARGIN_LEFT, MARGIN_TOP, (_Time.h[0] - 0), _ctx);

    # 渲染第二个字
    renderDigit( MARGIN_LEFT + 15*(RADIUS+1) , MARGIN_TOP, (_Time.h[1] - 0), _ctx )

    # 渲染第三个字 (冒号)
    renderDigit( MARGIN_LEFT + 30*(RADIUS + 1) , MARGIN_TOP , 10 , _ctx )

    # 渲染第四个字
    renderDigit( MARGIN_LEFT + 39*(RADIUS+1) , MARGIN_TOP , (_Time.m[0] - 0) , _ctx);

    # 渲染第五个字
    renderDigit( MARGIN_LEFT + 54*(RADIUS+1) , MARGIN_TOP , (_Time.m[1] - 0) , _ctx);

    # 渲染第六个字 (冒号)
    renderDigit( MARGIN_LEFT + 69*(RADIUS+1) , MARGIN_TOP , 10 , _ctx);

    # 渲染第七个字
    renderDigit( MARGIN_LEFT + 78*(RADIUS+1) , MARGIN_TOP , (_Time.s[0] - 0) , _ctx);

    # 渲染第八个字
    renderDigit( MARGIN_LEFT + 93*(RADIUS+1) , MARGIN_TOP , (_Time.s[1] - 0) , _ctx);
    return

  ###
   * 时间补0
   * @param {Number}  _time  时间数字
   * @return {String}        补0后的数字
  ###
  fullTime = (_time) ->
    if _time < 10
      return '0' + _time
    else
      return _time + ''

  checkNumber = (_firstTime, _lastTime, _hms, _index) ->
    if _firstTime[_hms][_index] != _lastTime[_hms][_index]
      return _lastTime[_hms][_index]
    else
      return null
    return

  ###
   * 获取变化了的数字
   * @param {String} _currentTime  当前时间
   * @param {String} _lastTime     最后时间
   * @return {String}              变化了的时间数字
  ###
  changeNumber = (_currentTime, _lastTime) ->
    if _currentTime && _lastTime
      tempDate = 
        h: [null, null]
        m: [null, null]
        s: [null, null]
      tempDate['h'][0] = checkNumber(_currentTime, _lastTime, 'h', 0)
      tempDate['h'][1] = checkNumber(_currentTime, _lastTime, 'h', 1)
      tempDate['m'][0] = checkNumber(_currentTime, _lastTime, 'm', 0)
      tempDate['m'][1] = checkNumber(_currentTime, _lastTime, 'm', 1)
      tempDate['s'][0] = checkNumber(_currentTime, _lastTime, 's', 0)
      tempDate['s'][1] = checkNumber(_currentTime, _lastTime, 's', 1)
    return tempDate

  ###
   * 倒计时
  ###
  countDown = () ->

    # 开始时间
    startTime = new Date(2014,7,26,23,53).getTime()

    # 结束时间
    endTime = new Date(2014,7,27,1,10).getTime()

    countTime = endTime - startTime

    currentTime = null

    lastTime = null

    setInterval ()->
      if countTime > 0
        tempDate = new Date(countTime)
        currentTime = 
          h: fullTime( tempDate.getHours() )
          m: fullTime( tempDate.getMinutes() )
          s: fullTime( tempDate.getSeconds() )
        lastTime = currentTime
        countTime = countTime - 1000
    , 1000

    setInterval () ->

      # 渲染倒计时
      # renderTime currentTime, context
      
      # 渲染小球

      # renderBall
      ball.x += ball.vx
      ball.y += ball.vy
      ball.vy += ball.g

      if ball.y >= SCREEN_HEIGHT - ball.r
        ball.vy = -ball.vy * .5
      
      context.fillStyle = ball.color
      context.beginPath()
      context.arc(ball.x, ball.y, ball.r, 0, 2 * Math.PI)
      context.closePath()
      context.fill()
      return
    , 50
    

    return
  countDown()





  return