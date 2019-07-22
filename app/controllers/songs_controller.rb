class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # songgenres = SongGenre.all.select do |sg|
    #   sg.song.id == @song.id
    # end
    # @genres = songgenres.map do |sg|
    #   sg.genre
    # end
    erb :"songs/show"
    # <%@song.genres.each do |genre|%>
    # <a href="/genres/<%=genre.slug%>"><%=genre.name%> </a>
    # <%end%>
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @song.save
    redirect "songs/:slug"
  end
end
