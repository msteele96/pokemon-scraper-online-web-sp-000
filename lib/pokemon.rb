class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(name:, type:, db:, id: nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon VALUES (?, ?)
    SQL
    db.execute(sql, self.name, self.type)
    # @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

end
