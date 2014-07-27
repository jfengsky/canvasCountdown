do ->
  doc = document

  doc.addEventListener 'DOMContentLoaded', ->
      CountDown = ->
        self = this
        # 画布宽度
        WINDOW_WIDTH = doc.body.clientWidth

        # 画布高度
        WINDOW_HEIGHT = doc.body.clientHeight

        # 画布顶部距离
        MARGIN_TOP = 60

        # 画布左边距
        MARGIN_LEFT = Math.round(WINDOW_WIDTH/10)

        canvas = doc.getElementById('canvas')

        canvas.width = WINDOW_WIDTH

        canvas.height = WINDOW_HEIGHT

        # 画布对象
        context = canvas.getContext('2d')

        # 圆的大小
        RADIUS = Math.round(WINDOW_WIDTH * 4 / 5 / 108) - 1

        balls = []
        colors = [
          '#3be'
          '#09c'
          '#a6c'
          '#93c'
          '#9c0'
          '#690'
          '#fb3'
          '#f80'
          '#f44'
          '#c0c'
        ]

        endTime = new Date(2014,6,28,20,18,22)
        curShowTimeSeconds = 0

        ###
         * 倒计时
        ###
        @getCurrentShowTimeSeconds = ->
          curTime = new Date()
          ret = endTime.getTime() - curTime.getTime()
          ret = Math.round(ret/1000)
          if ret < 0
            ret = 0
          ret

        ###
         * 把改变的小球添加到数组中
         * @param {Number} x    每个点的x坐标
         * @param {Number} y    每个点得y坐标
         * @param {String} num  要渲染的字
        ###
        @addBalls = (x, y, num)->
          for _index_i, _item_i in digit[num]
            for _index_j, _item_j in digit[num][_item_i]
              if digit[num][_item_i][_item_j] == 1
                aBall =
                  x: x + _item_j * 2 * (RADIUS + 1) + (RADIUS + 1)
                  y: y + _item_i * 2 * (RADIUS + 1) + (RADIUS + 1)
                  g: 1.5 + Math.random()
                  vx: Math.pow(-1, Math.ceil( Math.random() * 1000 )) * 4
                  vy: -5 - Math.pow(-1, Math.ceil( Math.random() * 1000 )) * 1
                  color: colors[ Math.floor( Math.random() * colors.length) ]
                balls.push aBall
          return

        ###
         * 更新运动的小球
        ###
        @updataBalls = ->
          cnt = 0
          for _item, _index in balls
            balls[_index].x += balls[_index].vx
            balls[_index].y += balls[_index].vy
            balls[_index].vy += balls[_index].g * 0.85

            if balls[_index].y >= WINDOW_HEIGHT - RADIUS
              balls[_index].y = WINDOW_HEIGHT - RADIUS
              balls[_index].vy = - balls[_index].vy * 0.75

          for _item, _index in balls
            if balls[_index].x + RADIUS > 0 && balls[_index].x - RADIUS < WINDOW_WIDTH
              balls[cnt++] = balls[_index]

          while balls.length > Math.min(300, cnt)
            balls.pop()

          console.log balls.length
          return

        ###
         * 更新时间和小球
        ###
        @update = ->
          nextShowTimeSeconds = self.getCurrentShowTimeSeconds()

          nextHours = parseInt( nextShowTimeSeconds / 3600 )
          nextMinutes = parseInt( (nextShowTimeSeconds - nextHours * 3600) / 60)
          nextSeconds = nextShowTimeSeconds % 60

          curHours = parseInt( curShowTimeSeconds / 3600 )
          curMinutes = parseInt( (curShowTimeSeconds - nextHours * 3600) / 60)
          curSeconds = curShowTimeSeconds % 60

          if nextSeconds != curSeconds
            # 判断小时是否有改变
            if parseInt(curHours/10) != parseInt(nextHours/10)
              self.addBalls(MARGIN_LEFT + 0, MARGIN_TOP, parseInt(curHours/10))

            if parseInt(curHours%10) != parseInt(nextHours%10)
              self.addBalls(MARGIN_LEFT + 15*(RADIUS + 1), MARGIN_TOP, parseInt(curHours%10))

            # 判断分钟是否有改变
            if parseInt(curMinutes/10) != parseInt(nextMinutes/10)
              self.addBalls(MARGIN_LEFT + 39*(RADIUS + 1), MARGIN_TOP, parseInt(curMinutes/10))

            if parseInt(curMinutes%10) != parseInt(nextMinutes%10)
              self.addBalls(MARGIN_LEFT + 54*(RADIUS + 1), MARGIN_TOP, parseInt(curMinutes%10))

            # 判断秒是否有改变
            if parseInt(curSeconds/10) != parseInt(nextSeconds/10)
              self.addBalls(MARGIN_LEFT + 78*(RADIUS + 1), MARGIN_TOP, parseInt(curSeconds/10))

            if parseInt(curSeconds%10) != parseInt(nextSeconds%10)
              self.addBalls(MARGIN_LEFT + 93*(RADIUS + 1), MARGIN_TOP, parseInt(curSeconds%10))

            curShowTimeSeconds = nextShowTimeSeconds

          self.updataBalls()


          return



        ###
         * 渲染每个字
         * @param {Number} x    每个点的x坐标
         * @param {Number} y    每个点得y坐标
         * @param {String} num  要渲染的字
         * @param {Object} ctx  画布
         * @return
        ###
        @renderDigit = (x, y, num, ctx) ->
          ctx.fillStyle = '#06f'
          for _index_i, _item_i in digit[num]
            for _index_j, _item_j in digit[num][_item_i]
              if digit[num][_item_i][_item_j] == 1
                ctx.beginPath()
                ctx.arc( x + _item_j * 2 * (RADIUS + 1) + (RADIUS + 1), y + _item_i * 2 * (RADIUS + 1) + (RADIUS + 1), RADIUS, 0, 2 * Math.PI)
                ctx.closePath()
                ctx.fill()
          return

        ###
         * 渲染画布
         * @param {Object} ctx  画布
         * @return
        ###
        @render = (ctx) ->
          hours = parseInt( curShowTimeSeconds / 3600 )
          minutes = parseInt( (curShowTimeSeconds - hours * 3600) / 60 )
          seconds = curShowTimeSeconds % 60
          # 刷新画布
          ctx.clearRect(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT)

          # 渲染第一个字
          self.renderDigit(MARGIN_LEFT, MARGIN_TOP, parseInt(hours/10), ctx);

          # 渲染第二个字
          self.renderDigit( MARGIN_LEFT + 15*(RADIUS+1) , MARGIN_TOP, parseInt(hours%10), ctx )

          # 渲染第三个字 (冒号)
          self.renderDigit( MARGIN_LEFT + 30*(RADIUS + 1) , MARGIN_TOP , 10 , ctx )

          # 渲染第四个字
          self.renderDigit( MARGIN_LEFT + 39*(RADIUS+1) , MARGIN_TOP , parseInt(minutes/10) , ctx)

          # 渲染第五个字
          self.renderDigit( MARGIN_LEFT + 54*(RADIUS+1) , MARGIN_TOP , parseInt(minutes%10) , ctx)

          # 渲染第六个字 (冒号)
          self.renderDigit( MARGIN_LEFT + 69*(RADIUS+1) , MARGIN_TOP , 10 , ctx)

          # 渲染第七个字
          self.renderDigit( MARGIN_LEFT + 78*(RADIUS+1) , MARGIN_TOP , parseInt(seconds/10) , ctx)

          # 渲染第八个字
          self.renderDigit( MARGIN_LEFT + 93*(RADIUS+1) , MARGIN_TOP , parseInt(seconds%10) , ctx)

          # 绘制小球
          for _item, _index in balls
            ctx.fillStyle = balls[_index].color
            ctx.beginPath()
            ctx.arc(balls[_index].x, balls[_index].y, RADIUS, 0, 2 * Math.PI, true)
            ctx.closePath()
            ctx.fill()

          return

        ###
         * 初始化
        ###
        @init = ->
          curShowTimeSeconds = self.getCurrentShowTimeSeconds()
          setInterval ->
            self.render(context)
            self.update()
            return
          , 50
          return
        return
      new CountDown().init()