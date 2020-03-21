require_relative('../db/sql_runner')

class BookingPlatform

  attr_reader :id
  attr_accessor :name, :url

  def initialize( booking_platforms )
    @id = booking_platforms['id'].to_i if booking_platforms['id']
    @name = booking_platforms['name']
    @url = booking_platforms['url']
  end

  def save
    sql = "INSERT INTO booking_platforms (name, url) VALUES ($1, $2) RETURNING id"
    values = [@name, @url]
    booking_platform_data = SqlRunner.run(sql, values)
    @id = booking_platform_data.first['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM booking_platforms"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE booking_platforms SET (name, url) = ($1, $2) WHERE id = $3"
    values = [@name, @url, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM booking_platforms WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM booking_platforms"
    booking_platform_data = SqlRunner.run(sql)
    booking_platforms = map_items(booking_platform_data)
    return booking_platforms
  end

  def self.map_items(booking_platform_data)
    return booking_platform_data.map { |booking_platform| Booking.new(booking_platform) }
  end

  def self.find(id)
    sql = "SELECT * FROM booking_platforms
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    booking_platform = BookingPlatform.new(result)
    return booking_platform
  end

end
