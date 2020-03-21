![Logo of the project](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/logo.png)

# Wiggo | Property management, organised.

Wiggo helps property managers to create, edit and visualise their guests, properties and bookings from different booking platforms on one tool only.

## Features

The app allows the user to:
* View all the information about guests, properties and bookings organised respectively per last name, place and property name
* Show the related future guest on the property card
* Show the property booked by a guest on the guest card
* Add new guests and properties
* Add bookings using existent guests and properties from the dropdown menu
* Edit and delete guests, properties and bookings
* Show the total earning a booking will provide

# Front end

## Styling

The colours used were adopted after researching protanopia to make text easily readable and aesthetically pleasant for colourblind people too.

Normal vision

![Normal vision](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/coolors%20normal%20view.png)

Protanopia vision

![Protanopia vision](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/coolors%20protanopia%20view.png)


Although the website is not responsive, characters sizes are in vw (viewport's width - vw units represent a percentage of the current browser viewport) where possible.

# Back end

## Tech used

Ruby, PgSQL, Pry, Sinatra, HTML, CSS.

## MVP

CRUD actions for each table, 7 RESTful routes for each table (index, show, new, create, edit, update, delete). 

## Extensions

Let the co-host see all guests currently in the property. 
Calculate the earning per booking after commissions. 

## Extensions on their way

The views should allow the co-host to see bookings, guests and properties sorted by parameters. 
Guests who are not over 21 should not be able to book. 
Show message "Available" if property has no associated guest.
Each property has a total earning based on the sum of all the associated bookings.

## Tables

![Wiggo Tables](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/tables.png)

## Code highlights

* Total earning method

![Method property.guests](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/booking_total_earning.png)

Code in models/booking.rb

    def calc_total_earning(nights, property)
      total_earning = (@nights * property.daily_fee) * 50 / 100 #(commissions)
      return total_earning
    end
 
Code in views/index_booking.erb

    <div class="flip-card-back">
      <div class="booking">
        <h3><a href="/bookings/<%= booking.id %>"><%= booking.property.name %></a></h3>
        <p>Check in:<br> <%= booking.check_in_date %></p>
        <p>Check out:<br> <%= booking.check_out_date %></p>
        <p>Total earning:<br>£ <%= booking.calc_total_earning(booking.nights, booking.property) %></p>
      </div>
    </div>


* View property's guest from property card

![Method property.guests](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/property_guests%20.png)

Code in models/property.rb

     def guests()
       sql = "SELECT guests.*
         FROM guests
         INNER JOIN bookings
         ON bookings.guest_id = guests.id
         WHERE property_id = $1"
       values = [@id]
       guests = SqlRunner.run(sql, values)
       guests_data = Guest.map_items(guests)
       return guests_data
     end
     
 Code in views/index_property.erb
    
    <p>Pending guests: <br> 
        <% for guest in property.guests %>
            <% if guest.last_name != [] %>
                 <%= guest.last_name %>
              <% else %>
                <p>No pending guest: property available!</p>
            <% end %>
        <% end %>
    </p>
                
## Links

- Project homepage: https://github.com/saracastellino/week_5_ruby_project/tree/master/wiggo_property_management
- Repository: https://github.com/saracastellino/week_5_ruby_project


## Installing / Getting started

Clone repo https://github.com/saracastellino/week_5_ruby_project/tree/master/wiggo_property_management.
This application relies on a relational database. To create a database using PG on Linux OS, use the following commands:

    creatdb wiggo
    psql -d wiggo -f db/wiggo.sql 
    
Then run the following:

    wiggo_property_management/db/seeds.rb 
    wiggo_property_management/app.rb 

And visit URL http://localhost:4567/.

