require_relative('../db/sql_runner')

class Purchase

  attr_accessor :amount
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @amount = options['amount'].to_f
  end

  def save
    sql = "INSERT INTO purchases (amount) VALUES ($1) RETURNING id"
    values = [@amount]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.find_all
    sql = "SELECT * FROM purchases"
    purchases = SqlRunner.run(sql)
    return purchases.map{|purchase| Purchase.new(purchase)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM purchases WHERE id = $1"
    values = [id]
    purchase = SqlRunner.run(sql, values)[0]
    return Purchase.new(purchase)
  end

  def self.delete_all
    sql = "DELETE FROM purchases"
    SqlRunner.run(sql)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM purchases WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE purchases SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

end
