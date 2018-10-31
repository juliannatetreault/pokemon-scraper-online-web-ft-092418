class Pokemon
    attr_accessor :id, :name, :type, :db
    @@all = []

    def initialize(id:, name:, type:, db:)
      @db = db
      @id = id
      @name = name
      @type = type
      @@all << self
    end

    def self.all
      @@all
    end

    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)" ,name, type)
    end

    def self.find(id, db)
      id, name, type = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
      Pokemon.new(id: id, name: name, type: type, db: db)
    end
end