require_relative '../modules/display_module'

class ListAllBooks
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'List all books'
  end

  def do_action(state)
    List_Collection.call(state[:books], 'Books', %i[name genre author label date source], Display_All)
  end
end
