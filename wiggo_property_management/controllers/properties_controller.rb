require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/guest')
require_relative('../models/property')
require_relative('../models/booking')
also_reload('../models/*')

get '/properties' do
  @properties = Property.sort_by_place
  erb(:"properties/index_property")
end

get '/properties/new' do
  erb(:"properties/new_property")
end

post '/properties' do
  @property = Property.new( params )
  @property.save()
  erb(:"properties/create_property")
end

get '/properties/:id' do
  @property = Property.find(params['id'])
  erb(:"properties/show_property")
end

get '/properties/:id/edit' do
  @property = Property.find(params['id'])
  erb(:"properties/edit_property")
end

post '/properties/:id' do
  Property.new(params).update
  rb( :"properties/update_property" )
end

post '/properties/:id/delete' do
  property = Property.find(params['id'])
  property.delete
  erb(:"properties/delete_property")
end
#
# post '/properties/guests' do
#   guests = Property.guests
#   erb( :property_guests )
# end
