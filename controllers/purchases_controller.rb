require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchants.rb')
require_relative('../models/purchases.rb')
require_relative('../models/tags.rb')

also_reload( '../models/*' )

get '/purchases' do
  @purchases = Purchase.find_all
  erb ( :"purchases/index" )
end

post '/purchases' do
  purchase = Purchase.new(params)
  purchase.save
  redirect to("/purchases")
end

get '/purchases/new' do
  @merchants = Merchant.find_all
  @tags = Tag.find_all
  erb(:"purchases/new")
end

get '/purchases/:id' do
  @purchase = Purchase.find_by_id(params[:id])
  erb(:"purchases/show")
end

post '/purchases/:id' do
  purchase = Purchase.new(params)
  purchase.update
  redirect to "/purchases/#{params['id']}"
end

get '/purchases/:id/edit' do
  @merchants = Merchant.find_all
  @tags = Tag.find_all
  @purchase = Purchase.find_by_id(params[:id])
  erb(:"purchases/edit")
end

post '/purchases/:id/delete' do
  Purchase.delete_by_id(params[:id])
  redirect to("/purchases")
end
