require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchants.rb')
require_relative('../models/purchases.rb')
require_relative('../models/tags.rb')

also_reload( '../models/*' )

get '/purchases' do
  # @bitings = Biting.all
  # @actions = Action.all
  erb ( :"purchases/index" )
end

get '/purchases/new' do
  # @victims = Victim.all
  # @zombies = Zombie.all
  erb(:"purchases/new")
end
