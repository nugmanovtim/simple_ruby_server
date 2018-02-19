require './server.rb'
require 'byebug'
puts 'Firing up the server'
Server.new(2000).listen
