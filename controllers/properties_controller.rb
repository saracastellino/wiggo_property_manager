require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/guest')
require_relative('../models/property')
require_relative('../models/booking')
require_relative('../models/booking_platform')

get '/properties' do
  @properties = Property.sort_by_place
  erb(:"properties/index")
end

get '/properties/new' do
  @booking_platforms = BookingPlatform.all 
  @property = Property.new( params )
  erb(:"properties/new")
end

post '/properties' do
  @property = Property.new( params )
  @property.save
  erb(:"properties/create")
end

get '/properties/:id' do
  @property = Property.find(params['id'])
  erb(:"properties/show")
end

get '/properties/:id/edit' do
  @booking_platforms = BookingPlatform.all
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

get '/properties/:id/guests' do
  @property = Property.find(params['id'])
  @guests = @property.guests
  erb( :"properties/property_guest" )
end

