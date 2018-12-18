require_relative('../db/sql_runner')

class Tag

  attr_accessor :type
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @type = options['type']
  end

  def save
    sql = "INSERT INTO tags (type) VALUES ($1) RETURNING id"
    values = [@type]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.find_all
    sql = "SELECT * FROM tags ORDER BY id ASC"
    tags = SqlRunner.run(sql)
    return tags.map{|tag| Tag.new(tag)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    values = [id]
    tag = SqlRunner.run(sql, values)[0]
    return Tag.new(tag)
  end

  def self.delete_all
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM tags WHERE id =$1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM tags WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE tags SET type = $1 WHERE id = $2"
    values = [@type, @id]
    SqlRunner.run(sql, values)
  end

  def merchants
    sql = "SELECT MIN(m.id), m.name FROM merchants m
          INNER JOIN purchases p ON m.id = p.merchant_id
          WHERE tag_id = $1 GROUP BY m.name"
    values = [@id]
    merchants = SqlRunner.run(sql, values)
    return merchants.map{|merchant| Merchant.new(merchant)}
  end

  def type_to_title_case
    name = @type
    name.split(" ").map {|word| word.capitalize}.join(" ")
  end

end
