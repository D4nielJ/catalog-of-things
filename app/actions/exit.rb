class Exit
  attr_reader :name

  def initialize
    @name = 'Exit'
  end

  def do_action(state)
    p 'Come back soon'
    state[:exit] = true
  end
end
