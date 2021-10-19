require_relative '../modules/input_module'

class CreateAuthor
  include InputModule
  attr_reader :name

  def initialize
    @name = 'Create author'
  end

  def do_action(state)
    new_item = Author.new(**Show_Prompt.call(%i[first_name last_name]))
    state[:authors].concat([new_item])
    new_item
  end
end
