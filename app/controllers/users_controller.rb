class UsersController < ApplicationController
    get '/signup' do
        erb :signup
    end
        
    post "/signup" do
        user = User.new(username: params[:username], password: params[:password])
        if user.params[:username].empty? || user.params[:password].empty?
          redirect "/signup"
        else 
          redirect "/albums"
        end
    end

end 