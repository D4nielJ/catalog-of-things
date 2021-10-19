class Source
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name:)
    @name = name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.source = self
  end

  def to_hash
    {
      id: @id,
      name: @name
    }
  end
end
