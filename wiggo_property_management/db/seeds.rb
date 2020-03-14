require_relative('../models/guest')
require_relative('../models/property')
require_relative('../models/booking')

require('pry')

Guest.delete_all
Property.delete_all
# Booking.delete_all

guest1 = Guest.new({"name" => "AXL", "last_name" => "Rose", "nationality" => "American", "dob" => "Feb 6 1965", "pax" => 3, "documents" => "Driving licence", "contacts" => "+1 999 444 222 - 29500 Heathercliff Rd SPACE 194, Malibu, CA 90265"})
guest2 = Guest.new({"name" => "Slash", "last_name" => "Hudson", "nationality" => "British/American", "dob" => "Jul 23 1965", "pax" => 6, "documents" => "Passport", "contacts" => "+1 999 333 222 - 7239 Van Nuys Blvd. Suite A-8. Van Nuys, CA 91405"})
guest3 = Guest.new({"name" => "Duff", "last_name" => "McKagan", "nationality" => "American", "dob" => "Feb 5 1964", "pax" => 5, "documents" => "Driving licence", "contacts" => "+1 999 333 222 - 7239 Van Nuys Blvd. Suite A-8. Van Nuys, CA 91405"})
guest4 = Guest.new({"name" => "Izzy", "last_name" => "Stradlin", "nationality" => "American", "dob" => "Apr 8 1965", "pax" => 4, "documents" => "Passport", "contacts" => "+1 765 276 7700 - West Lafayette, Indiana 47906"})
guest5 = Guest.new({"name" => "Steven", "last_name" => "Adler", "nationality" => "American", "dob" => "Jan 22 1965", "pax" => 3, "documents" => "Passport", "contacts" => "10866 Wilshire Blvd., Los Angeles, California 90024"})
guest1.save
guest2.save
guest3.save
guest4.save
guest5.save

property1 = Property.new({"name" => "Villa del Glicine", "category" => "Villa", "address" => "Via lago Talere 22", "place" => "Chia", "booking_platform" => "Homeaway", "sleeps" => 6, "daily_fee" => 400, "contacts" => "+39 070 8768878"})
property2 = Property.new({"name" => "Villa Esmeralda", "category" => "Villa", "address" => "Via ldei Tulipani 15", "place" => "Pula", "booking_platform" => "Booking.com", "sleeps" => 8, "daily_fee" => 550, "contacts" => "+39 070 0983708"})
property3 = Property.new({"name" => "Charlie's place", "category" => "Loft", "address" => "Viale Alberato 333", "place" => "Cagliari", "booking_platform" => "Homeaway", "sleeps" => 3, "daily_fee" => 200, "contacts" => "+39 070 123409"})
property4 = Property.new({"name" => "Nautilus", "category" => "Villa", "address" => "Viale Poetto 34", "place" => "Cagliari", "booking_platform" => "Airbnb", "sleeps" => 4, "daily_fee" => 250, "contacts" => "+39 070 3678693"})
property5 = Property.new({"name" => "Fifty-one", "category" => "Luxury flat", "address" => "Via Manno 79", "place" => "Chia", "booking_platform" => "Homeaway", "sleeps" => 4, "daily_fee" => 350, "contacts" => "+39 070 9832749"})
property1.save
property2.save
property3.save
property4.save
property5.save
#
# booking1 = Booking.new({"guest_id" => guest1.id, "property_id" => property1.id, "check_in_date" => "Jul 4 2020", "check_out_date" => "Jul 31 2020", "total_earning" => 7000})
# booking1.save

guest4.pax = 3
guest4.update
property3.contacts = "+39 349080983"
property3.update

binding.pry
nil
