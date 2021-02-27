class Api::SongsController < ApplicationController

  def index
    render json: Song.all
  end

  def show 
      @song =