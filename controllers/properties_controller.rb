require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/guest')
require_relative('../models/property')
require_relative('../models/booking')
also_reload('../models/*')

get '/properties' do
  @properties = Property.sort_by_place
  erb(:"properties/index")
end

get '/properties/new' do
  erb(:"properties/new")
end

post '/properties' do
  @property = Property.new( params )
  @property.save()
  erb(:"properties/create")
end

get '/properties/:id' do
  @property = Property.find(params['id'])
  erb(:"properties/show")
end

get '/properties/:id/edit' do
  @property = Property.find(params['id'])
  erb(:"properties/edit")
end

post '/properties/:id' do
  Property.new(params).update
  erb( :"properties/update" )
end

post '/properties/:id/delete' do
  property = Property.find(params['id'])
  property.delete
  erb(:"properties/delete")
end

post '/properties/:id/guests' do
  property = Property.find(params['id'])
  @guests = property.guests
  erb( :"properties/property_guests" )
end
