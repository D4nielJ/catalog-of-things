class Item
  attr_reader :id, :archived, :genre, :source, :label, :author
  attr_accessor :date

  def initialize(date:, archived: false, id: Random.rand(1..100_000))
    @id = id
    @date = date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def source=(source)
    @source = source
    source.add_item(self) unless source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    time = Time.now
    date_to_compare = Time.new(time.year - 10, time.month, time.day)
    formatted_date = date_to_compare.strftime('%Y-%m-%d')

    @date < formatted_date
  end
end

item = Item.new(name: 'Nombre', date: '2020-10-10')
p item.archived
p item.move_to_archive
p item.archived
