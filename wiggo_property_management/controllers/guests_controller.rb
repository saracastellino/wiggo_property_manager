require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/guest')
require_relative('../models/property')
require_relative('../models/booking')
also_reload('../models/*')

get '/guests' do
  @guests = Guest.sort_by_last_name
  erb(:"guests/index_guest")
end

get '/guests/new' do
  erb(:"guests/new_guest")
end

post '/guests' do
  @guest = Guest.new( params )
  @guest.save()
  erb( :"guests/create_guest" )
end

get '/guests/:id' do
  @guest = Guest.find(params['id'])
  erb(:"guests/show_guest")
end

get '/guests/:id/edit' do
  @guest = Guest.find(params['id'])
  erb(:"guests/edit")
end

post '/guests/:id' do
  guest = Guest.new(params)
  Guest.update
  redirect to "/guests/#{params['id']}"
end

post '/guests/:id/delete' do
  guest = Guest.find(params['id'])
  guest.delete
  erb( :"guests/delete_guest")
end
#
# post '/guests/properties' do
#   properties = Guest.properties
#   erb( :guest_properties )
# end
