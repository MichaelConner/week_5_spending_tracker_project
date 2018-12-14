require_relative('../db/sql_runner')

class Purchase

  attr_accessor :merchant_id, :tag_id, :amount
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
    @amount = options['amount'].to_f
  end

  def save
    sql = "INSERT INTO purchases (merchant_id, tag_id, amount) VALUES ($1, $2, $3) RETURNING id"
    values = [@merchant_id ,@tag_id , @amount]
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

  def delete
    sql = "DELETE FROM purchases WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE purchases SET (merchant_id, tag_id, amount) = ($1, $2, $3) WHERE id = $4"
    values = [@merchant_id, @tag_id, @amount, @id]
    SqlRunner.run(sql, values)
  end

end
