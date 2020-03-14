# require_relative('../db/sql_runner')
#
# class Booking
#
#   attr_reader :id
#   attr_accessor :guest_id, :property_id, :check_in_date, :check_out_date, :total_earning
#
#
#   def initialize( bookings )
#     @id = bookings['id'].to_i if bookings['id']
#     @guest_id = bookings['guest_id'].to_i
#     @property_id = bookings['property_id'].to_i
#     @check_in_date = bookings['check_in_date']
#     @check_out_date = bookings['check_out_date']
#     @total_earning = bookings['total_earning'].to_i
#   end
#
#   def save
#     sql = "INSERT INTO bookings (guest_id, property_id, check_in_date, check_out_date, total_earning) VALUES (£1, £2, £3, £4, £5) RETURNING id;"
#     values = [@guest_id, @property_id, @check_in_date, @check_out_date, @total_earning]
#     bookings_data = SqlRunner.run(sql, values)
#     return bookings_data.first['id'].to_i
#   end
#
#   def self.delete_all()
#     sql = "DELETE FROM bookings;"
#     SqlRunner.run(sql)
#   end
#
# end
