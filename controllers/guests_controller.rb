require('sinatra')
require('sinatra/contrib/all') if development?
require('date')
require_relative('../models/guest')
require_relative('../models/property')
require_relative('../models/booking')
require_relative('../models/booking_platform')

get '/guests' do
  @guests = Guest.sort_by_last_name
  erb(:"guests/index")
end

get '/guests/by_nationality' do
  @guests = Guest.sort_by_nationality
  erb(:"guests/index")
end

get '/guests/new' do
  #@minimum_date = Guest.minimum_dob_year()
  erb(:"guests/new")
end

post '/guests' do
  @guest = Guest.new( params )
# return erb( :"guests/not_created" ) if @guest.dob.nil?
# return erb( :"guests/not_created" ) if @guest.dob <= Some kind of today's year subtract 21

# @guest.save
# erb( :"guests/create" ) 

  # if @guest.dob.nil?
  #         return "No date of Birth"
  # else 
  #  age = Date.today.year - @guest.dob.year
  #     if age >= 21
  #        @guest.save
  #        erb( :"guests/create" ) 
  #     else
  #        erb( :"guests/not_created" )
  #     end        
  # end
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

get '/guests/:id/properties' do
  @guest = Guest.find(params['id'])
  @properties = @guest.properties
  erb( :"guests/guest_properties" )
end
