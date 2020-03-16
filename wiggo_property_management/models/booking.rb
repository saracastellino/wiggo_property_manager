require_relative('../db/sql_runner')

class Booking

  attr_reader :id
  attr_accessor :guest_id, :property_id, :pax, :check_in_date, :check_out_date, :nights, :total_earning


  def initialize( bookings )
    @id = bookings['id'].to_i if bookings['id']
    @guest_id = bookings['guest_id']
    @property_id = bookings['property_id']
    @pax = bookings['pax'].to_i
    @check_in_date = bookings['check_in_date']
    @check_out_date = bookings['check_out_date']
    @nights = bookings['nights'].to_i
    @total_earning = bookings['total_earning'].to_i
  end

  def save
    sql = "INSERT INTO bookings (guest_id, property_id, pax, check_in_date, check_out_date, nights, total_earning) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id;"
    values = [@guest_id, @property_id, @pax, @check_in_date, @check_out_date, @nights, @total_earning]
    bookings_data = SqlRunner.run(sql, values)
    @id = bookings_data.first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM bookings;"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE bookings SET (guest_id, property_id, pax, check_in_date, check_out_date, nights, total_earning) = ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8"
    values = [@guest_id, @property_id, @pax, @check_in_date, @check_out_date, @nights, @total_earning]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM bookings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM bookings"
    booking_data = SqlRunner.run(sql)
    bookings = map_items(booking_data)
    return bookings
  end

  def self.map_items(booking_data)
    return booking_data.map { |booking| Booking.new(booking) }
  end

  def self.find(id)
    sql = "SELECT * FROM bookings
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    booking = Booking.new(result)
    return booking
  end

  def self.sort_by_property
    sql = "SELECT * FROM bookings ORDER BY property_id ASC"
    property_data = SqlRunner.run(sql)
    properties = map_items(property_data)
    return properties
  end

  # ------------------------RETURN TOTAL EARNINGS CALCULATION

  def total_earning(nights, property)
    total_earning = (@nights * property.daily_fee) * 50 / 100 #(commissions)
  end

  # ------------------------RETURN GUEST OF A BOOKING
  def guest
    sql = "SELECT * FROM guests
    WHERE id = $1"
    values = [@guest_id]
    guest = SqlRunner.run(sql, values).first
    return Guest.new(guest)
  end

   # ------------------------RETURN PROPERTY OF A BOOKING/

  def property
    sql = "SELECT * FROM properties
    WHERE id = $1"
    values = [@property_id]
    property = SqlRunner.run(sql, values).first
    return Property.new(property)
  end


end
