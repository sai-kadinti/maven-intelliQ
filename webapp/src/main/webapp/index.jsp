<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Snake Game</title>
  <style>
    body {
      background: #000;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    canvas {
      background: #fff;
      border: 2px solid #000;
    }
  </style>
</head>
<body>
  <canvas id="game" width="400" height="400"></canvas>

  <script>
    const canvas = document.getElementById('game');
    const ctx = canvas.getContext('2d');
    const size = 20;
    let snake = [{ x: 200, y: 200 }];
    let food = { x: 100, y: 100 };
    let dx = size, dy = 0;

    document.addEventListener('keydown', e => {
      if (e.key === 'ArrowUp' && dy === 0) [dx, dy] = [0, -size];
      else if (e.key === 'ArrowDown' && dy === 0) [dx, dy] = [0, size];
      else if (e.key === 'ArrowLeft' && dx === 0) [dx, dy] = [-size, 0];
      else if (e.key === 'ArrowRight' && dx === 0) [dx, dy] = [size, 0];
    });

    function draw() {
      ctx.clearRect(0, 0, 400, 400);
      snake.forEach((s, i) => {
        ctx.fillStyle = i ? 'lime' : 'green';
        ctx.fillRect(s.x, s.y, size, size);
      });
      ctx.fillStyle = 'red';
      ctx.fillRect(food.x, food.y, size, size);

      let head = { x: snake[0].x + dx, y: snake[0].y + dy };

      if (head.x === food.x && head.y === food.y) {
        food = { x: Math.floor(Math.random() * 20) * size, y: Math.floor(Math.random() * 20) * size };
      } else {
        snake.pop();
      }

      if (head.x < 0 || head.x >= 400 || head.y < 0 || head.y >= 400 || snake.some(s => s.x === head.x && s.y === head.y)) {
        clearInterval(game);
        alert('Game Over!');
      }

      snake.unshift(head);
    }

    let game = setInterval(draw, 100);
  </script>
</body>
</html>
