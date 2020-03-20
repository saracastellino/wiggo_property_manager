require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/guest')
require_relative('../models/property')
require_relative('../models/booking')
also_reload('../models/*')

get '/bookings' do
  @bookings = Booking.sort_by_property
  erb(:"bookings/index")
end

get '/bookings/new' do
  @guests = Guest.all
  @properties = Property.all
  erb(:"bookings/new")
end

post '/bookings' do
  @booking = Booking.new( params )
  @booking.save()
  erb(:"bookings/create")
end

get '/bookings/:id' do
  @booking = Booking.find(params['id'])
  erb(:"bookings/show")
end

get '/bookings/:id/edit' do
  @guests = Guest.all
  @properties = Property.all
  @booking = Booking.find(params['id'])
  erb(:"bookings/edit")
end

post '/bookings/:id' do
  Booking.new(params).update
  erb(:"bookings/update")
end

post '/bookings/:id/delete' do
  booking = Booking.find(params['id'])
  booking.delete
  erb(:"bookings/delete")
end
