
class Api::ArtistsController < ApplicationController
  def index
    render json: Artist.all
  end
  def show
    @artist = Artist.find(params[:id])
    if params[:resource]
      render json: @artist.send(params[:resource])
    else
      render json: @artist.as_json(except: [:created_at, :updated_at])
    end
  end
  def search
    artist = Artist.search(params[:search])
    if artist.empty?
      render json: artist, status: :not_found
    else
      render json: artist.as_json(except: [:id, :created_at, :updated_at])
    end
  end
  rescue_from ActiveRecord::RecordNotFound do |e|
      render json: { message: e.message }, status: :not_found
	end
end