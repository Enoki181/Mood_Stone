document.addEventListener('turbo:load', () => {
  const slider = document.getElementById('mood-slider');
  const moodValueDisplay = document.getElementById('mood-value');
  const findStoneBtn = document.getElementById('find-btn');

  if (!slider) return;

  // スライダーの値が変わったら表示を更新
  slider.addEventListener('input', (e) => {
    moodValueDisplay.textContent = slider.value;
  });

  // ボタンをクリックしたら石を探す
  findStoneBtn.addEventListener('click', () => {
    const moodValue = slider.value;
    window.location.href = `/stone_converter/convert?mood=${moodValue}`;
  });
});