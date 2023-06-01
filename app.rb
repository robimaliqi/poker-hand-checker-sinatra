require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/flash'
require_relative './lib/hand_validation'

class App < Sinatra::Base
  include PokerHand
  # set :port, 4567

  configure :development, :test do
    register Sinatra::Reloader
  end

  register Sinatra::Flash
  enable :sessions

  get '/' do
    @hand = params[:hand]
    erb(:form)
  end

  post '/check_hand' do
    flash[:notice] = hand_validation(params[:hand])
    redirect '/'
  end
end