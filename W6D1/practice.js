document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById("myCanvas");
  canvas.height = 500;
  canvas.width = 500;
  let ctx = canvas.getContext('2d');
  ctx.fillStyle = 'green';
  ctx.fillRect(10, 10, 100, 200);
  ctx.beginPath();
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 10;
  ctx.arc(100, 100, 40, 0, 2 * Math.PI);
  ctx.stroke();
  ctx.fillStyle = 'yellow';
  ctx.fill();
  
  // let x = 10;
  // let y = 10;
  // let h = 100;
  // let w = 200;
  // function draw(x, y) {
  //   ctx.clearRect(0, 0, 500, 500);
  //   ctx.beginPath();
  //   ctx.fillStyle = 'green';
  //   ctx.fillRect(x, y, h, w);
  // }
  // function animate() {
  //   window.setTimeout(function() {
  //     x += 5;
  //     y += 5;
  //     h += 5;
  //     w += 5;
  //     console.log(x, y);
  //     draw(x, y);
  //     animate();
  //   }, 200);
  // }
  //
  // animate();

});





// --> PUT THIS CODE BACK IN aT lINE 6 <--
// --> TO SEE THE CICLE AND RECTANGLE <--
