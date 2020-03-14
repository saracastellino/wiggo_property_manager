require_relative('../db/sql_runner')

class Guest

  attr_reader :id
  attr_accessor :name, :last_name, :nationality, :dob, :pax, :documents, :contacts

  def initialize( guests )
    @id = guests['id'].to_i if guests['id']
    @name = guests['name']
    @last_name = guests['last_name']
    @nationality = guests['nationality']
    @dob = guests['dob']
    @pax = guests['pax'].to_i
    @documents = guests['documents']
    @contacts = guests['contacts']
  end

  def save
    sql = "INSERT INTO guests (name,last_name, nationality, dob, pax, documents, contacts)
    VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING id"
    values = [@name, @last_name, @nationality, @dob, @pax, @documents, @contacts]
    guests_data = SqlRunner.run(sql, values)
    return guests_data.first['id'].to_i
  end

  def guest_name()
    return "#{@name} #{@last_name}"
  end

  def self.delete_all()
    sql = "DELETE FROM guests;"
    SqlRunner.run(sql)
  end

  def update()
    sql = "UPDATE guests SET (name,last_name, nationality, dob, pax, documents, contacts) = ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8"
    values = [@name, @last_name, @nationality, @dob, @pax, @documents, @contacts, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM guests WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
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

end
