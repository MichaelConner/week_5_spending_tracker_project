require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchants.rb')
require_relative('../models/purchases.rb')
require_relative('../models/tags.rb')
require_relative('../models/users.rb')

also_reload( '../models/*' )

get '/purchases' do
  @merchants = Merchant.find_all
  @tags = Tag.find_all
  @purchases = Purchase.find_all
  @user = User.find_by_id(1)
  erb ( :"purchases/index" )
end

post '/purchases' do
  purchase = Purchase.new(params)
  purchase.save
  redirect to("/purchases")
end

get '/purchases/reverse' do
  @merchants = Merchant.find_all
  @tags = Tag.find_all
  @purchases = Purchase.find_all_reverse
  @user = User.find_by_id(1)
  erb ( :"purchases/reverse" )
end

get '/purchases/merchant/:merchant' do
  @merchants = Merchant.find_all
  @tags = Tag.find_all
  @merchant_name = (params[:merchant_name])
  @purchases = Purchase.find_by_merchant(params[:merchant_name])
  @total = Purchase.sum_all_merchant(params[:merchant_name])
  @user = User.find_by_id(1)
  erb ( :"purchases/merchant" )
end

get '/purchases/tag/:tag' do
  @merchants = Merchant.find_all
  @tags = Tag.find_all
  @tag_type = (params[:tag_type])
  @purchases = Purchase.find_by_tag(params[:tag_type])
  @total = Purchase.sum_all_tag(params[:tag_type])
  @user = User.find_by_id(1)
  erb ( :"purchases/tag" )
end

get '/purchases/new' do
  @merchants = Merchant.find_all
  @tags = Tag.find_all
  @user = User.find_by_id(1)
  erb(:"purchases/new")
end

get '/purchases/:id' do
  @purchase = Purchase.find_by_id(params[:id])
  @user = User.find_by_id(1)
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
  @user = User.find_by_id(1)
  erb(:"purchases/edit")
end

post '/purchases/:id/delete' do
  Purchase.delete_by_id(params[:id])
  redirect to("/purchases")
end
