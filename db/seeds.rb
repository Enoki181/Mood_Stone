# 既存の石データを削除
# Stone.destroy_all
#
# renderのエラーへ対応。DBが空になっているので修正。
if Stone.exists?
  puts "⏭ 既に石データが存在するため seed をスキップします"
  return
end
# -100 〜 +100 の範囲で石データを作成
stones = [
  # ネガティブ寄り（-100 〜 -15）
  {
    name_ja: "黒水晶 モリオン",
    name_en: "Morion",
    min_mood: -100,
    max_mood: -96,
    image_path: "morion.png",
    description: "ほとんど光を通さない黒色のクォーツ。微量のアルミニウムイオンを含み、放射線を受けることで発色。漆黒のものほど価値が高い。"
  },
  {
    name_ja: "煙水晶 スモーキークォーツ",
    name_en: "Smoky Quartz",
    min_mood: -95,
    max_mood: -61,
    image_path: "smoky_quartz.png",
    description: "褐色で黄灰色がかったクォーツ。微量のアルミニウムイオンを含み、放射線を受けることで発色。濃い色のものはモリオンとよばれる。"
  },
  {
    name_ja: "紫水晶 アメジスト",
    name_en: "Amethyst",
    min_mood: -60,
    max_mood: -31,
    image_path: "amethyst.png",
    description: "紫色のクォーツ。微量の鉄イオンを含み、紫色に発色。高温で加熱すると、黄色に変化する。"
  },
  {
    name_ja: "鷹目石 ホークスアイ",
    name_en: "Hawk's eye",
    min_mood: -30,
    max_mood: -16,
    image_path: "hawks_eye.png",
    description: "繊維状の鉱物が酸化せずに残り、青色に発色したクォーツ。磨くと白い光の筋が現れる。"
  },

  # 中間（-15 〜 +15）
  {
    name_ja: "水晶 クオーツ",
    name_en: "Quartz",
    min_mood: -15,
    max_mood: -13,
    image_path: "quartz_ja_twin.png",
    description: "日本式双晶のクォーツ。2つの水晶が決まった角度で結合し、ハート型に見える。V字型のものもある。"
  },
  {
    name_ja: "水晶 クオーツ",
    name_en: "Quartz",
    min_mood: -12,
    max_mood: 12,
    image_path: "quartz.png",
    description: "クォーツ。透明でインクルージョンのないものほど高品質で、透明度の高いものはレンズなどにも用いられる。"
  },
  {
    name_ja: "水晶 クオーツ",
    name_en: "Quartz",
    min_mood: 13,
    max_mood: 15,
    image_path: "quartz_ja_twin.png",
    description: "日本式双晶のクォーツ。2つの水晶が決まった角度で結合し、ハート型に見える。V字型のものもある。"
  },

  # ポジティブ寄り（+15 〜 +100）
  {
    name_ja: "砂金石 アベンチュリン",
    name_en: "Aventurine",
    min_mood: 16,
    max_mood: 30,
    image_path: "aventurine.png",
    description: "中に含む小さな鉱物がきらきらと輝く緑色のクォーツ。微量なクロムイオンなどを含み、通常は緑色に発色。"
  },
  {
    name_ja: "虎目石 タイガーアイ",
    name_en: "Tiger's eye",
    min_mood: 31,
    max_mood: 60,
    image_path: "tigers_eye.png",
    description: "酸化した繊維状の鉱物が、黄褐色に発色したクォーツ。磨くと白い光の筋が現れる。"
  },
  {
    name_ja: "黄水晶 シトリン",
    name_en: "Citrine",
    min_mood: 61,
    max_mood: 95,
    image_path: "citrine.png",
    description: "黄色のクォーツ。微量の鉄イオンが含まれ、黄色に発色。赤みがかったものや緑がかったものもある。"
  },
  {
    name_ja: "紅水晶 ローズクォーツ",
    name_en: "Rose Quartz",
    min_mood: 96,
    max_mood: 100,
    image_path: "rose_quartz.png",
    description: "淡ピンク色のクォーツ。微量のチタンイオンが含まれ、ピンク色に発色。結晶状ではなく塊状で産出しやすい。"
  }

]

stones.each do |stone_data|
  Stone.create!(stone_data)
end

puts "✨ #{Stone.count}件の石データを作成しました！"
