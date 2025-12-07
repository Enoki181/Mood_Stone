document.addEventListener('DOMContentLoaded', () => {
  const slider = document.getElementById('mood-slider');
  const moodValueDisplay = document.getElementById('mood-value');
  const findStoneBtn = document.getElementById('convert-btn');
  const modal = document.getElementById('stone-modal');
  const overlay = document.getElementById('overlay');
  const closeBtn = document.querySelector('.close-btn');

  // スライダーの値が変わったら表示を更新
  slider.addEventListener('input', (e) => {
    const value = e.target.value;
    moodValueDisplay.textContent = value;
  });

  // ボタンをクリックしたら石を探す
  findStoneBtn.addEventListener('click', () => {
    const moodValue = slider.value;
    findStone(moodValue);
  });

  // 石を探す関数
  function findStone(moodValue) {
    console.log(`気分値: ${moodValue} の石を探しています...`);
    
    // サーバーにリクエストを送る
    fetch(`/stones/search?mood=${moodValue}`)
      .then(response => response.json())
      .then(data => {
        displayStone(data);
      })
      .catch(error => {
        console.error('エラー:', error);
        alert('石の情報を取得できませんでした');
      });
  }

  // 石の情報をモーダルに表示
  function displayStone(stone) {
    const stoneInfo = document.getElementById('stone-info');
    
    stoneInfo.innerHTML = `
      <h2>${stone.name}</h2>
      <div class="stone-image">
        <img src="${stone.image_url}" alt="${stone.name}">
      </div>
      <div class="stone-details">
        <p class="stone-description">${stone.description}</p>
        <div class="stone-properties">
          <p><strong>効果:</strong> ${stone.effect}</p>
          <p><strong>対応する気分値:</strong> ${stone.mood_value}</p>
        </div>
      </div>
    `;
    
    // モーダルを表示
    modal.style.display = 'flex';
    overlay.style.display = 'block';
  }

  // モーダルを閉じる
  closeBtn.addEventListener('click', closeModal);
  overlay.addEventListener('click', closeModal);

  function closeModal() {
    modal.style.display = 'none';
    overlay.style.display = 'none';
  }
});