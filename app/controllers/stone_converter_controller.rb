class StoneConverterController < ApplicationController
  def index; end

  def convert
    mood_value = params[:mood].to_i
    stone = Stone.find_by_mood(mood_value)
    if stone
      render json: {
        name_en: stone.name_en,
        image_path: ActionController::Base.helpers.asset_path(stone.image_path),  # 画像URLを生成
        name_ja: stone.name_ja,
        description: stone.description
      }
    else
      render json: { error: "該当する石が見つかりませんでした" }, status: :not_found
    end
  end
end
