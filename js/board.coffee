# board.coffee

class Board

  constructor: () ->
    @rows = 6
    @currentPlayer = 1
    @columns = 6
    @_createHtml()
    @_createGrid()

  switchPlayer: () ->
    if @currentPlayer == 1
      @currentPlayer = 2
    else
      @currentPlayer = 1
    
  _createHtml: () ->
    @html = $ "<div class='board' id='board' />"
    for c in [1 .. @columns]
      column = $ "<div class='column' data-column-num='#{c}'/>"
      for [1 .. @rows]
        circle = $ "<div class='circle' />"
        column.append circle
      column.bind 'touchstart', (e) => @pick $(e.delegateTarget).data("column-num")
      @html.append column

  _createGrid: () ->
    @grid = [ ]
    for [1 .. @columns] 
      @grid.push (@rows - 1)

  pick: (i) -> 
    @addPiece (i-1), @currentPlayer
    @switchPlayer()

  addPiece: (column, player) ->
    row = @grid[column]
    @grid[column]--
    @_placePiece(column, row, player)

  _placePiece: (column, row, player) ->
    piece = $ "<div class='piece red' />"
    if player != 1
      piece = $ "<div class='piece yellow' />"

    top = 59 + 104*row + "px"
    left = 73 + 100*column + "px"

    piece.css {top, left}
    @html.append piece
    
