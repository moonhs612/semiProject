const canvas = document.getElementById('board');
const ctx = canvas.getContext('2d');
const canvasNext = document.getElementById('next');
const ctxNext = canvasNext.getContext('2d');

let accountValues = {
  score: 0,
  level: 0,
  lines: 0
};

function updateAccount(key, value) {
  let element = document.getElementById(key);
  if (element) {
    element.textContent = value;
  }
}

let account = new Proxy(accountValues, {
  set: (target, key, value) => {
    target[key] = value;
    updateAccount(key, value);
    return true;
  }
});

let requestId = null;
let time = null;



let board = new Board(ctx, ctxNext);

initNext();
showHighScores();

function initNext() {
  // Calculate size of canvas from constants.
  ctxNext.canvas.width = 4 * BLOCK_SIZE;
  ctxNext.canvas.height = 4 * BLOCK_SIZE;
  ctxNext.scale(BLOCK_SIZE, BLOCK_SIZE);
}

function addEventListener() {
  document.removeEventListener('keydown', handleKeyPress);
  document.addEventListener('keydown', handleKeyPress);
}

function handleKeyPress(event) {
  if (event.keyCode === KEY.P) {
    pause();
  }
  if (event.keyCode === KEY.ESC) {
    gameOver();
  } else if (moves[event.keyCode]) {
    event.preventDefault();
    // Get new state
    let p = moves[event.keyCode](board.piece);
    if (event.keyCode === KEY.SPACE) {
      // Hard drop
      if (document.querySelector('#pause-btn').style.display === 'block') {
          dropSound.play();
      }else{
        return;
      }
      
      while (board.valid(p)) {
        account.score += POINTS.HARD_DROP;
        board.piece.move(p);
        p = moves[KEY.DOWN](board.piece);
      }
      board.piece.hardDrop();
    } else if (board.valid(p)) {
      if (document.querySelector('#pause-btn').style.display === 'block') {
        movesSound.play();
      }
      board.piece.move(p);
      if (event.keyCode === KEY.DOWN && 
          document.querySelector('#pause-btn').style.display === 'block') {
        account.score += POINTS.SOFT_DROP;
      }
    }
  }
}



function play() {
  addEventListener();
  if (document.querySelector('#play-btn').style.display == '') {
    resetGame();
  }

  // If we have an old game running then cancel it
  if (requestId) {
    cancelAnimationFrame(requestId);
  }

  animate();
  document.querySelector('#play-btn').style.display = 'none';
  document.querySelector('#pause-btn').style.display = 'block';
  backgroundSound.play();
}

function animate(now = 0) {
  time.elapsed = now - time.start;
  if (time.elapsed > time.level) {
    time.start = now;
    if (!board.drop()) {
      gameOver();
      return;
    }
  }

  // Clear board before drawing new state.
  ctx.clearRect(0, 0, ctx.canvas.width, ctx.canvas.height);

  board.draw();
  requestId = requestAnimationFrame(animate);
}



function pause() {
  if (!requestId) {
    document.querySelector('#play-btn').style.display = 'none';
    document.querySelector('#pause-btn').style.display = 'block';
    animate();
    backgroundSound.play();
    return;
  }

  cancelAnimationFrame(requestId);
  requestId = null;

  ctx.fillStyle = 'black';
  ctx.fillRect(1, 3, 8, 1.2);
  ctx.font = '1px Arial';
  ctx.fillStyle = 'yellow';
  ctx.fillText('PAUSED', 3, 4);
  document.querySelector('#play-btn').style.display = 'block';
  document.querySelector('#pause-btn').style.display = 'none';
  sound.pause();
}




