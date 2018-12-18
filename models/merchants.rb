require_relative('../db/sql_runner')

class Merchant

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO merchants (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.find_all
    sql = "SELECT * FROM merchants"
    merchants = SqlRunner.run(sql)
    return merchants.map{|merchant| Merchant.new(merchant)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    values = [id]
    merchant = SqlRunner.run(sql, values)[0]
    return Merchant.new(merchant)
  end

  def self.delete_all
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM merchants WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM merchants WHERE id =$1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE merchants SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def tags
    sql = "SELECT MIN(t.id), t.type FROM tags t
          INNER JOIN purchases p ON t.id = p.tag_id
          WHERE merchant_id = $1 GROUP BY t.type"
    values = [@id]
    tags = SqlRunner.run(sql, values)
    return tags.map{|tag| Tag.new(tag)}
  end

  def name_to_title_case
    @name.split(" ").map {|word| word.capitalize}.join(" ")
  end

end
