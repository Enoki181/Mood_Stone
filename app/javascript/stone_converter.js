document.addEventListener('DOMContentLoaded', () => {
  const slider = document.getElementById('mood-slider');
  const moodValueDisplay = document.getElementById('mood-value');
  const findStoneBtn = document.getElementById('find-btn');
  const modal = document.getElementById('stone-modal');
  const overlay = document.getElementById('overlay');
  const closeBtn = document.querySelector('.close-btn');

  // スライダーの値が変わったら表示を更新
  slider.addEventListener('input', (e) => {
    moodValueDisplay.textContent = slider.value;
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
    fetch(`/stone_converter/convert?mood=${moodValue}`)
      .then(response => response.json())
      .then(data => {
        displayStone(data);
      })
      .catch(error => {
        console.error('エラー:', error);
        alert('石の情報を取得できませんでした');
      });
  }

  // モーダルに石の情報を表示
  function displayStone(data) {
    // データを表示
    document.getElementById('stone-image').src = data.image_path;
    document.getElementById('stone-name-en').textContent = data.name_en;
    document.getElementById('stone-name-ja').textContent = data.name_ja;
    document.getElementById('stone-description').textContent = data.description;
    
    // モーダルとオーバーレイを表示
    modal.classList.add('active');
    overlay.classList.add('active');
  }

  // モーダルを閉じる関数
  function closeModal() {
    modal.classList.remove('active');
    overlay.classList.remove('active');
  }

  // 閉じるボタンのクリック処理
  closeBtn.addEventListener('click', (e) => {
    e.stopPropagation(); // イベントの伝播を止める
    closeModal();
  });

  // オーバーレイのクリック処理（背景をクリックしたら閉じる）
  overlay.addEventListener('click', () => {
    closeModal();
  });

  // モーダル内をクリックしても閉じないようにする
  modal.addEventListener('click', (e) => {
    e.stopPropagation(); // クリックイベントがオーバーレイに伝わらないようにする
  });
});