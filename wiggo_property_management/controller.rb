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
  @guests = Guest.all
  erb(:new)
end

post '/properties' do
  Property.new(params).save
  redirect to '/properties'
end

get '/properties/:id' do
  @property = Property.find(params['id'])
  erb(:show)
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
  @houses = House.all
  erb(:new)
end

post '/guests' do
  guest.new(params).save
  redirect to '/guests'
end

get '/guests/:id' do
  @guest = guest.find(params['id'])
  erb(:show)
end

get '/guests/:id/edit' do
  @houses = House.all
  @guest = guest.find(params['id'])
  erb(:edit)
end

post '/guests/:id' do
  guest = guest.new(params)
  guest.update
  redirect to "/guests/#{params['id']}"
end

post '/guests/:id/delete' do
  guest = guest.find(params['id'])
  guest.delete
  redirect to '/guests'
end
