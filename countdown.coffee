do ->
  doc = document

  doc.addEventListener 'DOMContentLoaded', ->
      CountDown = ->
        self = this
        # 画布宽度
        WINDOW_WIDTH = 1024

        # 画布高度
        WINDOW_HEIGHT = 768

        # 画布顶部距离
        MARGIN_TOP = 60

        # 画布左边距
        MARGIN_LEFT = 30

        canvas = doc.getElementById('canvas')

        canvas.width = WINDOW_WIDTH

        canvas.height = WINDOW_HEIGHT

        # 画布对象
        context = canvas.getContext('2d')

        # 圆的大小
        RADIUS = 8

        ball =
          x: 512
          y: 100
          r: 20
          g: 2
          vx: -4
          vy: 0
          color: '#005588'

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
         *
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
            curShowTimeSeconds = nextShowTimeSeconds
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
          ctx.fillStyle = '#00f'
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