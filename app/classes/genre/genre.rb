class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name:, id: Random.rand(1..100_000))
    @name = name
    @items = []
    @id = id
  end

  def add_item(item)
    return if @items.include?(item)

    @items.push(item)
    item.genre = self
  end

  def to_hash
    { id: @id }
  end
end
