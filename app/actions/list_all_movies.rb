require_relative '../modules/display_module'

class ListAllMovies
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'List all movies'
  end

  def do_action(state)
    List_Collection.call(state[:movies], 'Movies', %i[name genre author label date source], Display_All)
  end
end
