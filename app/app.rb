ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  set :public_folder, 'public'

  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/listings'
  end

  get '/listings' do
    @listings = Listing.all
    erb :'listings'
  end


  get '/listings/new' do
    erb :'new'
  end

  post '/listings' do
    Listing.create(name: params[:name],
                   description: params[:description],
                   price: params[:price])
    redirect '/listings'
  end

  post '/listings/request' do
    Request.create(guest_name: params[:guest_name], guest_email: params[:guest_email])
    flash.next[:notice] = "Booking confirmed!"
    redirect :'listings'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(first_name: params[:first_name],
                last_name: params[:last_name],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect :'listings'
    else
      flash.next[:errors] = @user.errors.full_messages
      redirect :'users/new'
    end
  end

  get '/users/login' do
    erb :'users/login'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/listings')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'users/login'
    end
  end

  get '/listings/:id' do
    @listing = Listing.get(params[:id])
    erb :'listings/dates'
  end

  # post "/listings/:id/request" do
  #   @date =
  # end
  
  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/listings'
  end

  run! if app_file == $0
end
