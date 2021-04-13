class UsersController < ApplicationController

    get '/users' do
        @users = User.all
        erb :'/users/all'
    end


end 