require_relative '../modules/display_module'

class ListAllAlbums
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'List all books'
  end

  def do_action(state)
    List_Collection.call(state[:albums], @name, %i[on_spotify date])
    p 'Estos son los libros'
    p Item.new(name: 'test', date: '10-10-2020')
    p state[:books]
  end
end
