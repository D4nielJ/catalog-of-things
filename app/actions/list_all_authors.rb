require_relative '../modules/display_module'

class ListAllAuthors
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'List all authors'
  end

  def do_action(state)
    List_Collection.call(state[:authors], 'Authors', %i[first_name last_name], Display_Table)
  end
end
