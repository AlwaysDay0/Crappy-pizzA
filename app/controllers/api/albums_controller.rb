class Api::AlbumsController < ApplicationController

  def index
    render json: Album.all
  end

  def show
    @album = Album.find(param