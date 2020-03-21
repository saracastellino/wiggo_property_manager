require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/guest')
require_relative('../models/property')
require_relative('../models/booking')
require_relative('../models/booking_platform')
also_reload('../models/*')

get '/guests' do
  @guests = Guest.sort_by_last_name
  erb(:"guests/index")
end

post 'guests/by_nationality/' do
  @guest = Guest.find(params[guest_id])
  Guest.sort_by_nationality
  erb(:"guests/index")
end

get '/guests/new' do
  erb(:"guests/new")
end

post '/guests' do
  @guest = Guest.new( params )
  @guest.save()
  erb( :"guests/create" )
end

get '/guests/:id' do
  @guest = Guest.find(params['id'])
  erb(:"guests/show")
end

get '/guests/:id/edit' do
  @guest = Guest.find(params['id'])
  erb(:"guests/edit")
end

post '/guests/:id' do
  Guest.new(params).update
  erb( :"guests/update" )
end

post '/guests/:id/delete' do
  guest = Guest.find(params['id'])
  guest.delete
  erb( :"guests/delete")
end

post '/guests/:id/properties' do
  guest = Guest.find(params['id'])
  @properties = guest.properties
  @booking_platforms = BookingPlatform.all 
  erb( :"/guest_properties" )
end
