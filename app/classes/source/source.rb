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

  def to_savable
    JSON.pretty_generate({ id: @id })
  end
end
