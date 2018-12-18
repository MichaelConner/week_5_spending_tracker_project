require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchants.rb')
require_relative('../models/purchases.rb')
require_relative('../models/tags.rb')
require_relative('../models/users.rb')

also_reload( '../models/*' )

get '/users' do
  @user = User.find_by_id(1)
  @purchases = Purchase.find_all
  erb ( :"users/index" )
end
