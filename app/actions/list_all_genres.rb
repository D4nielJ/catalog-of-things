require_relative '../modules/display_module'

class ListAllGenres
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'List all genres'
  end

  def do_action(state)
    List_Collection.call(state[:genres], 'Genres', %i[name], Display_Table)
  end
end
