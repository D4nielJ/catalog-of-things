class CreateGenre
  attr_reader :name

  def initialize
    @name = 'Create genre'
  end

  def do_action(state)
    p 'doin an action'
  end
end