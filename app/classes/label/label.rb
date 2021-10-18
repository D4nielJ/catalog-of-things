class Label
  def initialize(id: Random.rand(1..100_000), title:, color:)
    @id = id
    @title = title
    @color = color
    @items = []
  end
end