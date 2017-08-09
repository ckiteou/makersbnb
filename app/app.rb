ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base
  enable :sessions
  set :public_folder, 'public'

  register Sinatra::Flash

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

  get '/listings/1' do
    erb :'listings/1'
  end

  post '/listings/request' do
    Request.create(guest_name: params[:guest_name], guest_email: params[:guest_email])
    flash.next[:notice] = "Booking confirmed!"
    redirect :'listings'
  end

  get '/users/new' do
    erb :'users/new'
  end

  run! if app_file == $0
end
