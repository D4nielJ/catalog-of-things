class ListAllBooks
  attr_reader :name

  def initialize
    @name = 'List all books'
  end

  def do_action(state)
    p 'Estos son los libros'
    p state[:books]
  end
end
