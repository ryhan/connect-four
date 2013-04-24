var board;

$(function() {

  board = new Board();
  $('body').append(board.html);
  /*
  board.addPiece(3, 1);
  board.addPiece(3, 2);
  board.addPiece(4, 1);
  */
});