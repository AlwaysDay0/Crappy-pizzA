
class Admin::AlbumsController < ApplicationController
  before_action :set_albums, only: [:show, :edit, :update, :destroy, :add_record, :save_record]

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def edit
  end
  
  def show
  end

  def add_record
  end

  def save_record
    @artist = Artist.find(params[:album][:artist_ids])
    @song = Song.find(params[:album][:song_ids])
    @album.songs << @song
    @album.artists << @artist
    @artist.songs << @song
    redirect_to admin_albums_path, notice: "Song and artist were added to the #{@album.title}"
  end
  
  def create
    @album = Album.new(albums_params)
    if @album.save
      redirect_to admin_album_path(@album), notice: 'Album was successfully created.'
    else
      render :new
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(albums_params)
      redirect_to admin_album_path(@album), notice: 'Album was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to admin_albums_path, notice: 'Album was successfully destroyed.'
  end

  private
  def set_albums
    @album = Album.find(params[:id])
  end

  def albums_params
    params.require(:album).permit(:title)
  end
end