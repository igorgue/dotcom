class HomeController < ApplicationController
  COLORS = [
    'blue',
    'pink',
    'pink_blue',
    'red',
    'yellow',
    'yellow_red',
  ]

  BG_COLORS = {
    blue: "#5BB8DD",
    pink_blue: "#FD83CC",
    pink: "#FD83CC",
    red: "#E31D18",
    yellow_red: "#FED030",
    yellow: "#FED030",
  }

  AUDIO_STREAM = "/audio/monark.mp3"

  def index
    @color_list = COLORS
    @bgcolor_list = BG_COLORS

    @color = get_color params[:color]
    @image_url = image_url_from_color @color
    @bgcolor = get_bgcolor @color
    @audio_url = AUDIO_STREAM
  end

  def all_colors
    data = COLORS.map do |color|
      {imageUrl: image_url_from_color(color), bgcolor: get_bgcolor(color)}
    end 

    render :json => data
  end

  private

  def get_color color = nil
    color ? "#{color}" : "#{COLORS.sample}"
  end

  def image_url_from_color color
    "/djz/#{color}.jpg"
  end

  def get_bgcolor color
    BG_COLORS[color.to_sym]    
  end
end
