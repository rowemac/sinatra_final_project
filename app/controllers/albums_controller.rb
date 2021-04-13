class AlbumsController < ApplicationController

    get '/albums' do
        @albums = Album.all
        erb :'albums/index'
    end 
    
    get '/albums/new' do 
        erb :'albums/new'
    end
    
    post '/albums' do 
        @album = Album.create(params)
        redirect "/albums/#{@album.id}"
    end
    
    get '/albums/:id' do 
        @album = Album.find_by_id(params[:id])
        erb :'albums/show'
    end 
    
    get '/albums/:id/edit' do 
        @album = Album.find_by_id(params[:id])
        erb :'albums/edit'
    end 
    
    patch '/albums/:id' do 
        @album = Album.find_by_id(params[:id])
        @album.update(params)
        redirect to "/albums/#{@album.id}"
    end
    
    delete '/albums/:id' do 
        @album = Album.find_by_id(params[:id])
        @album.delete
        redirect to '/albums'
    end
end
