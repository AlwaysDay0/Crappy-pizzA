class Api::AlbumsController < ApplicationController

  def index
    render json: Album.all
  end

  def show
    @album = Album.find(params[:id])
    if params[:resource]
      render json: @album.send(params[:resource])
    else
      render json: @album.as_json(except: [:created_at, :updated_at])
    end
  end

  def searc