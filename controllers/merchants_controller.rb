require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchants.rb')
require_relative('../models/purchases.rb')
require_relative('../models/tags.rb')
require_relative('../models/users.rb')

also_reload( '../models/*' )

get '/merchants' do
  @merchants = Merchant.find_all
  erb ( :"merchants/index" )
end

post '/merchants' do
  merchant = Merchant.new(params)
  merchant.save
  redirect to("/merchants")
end

get '/merchants/new' do
  @merchants = Merchant.find_all
  erb(:"merchants/new")
end

get '/merchants/:id' do
  @merchant = Merchant.find_by_id(params[:id])
  erb(:"merchants/show")
end

post '/merchants/:id' do
  merchant = Merchant.new(params)
  merchant.update
  redirect to "/merchants/#{params['id']}"
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find_by_id(params[:id])
  erb(:"merchants/edit")
end

post '/merchants/:id/delete' do
  Merchant.delete_by_id(params[:id])
  redirect to("/merchants")
end
