require 'sinatra/base'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do
    "infrastructure working"
  end

  get '/listings' do
    @name = session[:name]
    erb :'listings'
  end


  get '/listings/new' do
    erb :'new'
  end

  post '/listings' do
    session[:name] = params[:name]
    redirect '/listings'
  end
  run! if app_file == $0
end
