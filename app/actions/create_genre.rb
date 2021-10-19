require_relative '../modules/input_module'

class CreateGenre
  include InputModule
  attr_reader :name

  def initialize
    @name = 'Create genre'
  end

  def do_action(state)
    new_gen = Genre.new(**Show_Prompt.call(%i[name]))
    state[:genres].concat([new_gen])
    new_gen
  end
end
