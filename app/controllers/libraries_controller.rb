class LibrariesController < ApplicationController
    get '/library' do
        @library = current_user.albums
        erb :'library/index'
    end 
    
    get '/library/new' do 
        @user = current_user
        erb :'library/new'
    end
    
    post '/library' do 
        @album = Album.create(params)
        redirect "/library/#{@album.id}"
    end
    
    get '/library/:id' do 
        @user = current_user
        @album = @user.albums.find(params[:id])
        erb :'library/show'
    end 
    
    get '/library/:id/edit' do 
        @user = current_user
        @album = @user.albums.find(params[:id])
        erb :'library/edit'
    end 
    
    patch '/library/:id' do 
        
        @album = @user.albums.find(params[:id])
        @album.update(params)
        redirect to "/library/#{@album.id}"
    end
    
    delete '/library/:id' do 
        @album = Album.find_by_id(params[:id])
        @album.delete
        redirect to '/library'
    end
end 