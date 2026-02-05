require 'sinatra'
require 'slim'
require 'sqlite3'
require 'sinatra/reloader'
require 'bcrypt'

set :public_folder, File.dirname(__FILE__) + '/public'
set :views, File.dirname(__FILE__) + '/views'

get '/' do
	slim :home
end

get '/slots' do
	slim :slots
end

get '/live' do
	slim :live
end

get '/settings' do
	slim :settings
end

post '/settings' do
	# rudimentary handling — persist as needed
	@username = params['username']
	@notifications = params.key?('notifications')
	slim :settings
end