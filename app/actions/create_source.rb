require_relative '../modules/input_module'

class CreateSource
  include InputModule
  attr_reader :name

  def initialize
    @name = 'Create source'
  end

  def do_action(state)
    new_item = Source.new(**Show_Prompt.call(%i[name]))
    state[:sources].concat([new_item])
    new_item
  end
end
