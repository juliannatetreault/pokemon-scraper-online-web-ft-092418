class Pokemon
    attr_accessor :id, :name, :type, :hp, :db
    @@all = []

    def initialize(id:, name:, type:, hp: nil, db:)
      @db = db
      @id = id
      @name = name
      @type = type
      @hp = hp
      @@all << self
    end

    def self.all
      @@all
    end

    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)" ,name, type)
    end

    def self.find(id, db)
      id, name, type, hp = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
      Pokemon.new(id: id, name: name, type: type, hp: hp, db: db)
    end

    def alter_hp(hp, dp)
      db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = #{self.id}")
    end
end