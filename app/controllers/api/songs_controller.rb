class Api::SongsController < ApplicationController

  def index
    render json: Song.all
  end

  def show 
      @song = Song.find(params[:id])
      if params[:resource]
        render json: @song.send(params[:resource])
      