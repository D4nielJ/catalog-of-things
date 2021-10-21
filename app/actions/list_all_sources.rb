require_relative '../modules/display_module'

class ListAllSources
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'List all sources'
  end

  def do_action(state)
    List_Collection.call(state[:sources], 'Sources', %i[name], Display_Table)
  end
end
