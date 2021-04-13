class UsersController < ApplicationController

    get '/users/:id' do
        @user = current_user
        erb :'users/show'
    end

    get '/users/:id/edit' do 
        @user = current_user
        erb :'users/edit'
    end 

    patch '/users/:id' do
        @user = current_user
        @user.update(username: params[:username], email: params[:email])
        redirect "/users/#{@user.id}"
    end

end 