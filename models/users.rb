require_relative('../db/sql_runner')

class User

  attr_accessor :name, :budget
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @budget = options['budget']
  end

  def save
    sql = "INSERT INTO users (name, budget) VALUES ($1, $2) RETURNING id"
    values = [@name, @budget]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.find_all
    sql = "SELECT * FROM users ORDER BY id ASC"
    users = SqlRunner.run(sql)
    return users.map{|user| User.new(user)}
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM users WHERE id = $1"
    values = [id]
    user = SqlRunner.run(sql, values)[0]
    return User.new(user)
  end

  def self.delete_all
    sql = "DELETE FROM users"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM users WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM users WHERE id =$1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = "UPDATE users SET (name, budget) = ($1, $2) WHERE id = $3"
    values = [@name, @budget, @id]
    SqlRunner.run(sql, values)
  end

  def name_to_title_case
    name = @name
    name.split(" ").map {|word| word.capitalize}.join(" ")
  end

end
