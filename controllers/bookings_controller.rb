require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/guest')
require_relative('../models/property')
require_relative('../models/booking')
require_relative('../models/booking_platform')

get '/bookings' do
  @bookings = Booking.sort_by_property
  erb(:"bookings/index")
end

get '/bookings/by_check_in_date' do
  @bookings = Booking.sort_by_check_in_date
  erb(:"bookings/index")
end

get '/bookings/by_check_out_date' do
  @bookings = Booking.sort_by_check_out_date
  erb(:"bookings/index")
end

get '/bookings/new' do
  @guests = Guest.all
  @properties = Property.all
  @booking_platforms = BookingPlatform.all 
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
  @booking_platforms = BookingPlatform.all 
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
