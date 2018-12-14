require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchants.rb')
require_relative('../models/purchases.rb')
require_relative('../models/tags.rb')

also_reload( '../models/*' )

get '/merchants' do
  # @bitings = Biting.all
  # @actions = Action.all
  erb ( :"merchants/index" )
end

get '/merchants/new' do
  # @victims = Victim.all
  # @zombies = Zombie.all
  erb(:"merchants/new")
end
#
# post '/bitings' do
#   biting = Biting.new(params)
#   biting.save
#   redirect to("/bitings")
# end
#
# post '/bitings/:id/delete' do
#   Biting.destroy(params[:id])
#   redirect to("/bitings")
# end
