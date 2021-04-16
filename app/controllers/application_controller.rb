require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SECRET_KEY']
    register Sinatra::Flash 
  end

  get "/" do
    erb :'welcome'
  end

  get "/signup" do
    erb :'signup'
  end

  post "/signup" do
    if params[:username].empty? || params[:password].empty? || params[:email].empty?
      flash[:notice] = "Please fill out all fields to sign up."
      redirect "/signup"
    else 
      user = User.create(username: params[:username], password: params[:password], email: params[:email])
      redirect "/login"
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
      flash[:notice] = "Your username and/or password is invalid. Please try again."
      redirect "/login"
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
