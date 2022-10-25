require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.

  get '/hello' do
    @name = params[:name]
    return erb(:index)
  end

  get '/names' do
    names = params[:names]
    return names
  end

  post '/sort-names' do
    names = params[:names]
    names_array = names.split(",")
    return names_array.sort_by { |name| name[0] }.join(',')
  end

  configure :development do
    register Sinatra::Reloader
  end
end

