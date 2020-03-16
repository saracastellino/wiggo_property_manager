require('sinatra')
require('sinatra/contrib/all')
require_relative('models/guest')
require_relative('models/property')
require_relative('models/booking')
also_reload('./models/*')

get '/' do
  erb(:index)
end

get '/properties' do
  @properties = Property.sort_by_place
  erb(:index_property)
end

get '/properties/new' do
  erb(:new_property)
end

post '/properties' do
  @property = Property.new( params )
  @property.save()
  erb( :create_property )
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
  erb( :delete_property )
end
#
# post '/properties/guests' do
#   guests = Property.guests
#   erb( :property_guests )
# end

get '/guests' do
  @guests = Guest.sort_by_last_name
  erb(:index_guest)
end

get '/guests/new' do
  erb(:new_guest)
end

post '/guests' do
  @guest = Guest.new( params )
  @guest.save()
  erb( :create_guest )
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
  guest.delete
  erb( :delete_guest )
end
#
# post '/guests/properties' do
#   properties = Guest.properties
#   erb( :guest_properties )
# end

get '/bookings' do
  @bookings = Booking.sort_by_property
  erb(:index_property)
end

get '/bookings/new' do
  erb(:new_booking)
end

post '/bookings' do
  @booking = Booking.new( params )
  @booking.save()
  erb( :create_booking )
end

get '/bookings/:id' do
  @booking = Booking.find(params['id'])
  erb(:show_booking)
end

get '/bookings/:id/edit' do
  @booking = Booking.find(params['id'])
  erb(:edit)
end

post '/bookings/:id' do
  booking = Booking.new(params)
  booking.update
  redirect to "/bookings/#{params['id']}"
end

post '/bookings/:id/delete' do
  booking = Booking.find(params['id'])
  booking.delete
  erb( :delete_booking )
end
