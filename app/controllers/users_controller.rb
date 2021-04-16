class UsersController < ApplicationController

    get '/users/:id' do
        if logged_in?
            @user = current_user
            erb :'users/show'
        else
            erb :failure
        end 
    end

    get '/users/:id/edit' do
        if logged_in?
            @user = current_user
            erb :'users/edit'
        else
            erb :failure
        end
    end 

    patch '/users/:id' do
        @user = current_user
        @user.update(username: params[:username], email: params[:email])
        redirect "/users/#{@user.id}"
    end

    delete '/users/:id' do 
        @user = current_user
        @user.delete(user: params[:username], email: params[:email])
        Library.all.where(user_id: @user.id).destroy_all
    end

end 