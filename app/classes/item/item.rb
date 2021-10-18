class Item
  attr_reader :id, :archived
  attr_accessor :date, :name

  def initialize(name:, archived:, date:, id: Random.rand(1..100_000))
    @id = id
    @name = name
    @date = date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end
end