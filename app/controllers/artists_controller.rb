class ArtistsController < ApplicationController
    def index
        @artists = Artist.all.order('popularity DESC')
        render json: { data: @artists.as_json(except: [:spotify_id, :created_at, :updated_at]) }, status: :ok
    end

    def show
        @artist = Artist.find(params[:id])
        render json: { data: @artist.albums.as_json(except: 
                        [:created_at, :updated_at, :spotify_id, :artist_id]) }, status: :ok
    end
end