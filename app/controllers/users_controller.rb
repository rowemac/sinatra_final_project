class UsersController < ApplicationController

    get '/account' do
        @user = current_user
        erb :'users/account'
    end

    get '/account/edit'
        @user = current_user
        erb :'users/edit'
    end 

end 