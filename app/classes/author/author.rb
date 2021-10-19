class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(id: Random.rand(1..100_000), first_name: 'Anonymous', last_name: '')
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.author = self
  end

  def to_savable
    JSON.pretty_generate({ id: @id })
  end
end
