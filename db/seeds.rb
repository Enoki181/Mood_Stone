# 既存の石データを削除
Stone.destroy_all

# -100 〜 +100 の範囲で石データを作成
stones = [
  # ネガティブ寄り（-100 〜 -15）
  {
    name_ja: "黒水晶 モリオン",
    name_en: "Morion",
    min_mood: -100,
    max_mood: -96,
    image_path: "morion.jpg",
    description: "ほとんど光を通さない黒色のクォーツ　石言葉：魔除け"
  },
  {
    name_ja: "煙水晶 スモーキークォーツ",
    name_en: "Smoky Quartz",
    min_mood: -95,
    max_mood: -61,
    image_path: "morion.jpg",
    description: "褐色で黄灰色がかったクォーツ　石言葉：癒し"
  },
  {
    name_ja: "紫水晶 アメジスト",
    name_en: "Amethyst",
    min_mood: -60,
    max_mood: -31,
    image_path: "amethyst.jpg",
    description: "深い紫色のクォーツ　石言葉：心の平和"
  },
  {
    name_ja: "鷹目石 ホークスアイ",
    name_en: "Hawk's eye",
    min_mood: -30,
    max_mood: -16,
    image_path: "hawks_eye.jpg",
    description: "磨くと白い光の筋が現れる青色のクォーツ　石言葉：冷静"
  },

  # 中間（-15 〜 +15）
  {
    name_ja: "水晶 クオーツ",
    name_en: "Quartz",
    min_mood: -15,
    max_mood: 15,
    image_path: "quartz.jpg",
    description: "透明でインクルージョンのないクォーツ　石言葉：純粋"
  },

  # ポジティブ寄り（+15 〜 +100）
  {
    name_ja: "砂金石 アベンチュリン",
    name_en: "Aventurine",
    min_mood: 16,
    max_mood: 30,
    image_path: "aventurine.jpg",
    description: "含有する小さな鉱物が輝く緑色のクォーツ　石言葉：心の安定"
  },
  {
    name_ja: "虎目石 タイガーアイ",
    name_en: "Tiger's eye",
    min_mood: 31,
    max_mood: 60,
    image_path: "tigers_eye.jpg",
    description: "磨くと白い光の筋が現れる黄褐色のクォーツ　石言葉：決断力"
  },
  {
    name_ja: "黄水晶 シトリン",
    name_en: "Citrine",
    min_mood: 61,
    max_mood: 95,
    image_path: "citrine.jpg",
    description: "透き通った黄色のクォーツ　石言葉：成功"
  },
  {
    name_ja: "紅水晶 ローズクォーツ",
    name_en: "Rose Quartz",
    min_mood: 96,
    max_mood: 100,
    image_path: "rose_quartz.jpg",
    description: "淡いピンク色のクォーツ　石言葉：美と健康"
  }

]

stones.each do |stone_data|
  Stone.create!(stone_data)
end

puts "✨ #{Stone.count}件の石データを作成しました！"
