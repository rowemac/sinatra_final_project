class LibrariesController < ApplicationController
    get '/library' do
        if logged_in?
            @library = current_user.albums
            erb :'libraries/index'
        else
            erb :failure
        end 
    end 
    
    get '/library/new' do 
        if logged_in?
            @user = current_user
            erb :'libraries/new'
        else
            erb :failure
        end 
    end
    
    post '/library' do 
        @album = Album.find_or_create_by(title: params[:title], artist: params[:artist])
        @library = Library.create(user_id: current_user, album_id: @album.id)
        @album.update(year: params[:year], condition: params[:condition], reissue: params[:reissue])
        redirect "/library"
    end

    get '/library/:id' do 
        if logged_in?
            @user = current_user
            @album = @user.albums.find(params[:id])
            erb :'libraries/show'
        else
            erb :failure
        end 
    end 
    
    get '/library/:id/edit' do 
        if logged_in?
            @user = current_user
            @album = @user.albums.find(params[:id])
            erb :'libraries/edit'
        else
            erb :failure
        end 
    end 
    
    patch '/library/:id' do 
        @user = current_user
        @album = @user.albums.find(params[:id])
        params.delete("_method")
        @album.update(params)
        redirect to "/library/#{@album.id}}"
    end
    
    delete '/library/:id' do
        if logged_in? 
            @library = Library.find(params[:id])
            @library.delete
            redirect to '/library'
        else
            erb :failure
        end 
    end
end 