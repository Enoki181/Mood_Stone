document.addEventListener("DOMContentLoaded", () => {
  const layer = document.getElementById("animation-layer");
  const canvas = document.getElementById("particle-canvas");
  const content = document.getElementById("stone-content");
  const stoneWrapper = document.querySelector(".stone-image-wrapper");

  if (!layer || !canvas || !content || !stoneWrapper) return;

  const ctx = canvas.getContext("2d");
  let width, height;
  let particles = [];
  let animationId;

  /* ------------------------
     色（ゴールド＋シルバー）
  ------------------------ */
  const COLORS = [
    "rgba(255, 230, 160, 0.75)", // ペールゴールド
    "rgba(220, 220, 220, 0.7)"  // シルバー
  ];

  /* ------------------------
     光の核のサイズ
  ------------------------ */
  const CORE_MAX_RADIUS = 60;   // 最終的な核の大きさ
  const CORE_GROW_TIME = 2000;  // 成長にかける時間(ms)
  let coreStartTime = Date.now();

  /* ------------------------
     Canvas resize
  ------------------------ */
  function resize() {
    width = canvas.width = window.innerWidth;
    height = canvas.height = window.innerHeight;
  }
  resize();
  window.addEventListener("resize", resize);

  /* ------------------------
     石画像の中心座標
  ------------------------ */
  function getTargetPosition() {
    return {
      x: width / 2,
      y: height / 2 - 130
    };
  }

  /* ------------------------
     lightcore
  ------------------------ */
  function drawLightCore() {
    const { x, y } = getTargetPosition();

    const elapsed = Date.now() - coreStartTime;
    const progress = Math.min(elapsed / CORE_GROW_TIME, 1);

    // 半径を 0 → 最大値へ
    const radius = CORE_MAX_RADIUS * progress;

    if (radius <= 0) return;

    const gradient = ctx.createRadialGradient(
      x, y, 0,
      x, y, radius
    );

    gradient.addColorStop(0, `rgba(255, 240, 180, ${0.9 * progress})`);
    gradient.addColorStop(0.4, `rgba(255, 220, 150, ${0.6 * progress})`);
    gradient.addColorStop(1, "rgba(255, 220, 150, 0)");

    ctx.beginPath();
    ctx.fillStyle = gradient;
    ctx.arc(x, y, radius, 0, Math.PI * 2);
    ctx.fill();
  }


  /* ------------------------
     Particle
  ------------------------ */
  class Particle {
    constructor() {
      this.x = Math.random() * width;
      this.y = Math.random() * height;
      this.size = Math.random() * 2 + 1;
      this.speed = Math.random() * 0.02 + 0.01;
      this.color = COLORS[Math.floor(Math.random() * COLORS.length)];
    }

    update() {
      const target = getTargetPosition();
      this.x += (target.x - this.x) * this.speed;
      this.y += (target.y - this.y) * this.speed;
    }

    draw() {
      ctx.beginPath();
      ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
      ctx.fillStyle = this.color;
      ctx.fill();
    }
  }

  /* ------------------------
     init / animate
  ------------------------ */
  function init() {
    particles = [];
    for (let i = 0; i < 120; i++) {
      particles.push(new Particle());
    }
  }

  function animate() {
    ctx.clearRect(0, 0, width, height);
    particles.forEach(p => {
      p.update();
      p.draw();
    });

    // ← 粒子の上に、中心の光の塊
    drawLightCore();
    
    animationId = requestAnimationFrame(animate);
  }

  /* ------------------------
     finish
  ------------------------ */
  function finish() {
    cancelAnimationFrame(animationId);

    layer.classList.add("opacity-0");

    setTimeout(() => {
      layer.remove();

      // フェードイン
      content.classList.remove("opacity-0");
    }, 150);
  }

  /* ------------------------
     実行
  ------------------------ */
  layer.addEventListener("click", finish);

  init();
  animate();

  setTimeout(finish, 2500);
});
