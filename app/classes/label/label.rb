class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(title:, color:, id: Random.rand(1..100_000))
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
