class Roomba
  constructor: ->
    mybind = (fn, me)->
      ->
        fn.apply(me, arguments)
    @stage = new createjs.Stage("demoCanvas")
    @circle = new createjs.Shape()
    @circle.graphics.beginFill("red").drawCircle(0, 0, 50)
    @circle.x = 100
    @circle.y = 100
    @stage.addChild(@circle)
    @stage.update()

    createjs.Ticker.addEventListener("tick", mybind(@__handleTick, @))

  __handleTick: ->
    @circle.x += 10
    if @circle.x > @stage.canvas.width
      @circle.x = 0
    @stage.update()

window.Roomba = Roomba

