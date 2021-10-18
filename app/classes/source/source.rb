class Source
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name:)
    @name = name
  end

  def add_item(item)
    @items.push(item)
    item.source = self
  end
end
