require 'rails_helper'

describe Api::SongsController do
  before do
    @song = Song.create(
      title: "Song1",
      duration