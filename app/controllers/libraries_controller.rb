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
        @library = Library.create(params)
        redirect "/library/#{@library.id}"
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
        @album = @user.albums.find(params[:id])
        @library.update(params)
        redirect to "/library/#{@album.id}"
    end
    
    delete '/library/:id' do 
        @library = Library.find_by_id(params[:id])
        @library.delete
        redirect to '/library'
    end
end 