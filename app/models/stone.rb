class Stone < ApplicationRecord
  validates :name_ja, presence: true
  validates :name_en, presence: true
  validates :image_path, presence: true
  validates :min_mood, presence: true, numericality: {only_integer: true}
  validates :max_mood, presence: true, numericality: {only_integer: true}
  # mood_valueは整数だけにマッチさせる(浮動小数点数値にマッチさせない)

  # 気分値から該当する石を検索
  def self.find_by_mood(mood_value)
    where('min_mood <= ? AND max_mood >= ?', mood_value, mood_value).first
  end

  mount_uploader :image_path, StoneImageUploader
end
