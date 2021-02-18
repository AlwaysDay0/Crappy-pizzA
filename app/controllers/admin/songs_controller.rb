
class Admin::SongsController < ApplicationController
  before_action :set_songs, only: [:show, :edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def edit
  end
  
  def show
  end

  
  def create
    @song = Song.new(song_params)
    if @song.save