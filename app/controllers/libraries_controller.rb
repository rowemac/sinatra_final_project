class LibrariesController < ApplicationController
    get '/library' do
        if logged_in?
            @library = current_user.albums
            erb :'libraries/index'
        else
            redirect '/failure'
        end 
    end 
    
    get '/library/new' do 
        if logged_in?
            @user = current_user
            erb :'libraries/new'
        else
            redirect '/failure'
        end 
    end
    
    post '/library' do
        if params[:title].empty? || params[:artist].empty?
            flash[:notice] = "Please fill out all fields to add an album."
            redirect "/library/new"
        else
            album = Album.find_or_create_by(title: params[:title], artist: params[:artist])
            library = Library.create(user_id: current_user.id, album_id: album.id)
            album.update(year: params[:year], condition: params[:condition], reissue: params[:reissue])
            redirect "/library"
        end
    end

    get '/library/:id' do 
        @user = current_user
        if !@user.albums.where(id: params[:id]).exists?
            redirect '/failure'
        else
            if logged_in?
                @user = current_user
                if Album.where(id: params[:id]).exists?
                    @album = @user.albums.find(params[:id])
                    erb :'libraries/show'
                else
                    redirect '/failure'
                end
            else
                redirect '/failure'
            end
        end 
    end 
    
    get '/library/:id/edit' do 
        @user = current_user
        if !@user.albums.where(id: params[:id]).exists?
            redirect '/failure'
        else
            if logged_in?
                @album = @user.albums.find(params[:id])
                if @library = Library.find_by(user_id: @user.id, album_id: @album.id)
                    erb :'libraries/edit'
                else
                    redirect '/failure'
                end
            else
                redirect '/failure'
            end 
        end 
    end 
    
    patch '/library/:id' do 
        user = current_user
        album = user.albums.find(params[:id])
        params.delete(:_method)
        album.update(params)
        redirect to "/library/#{album.id}}"
    end
    
    delete '/library/:id' do
        user = current_user
        album = user.albums.find(params[:id])
        params.delete(:_method)
        album.delete
        redirect to '/library'
    end
end 