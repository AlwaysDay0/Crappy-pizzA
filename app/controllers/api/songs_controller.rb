class Api::SongsController < ApplicationController

  def index
    render json: Song.all
  end

  def show 
      @song = Song.find(params[:id])
      if params[:resource]
        render json: @song.send(params[:resource])
      else
        render json: @song.as_json(except: [:created_at, :updated_at])
      end
  end
end
  