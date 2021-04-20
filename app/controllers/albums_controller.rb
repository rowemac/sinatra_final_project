class AlbumsController < ApplicationController

    get '/albums' do
        @albums = Album.all
        erb :'albums/index'
    end 
    
    get '/albums/new' do 
        if logged_in?
            redirect 'library/new'
        else
            redirect '/failure'
        end 
    end
    
    post '/albums' do 
        album = Album.create(params)
        redirect "/albums/#{album.id}"
    end
    
    get '/albums/:id' do 
        @album = Album.find_by_id(params[:id])
        erb :'albums/show'
    end 
    
    get '/albums/:id/edit' do 

        redirect '/failure'

    end 
    
    # patch '/albums/:id' do 
    #     album = Album.find_by_id(params[:id])
    #     params.delete(:_method)
    #     album.update(params)
    #     redirect to "/albums/#{album.id}"
    # end
    
    # delete '/albums/:id' do
    #     if logged_in?
    #         album = Album.find_by_id(params[:id])
    #         album.delete
    #         redirect to '/albums'
    #     else
    #         redirect '/failure'
    #     end 
    # end
end
