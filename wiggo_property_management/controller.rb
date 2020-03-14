require('sinatra')
require('sinatra/contrib/all')
require_relative('models/guest')
require_relative('models/property')
require_relative('models/booking')
also_reload('./models/*')

get '/home' do
  erb(:home)
end

get '/properties' do
  @properties = Property.all
  erb(:index_property)
end

get '/properties/new' do
  erb(:new_property)
end

post '/properties' do
  Property.new(params).save
  redirect to '/properties'
end

get '/properties/:id' do
  @property = Property.find(params['id'])
  erb(:show_property)
end

get '/properties/:id/edit' do
  @property = Property.find(params['id'])
  erb(:edit)
end

post '/properties/:id' do
  property = Property.new(params)
  property.update
  redirect to "/properties/#{params['id']}"
end

post '/properties/:id/delete' do
  property = Property.find(params['id'])
  property.delete
  redirect to '/properties'
end

get '/guests' do
  @guests = Guest.all
  erb(:index_guest)
end

get '/guests/new' do
  erb(:new_guest)
end

post '/guests' do
  Guest.new(params).save
  redirect to '/guests'
end

get '/guests/:id' do
  @guest = Guest.find(params['id'])
  erb(:show_guest)
end

get '/guests/:id/edit' do
  @guest = Guest.find(params['id'])
  erb(:edit)
end

post '/guests/:id' do
  guest = Guest.new(params)
  Guest.update
  redirect to "/guests/#{params['id']}"
end

post '/guests/:id/delete' do
  guest = Guest.find(params['id'])
  Guest.delete
  redirect to '/guests'
end
