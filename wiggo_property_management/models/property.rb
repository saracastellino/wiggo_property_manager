require_relative('../db/sql_runner')

class Property

  attr_reader :id
  attr_accessor :name, :address, :booking_platform, :sleeps, :daily_fee, :contacts


  def initialize( properties )
    @id = properties['id'].to_i if properties['id']
    @name = properties['name']
    @address = properties['address']
    @booking_platform = properties['booking_platform']
    @sleeps = properties['sleeps'].to_i
    @daily_fee = properties['daily_fee'].to_i
    @contacts = properties['contacts']
  end

  def save
    sql = "INSERT INTO properties (name, address, booking_platform, sleeps, daily_fee, contacts) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id"
    values = [@name, @address, @booking_platform, @sleeps, @daily_fee, @contacts]
    properties_data = SqlRunner.run(sql, values)
    return properties_data.first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM properties;"
    SqlRunner.run(sql)
  end

end
