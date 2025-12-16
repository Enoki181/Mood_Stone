class StoneConverterController < ApplicationController
  def index; end

  def convert
    mood_param = params[:mood]

    unless mood_param.present? && mood_param.match?(/\A-?\d+\z/)
      redirect_to root_path, alert: "気分の値が正しくありません"
      return
    end

    mood_value = mood_param.to_i

    unless (-100..100).include?(mood_value)
      redirect_to root_path, alert: "気分の値が正しくありません"
      return
    end

    @stone = Stone.find_by_mood(mood_value)

    @post_message = "今の気分に合う石、『#{@stone.name_ja}』をみつけた。"
    @post_tags = "MoodStone"
  end
end
