# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

#use Rack::Session::Cookie, :key => 'rack.session', :path => '/', :expire_after => 14400, :secret => '6as1d6a1da64169fa1daf4wrfe41g698v65sa6z1cv6ad1'

run Rails.application
