require_relative '../modules/input_module'

class CreateLabel
  include InputModule
  attr_reader :name

  def initialize
    @name = 'Create label'
  end

  def do_action(state)
    new_item = Label.new(**Show_Prompt.call(%i[title color]))
    state[:labels].concat([new_item])
    new_item
  end
end
