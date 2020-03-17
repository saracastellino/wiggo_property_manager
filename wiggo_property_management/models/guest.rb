require_relative('../db/sql_runner')

class Guest

  attr_reader :id
  attr_accessor :name, :last_name, :nationality, :dob, :documents, :contacts

  def initialize( guests )
    @id = guests['id'].to_i if guests['id']
    @name = guests['name']
    @last_name = guests['last_name']
    @nationality = guests['nationality']
    @dob = guests['dob']
    @documents = guests['documents']
    @contacts = guests['contacts']
  end

  def save
    sql = "INSERT INTO guests (name, last_name, nationality, dob, documents, contacts)
    VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@name, @last_name, @nationality, @dob, @documents, @contacts]
    guests_data = SqlRunner.run(sql, values)
    @id = guests_data.first['id'].to_i
  end

  def guest_name
    return "#{@name} #{@last_name}"
  end

  def self.delete_all
    sql = "DELETE FROM guests;"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE guests SET (name, last_name, nationality, dob, documents, contacts) = ($1, $2, $3, $4, $5, $6)
    WHERE id = $7"
    values = [@name, @last_name, @nationality, @dob, @documents, @contacts, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM guests WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM guests"
    guest_data = SqlRunner.run(sql)
    guests = map_items(guest_data)
    return guests
  end

  def self.map_items(guest_data)
    return guest_data.map { |guest| Guest.new(guest) }
  end

  def self.find(id)
    sql = "SELECT * FROM guests
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    guest = Guest.new(result)
    return guest
  end

  def self.sort_by_last_name
    sql = "SELECT * FROM guests ORDER BY last_name ASC"
    guest_data = SqlRunner.run(sql)
    guests = map_items(guest_data)
    return guests
  end

  # ------------------CREATE A PROPERTIES METHOD TO SEE GUESTS' PROPERTIES
  #
  def properties
     sql = "SELECT properties.*
     FROM properties
     INNER JOIN bookings
     ON bookings.property_id = properties.id
     WHERE guest_id = $1"
     values = [@id]
     properties = SqlRunner.run(sql, values)
     return Property.map_items(properties)
   end

 # ------------------CREATE A BOOKINGS METHOD TO SEE GUESTS' BOOKINGS

 def bookings
   sql = "SELECT * FROM bookings WHERE guest_id = $1"
   values = [@id]
   bookings = SqlRunner.run(sql, values)
   return Booking.map_items(bookings)
 end

end
