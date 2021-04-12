class AlbumsController < ApplicationController

    get '/albums' do
        @albums = Album.all
        erb :index
    end 
    
    get '/albums/new' do 
        erb :new
    end
    
    post '/albums' do 
        @album = Album.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
        redirect "/albums/#{@Album.id}"
    end
    
    get '/albums/:id' do 
        @album = Album.find_by_id(params[:id])
        erb :show
    end 
    
    get '/albums/:id/edit' do 
        @album = Album.find_by_id(params[:id])
        erb :edit
    end 
    
    patch '/albums/:id' do 
        @album = Album.find_by_id(params[:id])
        @album.update(params)
        redirect to "/albums/#{@Album.id}"
    end
    
    delete '/albums/:id' do 
        @album = Album.find_by_id(params[:id])
        @album.delete
        redirect to '/albums'
    end
end
