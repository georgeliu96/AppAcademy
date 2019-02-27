class ArtworksController < ApplicationController
    def index
        @artworks = Artwork.all
        render json: @artworks, status: 200
    end

    def create
        @artworks = Artwork.new(artwork_params)
        if @artworks.save
            render json: @artworks, status: 200
        else
            render json: @artworks.errors.full_messages, status: 422
        end
    end

    def show
        @artworks = Artwork.find(params[:id])
        render json: @artworks, status: 200
    end

    def update 
        @artworks = Artwork.find(params[:id])
        if @artworks.update(artwork_params)
            render json: @artworks, status: 200 
        else 
            render json: @artworks.errors.full_messages, status: 422
        end 
    end
    
    def destroy
        @artworks = Artwork.find(params[:id])
        @artworks.delete
        render json: @artworks, status: 200 
    end
    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end