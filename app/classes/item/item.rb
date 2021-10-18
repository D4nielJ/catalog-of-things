class Item
  attr_reader :id, :archived, :genre, :source, :label, :author
  attr_accessor :date, :name

  def initialize(name:, archived:, date:, id: Random.rand(1..100_000))
    @id = id
    @name = name
    @date = date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.items.include?(self)
  end

  def source=(source)
    @source = source
    source.add_item(self) unless !source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.add_item(self) unless !label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.add_item(self) unless && !author.items.include?(self)
  end

  def move_to_archive; end

  private

  def can_be_archived?
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
