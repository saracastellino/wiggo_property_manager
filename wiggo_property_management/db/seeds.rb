require_relative('../models/guest')
require_relative('../models/property')
require_relative('../models/booking')

require('pry')

Guest.delete_all
Property.delete_all
# Booking.delete_all

guest1 = Guest.new({"name" => "AXL", "last_name" => "Rose", "nationality" => "American", "dob" => "Feb 6 1965", "pax" => 3, "documents" => "Driving licence", "contacts" => "+1 999 444 222 - 29500 Heathercliff Rd SPACE 194, Malibu, CA 90265", "budget" => 10000})
guest2 = Guest.new({"name" => "Slash", "last_name" => "Hudson", "nationality" => "British/American", "dob" => "Jul 23 1965", "pax" => 6, "documents" => "Passport", "contacts" => "+1 999 333 222 - 7239 Van Nuys Blvd. Suite A-8. Van Nuys, CA 91405", "budget" => 8000})
guest3 = Guest.new({"name" => "Duff", "last_name" => "McKagan", "nationality" => "American", "dob" => "Feb 5 1964", "pax" => 5, "documents" => "Driving licence", "contacts" => "+1 999 333 222 - 7239 Van Nuys Blvd. Suite A-8. Van Nuys, CA 91405", "budget" => 9000})
guest4 = Guest.new({"name" => "Izzy", "last_name" => "Stradlin", "nationality" => "American", "dob" => "Apr 8 1965", "pax" => 4, "documents" => "Passport", "contacts" => "+1 765 276 7700 - West Lafayette, Indiana 47906", "budget" => 11000})
guest5 = Guest.new({"name" => "Steven", "last_name" => "Adler", "nationality" => "American", "dob" => "Jan 22 1965", "pax" => 3, "documents" => "Passport", "contacts" => "10866 Wilshire Blvd., Los Angeles, California 90024", "budget" => 5000})
guest1.save
guest2.save
guest3.save
guest4.save
guest5.save

property1 = Property.new({"name" => "Villa del Glicine", "address" => "Via lago Talere 22", "booking_platform" => "Airbnb", "sleeps" => 6, "daily_fee" => 400, "contacts" => "+39 070 87687678"})
property1.save

booking1 = Booking.new({"guest_id" => guest1.id, "property_id" => property1.id, "check_in_date" => "Jul 4 2020", "check_out_date" => "Jul 31 2020", "total_earning" => 7000})
booking1.save

binding.pry
nil
