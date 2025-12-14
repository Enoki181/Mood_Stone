class StoneConverterController < ApplicationController
  def index; end

  def convert
    mood_value = params[:mood].to_i
    @stone = Stone.find_by_mood(mood_value)
  end
end
