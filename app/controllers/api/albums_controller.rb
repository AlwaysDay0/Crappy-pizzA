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

  def search
    @album = Album.search(params[:search])
    if @album.empty?
      render json: @album, status: :not_found
    else
      render json: @album.as_json(except: [:id, :created_at, :updated_at])
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { message: e.message }, status: :not_found
  end

end
