class LibrariesController < ApplicationController
    get '/library' do
        @library = current_user.albums
        erb :'libraries/index'
    end 
    
    get '/library/new' do 
        @user = current_user
        erb :'libraries/new'
    end
    
    post '/library' do 
        @album = Album.find_or_create_by(title: params[:title], artist: params[:artist])
        @library = Library.create(user_id: current_user, album_id: @album.id)
        @album.update(year: params[:year], condition: params[:condition], reissue: params[:reissue])
        redirect "/library"
    end

    get '/library/:id' do 
        @user = current_user
        @library = @user.albums.find(params[:id])
        erb :'libraries/show'
    end 
    
    get '/library/:id/edit' do 
        @user = current_user
        @library = @user.albums.find(params[:id])
        erb :'libraries/edit'
    end 
    
    patch '/library/:id' do 
        @user = current_user
        @library = @user.albums.find(params[:id])
        @library.update(params)
        redirect to "/library/#{@library.album_id}}"
    end
    
    delete '/library/:id' do 
        @library = Library.find(params[:id])
        @library.delete
        redirect to '/library'
    end
end 