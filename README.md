![Logo of the project](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/logo.png)

# Wiggo | Property management, organised.

Wiggo helps property managers to create, edit and visualise their guests, properties and bookings from different booking platforms on one tool only.

## Features

The app allows the user to:
* View all the information about guests, properties and bookings organised respectively per last name, place and property name
* Show the guest booked in a property on the property card
* Show the property booked by a guest on the guest card
* Add new guests and properties
* Add bookings using existent guests and properties from the dropdown menu
* Edit and delete guests, properties and bookings
* Show the total earning a booking will provide

## Styling

The colours used were adopted after researching protanopia to make text easily readable and aesthetically pleasant for colourblind people too.

Normal vision

![Normal vision](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/coolors%20normal%20view.png)

Protanopia vision

![Protanopia vision](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/coolors%20protanopia%20view.png)

## MPV

CRUD actions for each table. 
Views for each table. 

## Extensions

Let the co-host see all guests currently in the property. 
Calculate the earning per booking after commissions. 

## Extensions lost on the way

The views should allow the co-host to see bookings, guests and properties sorted by parameters. 
Guests who are not over 21 should not be able to book. 
Show message "Available" if property has no associated guest

## Installing / Getting started

Git pull from https://github.com/saracastellino/week_5_ruby_project/tree/master/wiggo_property_management

Create a "wiggo" database. 
Run the wiggo_property_management/db/seeds.rb file. 
Run the wiggo_property_management/app.rb file. 
URL http://localhost:4567/. 

## Tech used

Ruby, SQL, Sinatra, HTML, CSS.

## Tables

![Wiggo Tables](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/Tables.png)

## Code highlights

* Total earning method

![Method property.guests](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/booking_total_earning.png)

Code

![Method property.guests code](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/booking_total_earning%20code.png)

* View property's guest from property card

![Method property.guests](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/property_guests%20.png)

Code

![Method property.guests code](https://github.com/saracastellino/week_5_ruby_project/blob/master/images/property_guests%20code.png)

## Links

- Project homepage: https://github.com/saracastellino/week_5_ruby_project/tree/master/wiggo_property_management
- Repository: https://github.com/saracastellino/week_5_ruby_project

## Licensing

"The code in this project is licensed under SC license."
