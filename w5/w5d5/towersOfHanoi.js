var readline = require('readline');

var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function Hanoi(discs) {
  this.discs = discs;
  this.board = [[],[],[]];
  for ( var i = discs; i >= 1; i-- ) {
    this.board[0].push(i);
  }
}

Hanoi.prototype.run = function () {
  this.promptMove(function() {
    console.log('You win!');
  });
};

Hanoi.prototype.hasWon = function () {
  return this.board[1].length === this.discs
  || this.board[2].length === this.discs;
};

Hanoi.prototype.promptMove = function (completionCallback) {
  this.displayBoard();
  // var that = this;
  reader.question("Make a move! \n", function(move) {
    // console.log(move);
    move = move.split(',');
    // console.log(move);
    var fromTowerMove = Number(move[0].trim());
    // console.log(fromTowerMove);
    var toTowerMove = Number(move[1].trim());
    // console.log(toTowerMove);

    if (this.isValidMove(fromTowerMove, toTowerMove)) {
      this.moveDisc(fromTowerMove, toTowerMove);
    }
    if (!this.hasWon()){
      this.promptMove(completionCallback);
    } else {
      completionCallback();
    }
    reader.close();
  }.bind(this));
};

Hanoi.prototype.isValidMove = function (fromTower, toTower) {
  // console.log(1);
  // console.log(this.board);
  var fromTowerValue = this.board[fromTower].slice(-1);
  // console.log(2);
  // console.log(this.board);
  var toTowerValue = this.board[toTower].slice(-1);
  // console.log(3);
  // console.log(this.board);
  if ( fromTowerValue.length === 0 ) {
    return false;
  } else if ( toTowerValue.length === 0) {
    return true;
  } else{
    return toTowerValue > fromTowerValue;
  }
};

Hanoi.prototype.moveDisc = function (fromTower, toTower) {
  if (this.isValidMove(fromTower, toTower)) {
    this.board[toTower].push(this.board[fromTower].pop());
  } else {
    console.log('Invalid move');
  }
};

Hanoi.prototype.displayBoard = function () {
  console.log(this.board);
};

var h = new Hanoi(3);
h.run();
