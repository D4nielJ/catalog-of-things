require_relative '../modules/display_module'

class ListAllGames
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'List all games'
  end

  def do_action(state)
    List_Collection.call(state[:games], 'Games', %i[name genre author label date source], Display_All)
  end
end
