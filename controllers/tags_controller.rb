require('sinatra')
require('sinatra/contrib/all')
require('pry')
require_relative('../models/merchants.rb')
require_relative('../models/purchases.rb')
require_relative('../models/tags.rb')
require_relative('../models/users.rb')

also_reload( '../models/*' )

get '/tags' do
  @tags = Tag.find_all
  erb ( :"tags/index" )
end

post '/tags' do
  tag = Tag.new(params)
  tag.save
  redirect to("/tags")
end

get '/tags/new' do
  @tags = Tag.find_all
  erb(:"tags/new")
end

get '/tags/:id' do
  @tag = Tag.find_by_id(params[:id])
  erb(:"tags/show")
end

post '/tags/:id' do
  tag = Tag.new(params)
  tag.update
  redirect to "/tags/#{params['id']}"
end

get '/tags/:id/edit' do
  @tag = Tag.find_by_id(params[:id])
  erb(:"tags/edit")
end

post '/tags/:id/delete' do
  Tag.delete_by_id(params[:id])
  redirect to("/tags")
end
