class Admin::ArtistsController < ApplicationController
  
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def edit
  end

  def show
  end

  def create
    @artist = Artist.new(artists_params)
    if @artist.save
      redirect_to admin_artist_path(@artist), notice: 'artist was successfully created.'
    else
      render :new
    end
  end

  def update
    if @artist.update(artists_params)
      redirect_to admin_artist_path(@artist), notice: 'artist was successfully updated.'
    else
      render :edit
    end
  end

 
  def destroy
    @artist.destroy
    redirect_to admin_artists_path, notice: 'artist was successfully destroyed.'
  end

  private
  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artists_params
    params.require(:artist).permit(:name ,:age)
  end
end