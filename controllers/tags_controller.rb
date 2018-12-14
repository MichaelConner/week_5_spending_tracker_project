require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchants.rb')
require_relative('../models/purchases.rb')
require_relative('../models/tags.rb')

also_reload( '../models/*' )

get '/tags' do
  # @bitings = Biting.all
  # @actions = Action.all
  erb ( :"tags/index" )
end

get '/tags/new' do
  # @victims = Victim.all
  # @zombies = Zombie.all
  erb(:"tags/new")
end
