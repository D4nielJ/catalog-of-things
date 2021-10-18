class ListAllBooks
  attr_reader :name

  def initialize
    @name = 'List all books'
  end

  def do_action(state)
    p 'Estos son los libros'
    p Item.new(name: 'test', date: '10-10-2020')
    p state[:books]
  end
end
