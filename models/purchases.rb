require_relative('../db/sql_runner')

class Purchase

  attr_accessor :merchant_id, :tag_id, :amount, :purchase_date
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @merchant_id = options['merchant_id']
    @tag_id = options['tag_id']
    @amount = '%.2f' % [options['amount'].to_f]
    @purchase_date = options['purchase_date']
  end

  def save
    sql = "INSERT INTO purchases (merchant_id, tag_id, amount, purchase_date) VALUES ($1, $2, $3, $4) RETURNING id"
    values = [@merchant_id ,@tag_id , @amount, @purchase_date]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.find_all
    sql = "SELECT * FROM purchases ORDER BY id ASC"
    purchases = SqlRunner.run(sql)
    return purchases.map{|purchase| Purchase.new(purchase)}
  end

  def self.find_all_reverse
    sql = "SELECT * FROM purchases
           ORDER BY purchase_date DESC"
    purchases = SqlRunner.run(sql)
    return purchases.map{|purchase| Purchase.new(purchase)}
  end

  def self.sum_all
    sql = "SELECT SUM(amount) FROM purchases"
    total = SqlRunner.run(sql)[0]
    return total['sum']
  end

  def self.find_by_year_and_month(year, month)
    sql = "SELECT * FROM purchases WHERE
           EXTRACT(YEAR FROM purchase_date) = $1
           AND
           EXTRACT(MONTH FROM purchase_date) = $2"
    values = [year, month]
    purchases = SqlRunner.run(sql, values)
    return purchases.map{|purchase| Purchase.new(purchase)}
  end

  def self.sum_all_month(year, month)
    sql = "SELECT SUM(amount) FROM purchases WHERE
           EXTRACT(YEAR FROM purchase_date) = $1
           AND
           EXTRACT(MONTH FROM purchase_date) = $2"
    values = [year, month]
    total = SqlRunner.run(sql, values)[0]
    return total['sum']
  end

  def self.find_by_merchant(merchant)
    sql = "SELECT p.* FROM purchases p
           INNER JOIN merchants m ON m.id = p.merchant_id
           WHERE name = $1"
    values = [merchant]
    purchases = SqlRunner.run(sql, values)
    return purchases.map{|purchase| Purchase.new(purchase)}
  end

  def self.sum_all_merchant(merchant)
    sql = "SELECT SUM(amount) FROM purchases p
           INNER JOIN merchants m ON m.id = p.merchant_id
           WHERE name = $1"
    values = [merchant]
    total = SqlRunner.run(sql, values)[0]
    return total['sum']
  end

  def self.find_by_tag(tag)
    sql = "SELECT p.* FROM purchases p
           INNER JOIN tags t ON t.id = p.tag_id
           WHERE type = $1"
    values = [tag]
    purchases = SqlRunner.run(sql, values)
    return purchases.map{|purchase| Purchase.new(purchase)}
  end

  def self.sum_all_tag(tag)
    sql = "SELECT SUM(amount) FROM purchases p
           INNER JOIN tags t ON t.id = p.tag_id
           WHERE type = $1"
    values = [tag]
    total = SqlRunner.run(sql, values)[0]
    return total['sum']
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
    sql = "DELETE FROM purchases WHERE id =$1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM purchases WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE purchases SET (merchant_id, tag_id, amount, purchase_date) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@merchant_id, @tag_id, @amount, @purchase_date, @id]
    SqlRunner.run(sql, values)
  end

  def merchant()
    sql = "SELECT * FROM merchants
    WHERE id = $1"
    values = [@merchant_id]
    merchant = SqlRunner.run(sql, values)[0]
    return Merchant.new(merchant)
  end

  def tag()
    sql = "SELECT * FROM tags
    WHERE id = $1"
    values = [@tag_id]
    tag = SqlRunner.run(sql, values)[0]
    return Tag.new(tag)
  end

end
