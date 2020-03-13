require_relative('../db/sql_runner')

class Guest

  attr_reader :id
  attr_accessor :name, :last_name, :nationality, :dob, :pax, :documents, :contacts, :budget

  def initialize( guests )
    @id = guests['id'].to_i if guests['id']
    @name = guests['name']
    @last_name = guests['last_name']
    @nationality = guests['nationality']
    @dob = guests['dob']
    @pax = guests['pax'].to_i
    @documents = guests['documents']
    @contacts = guests['contacts']
    @budget = guests['budget'].to_i
  end

  def save
    sql = "INSERT INTO guests (name,last_name, nationality, dob, pax, documents, contacts, budget)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id"
    values = [@name, @last_name, @nationality, @dob, @pax, @documents, @contacts, @budget]
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

end
