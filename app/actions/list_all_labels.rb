require_relative '../modules/display_module'

class ListAllLabes
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'List all labels'
  end

  def do_action(state)
    List_Collection.call(state[:labels], 'Labels', %i[title color], Display_Table)
  end
end
