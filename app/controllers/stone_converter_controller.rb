class StoneConverterController < ApplicationController
  def index; end

  def convert
    mood_value = params[:mood].to_i
    @stone = Stone.find_by_mood(mood_value)

    @post_message = "今の気分に合う石、『#{@stone.name_ja}』をみつけた。"
    @post_tags = ["MoodStone",@stone.name_en].join(",")
  end
end
