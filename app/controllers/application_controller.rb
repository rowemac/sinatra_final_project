require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "vinylseshbaby"
  end

  get "/" do
    erb :'welcome'
  end

  get "/signup" do
    erb :'signup'
  end

  post "/signup" do
    if params[:username].empty? || params[:password].empty? || params[:email].empty?
      redirect "/failure"
    else 
      user = User.new(username: params[:username], password: params[:password], email: params[:email])
      redirect "/library"
    end
  end

  get "/login" do
    erb :'login'
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/library"
    else
      redirect "/failure"
    end 
  end

  get "/failure" do
    erb :'failure'
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
  

end
