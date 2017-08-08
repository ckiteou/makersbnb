ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do
    "infrastructure working"
  end

  get '/listings' do
    @listings = Listing.all
    erb :'listings'
  end


  get '/listings/new' do
    erb :'new'
  end

  post '/listings' do
    Listing.create(name: params[:name])
    redirect '/listings'
  end
  run! if app_file == $0
end
