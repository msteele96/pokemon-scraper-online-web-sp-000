class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(name:, type:, db:, id: nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def save
    sql = <<-SQL
      INSERT INTO pokemon VALUES (?, ?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.type, self.db)
  end

end
