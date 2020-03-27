require_relative('../models/guest')
require_relative('../models/property')
require_relative('../models/booking')
require_relative('../models/booking_platform')
require('date')
require('pry')

Guest.delete_all
Property.delete_all
Booking.delete_all
BookingPlatform.delete_all

guest1 = Guest.new({"name" => "AXL", "last_name" => "Rose", "nationality" => "American", "dob" => Date.new(1965, 2, 6), "documents" => "Driving licence", "contacts" => "+1 999 444 222 - 29500 Heathercliff Rd SPACE 194, Malibu, CA 90265"})
guest2 = Guest.new({"name" => "Slash", "last_name" => "Hudson", "nationality" => "British/American", "dob" => Date.new(1965, 7, 23), "documents" => "Passport", "contacts" => "+1 999 333 222 - 7239 Van Nuys Blvd. Suite A-8. Van Nuys, CA 91405"})
guest3 = Guest.new({"name" => "Duff", "last_name" => "McKagan", "nationality" => "American", "dob" => Date.new(1964, 2, 5), "documents" => "Driving licence", "contacts" => "+1 999 333 222 - 7239 Van Nuys Blvd. Suite A-8. Van Nuys, CA 91405"})
guest4 = Guest.new({"name" => "Izzy", "last_name" => "Stradlin", "nationality" => "American", "dob" => Date.new(1965, 4, 8), "documents" => "Passport", "contacts" => "+1 765 276 7700 - West Lafayette, Indiana 47906"})
guest5 = Guest.new({"name" => "Steven", "last_name" => "Adler", "nationality" => "American", "dob" => Date.new(1965, 1, 22), "documents" => "Passport", "contacts" => "10866 Wilshire Blvd., Los Angeles, California 90024"})
guest1.save
guest2.save
guest3.save
guest4.save
guest5.save

booking_platform1 = BookingPlatform.new({"name" => "Airbnb", "url" => "wwww.airbnb.com"})
booking_platform2 = BookingPlatform.new({"name" => "Homeaway", "url" => "wwww.home_away.com"})
booking_platform3 = BookingPlatform.new({"name" => "Booking.com", "url" => "wwww.booking.com"})
booking_platform1.save
booking_platform2.save
booking_platform3.save

property1 = Property.new({"name" => "Villa del Glicine", "category" => "Villa", "address" => "Via lago Talere 22", "place" => "Chia", "booking_platform_id" => booking_platform2.id, "sleeps" => 6, "daily_fee" => 400, "contacts" => "+39 070 8768878"})
property2 = Property.new({"name" => "Villa Esmeralda", "category" => "Villa", "address" => "Via ldei Tulipani 15", "place" => "Pula", "booking_platform_id" => booking_platform3.id, "sleeps" => 8, "daily_fee" => 550, "contacts" => "+39 070 0983708"})
property3 = Property.new({"name" => "Charlie's place", "category" => "Loft", "address" => "Viale Alberato 333", "place" => "Cagliari", "booking_platform_id" => booking_platform2.id, "sleeps" => 3, "daily_fee" => 200, "contacts" => "+39 070 123409"})
property4 = Property.new({"name" => "Nautilus", "category" => "Villa", "address" => "Viale Poetto 34", "place" => "Cagliari", "booking_platform_id" => booking_platform1.id, "sleeps" => 4, "daily_fee" => 250, "contacts" => "+39 070 3678693"})
property5 = Property.new({"name" => "Fifty-one", "category" => "Luxury flat", "address" => "Via Manno 79", "place" => "Chia", "booking_platform_id" => booking_platform1.id, "sleeps" => 4, "daily_fee" => 350, "contacts" => "+39 070 9832749"})
property1.save
property2.save
property3.save
property4.save
property5.save

booking1 = Booking.new({"guest_id" => guest1.id, "property_id" => property1.id, "pax" => 6, "check_in_date" => "Jul 4 2020", "check_out_date" => "Jul 31 2020", "nights" => 27})
booking2 = Booking.new({"guest_id" => guest4.id, "property_id" => property2.id, "pax" => 7, "check_in_date" => "Jul 4 2020", "check_out_date" => "Jul 31 2020", "nights" => 27})
booking3 = Booking.new({"guest_id" => guest5.id, "property_id" => property4.id, "pax" => 3, "check_in_date" => "Jul 4 2020", "check_out_date" => "Jul 31 2020", "nights" => 27})
booking4 = Booking.new({"guest_id" => guest3.id, "property_id" => property3.id, "pax" => 3, "check_in_date" => "Jul 4 2020", "check_out_date" => "Jul 31 2020", "nights" => 27})
booking1.save
booking2.save
booking3.save
booking4.save

guest4.documents = "Driving license"
guest4.update
property3.contacts = "+39 349080983"
property3.update
booking_platform2.url = "www.homeaway.com"
booking_platform2.update
booking3.check_in_date = "Jul 5 2020"
booking3.update
booking3.nights = 26
booking3.update
property4.booking_platform_id = booking_platform3.id
property4.update

binding.pry 
nil
