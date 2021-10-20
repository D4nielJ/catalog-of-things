require_relative '../modules/input_module'
require_relative '../modules/display_module'

class CreateGame
  include InputModule
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'Create game'
  end

  def do_action(state)
    game = Game.new(**Show_Prompt.call(%i[name date last_played_at], 'Games', %i[multiplayer],
                                       validator: Valid_Boolean))
    genre = SelectFromList.new.do_helper_action(state, state[:genres], CreateGenre.new, 'Genre')
    author = SelectFromList.new.do_helper_action(state, state[:authors], CreateAuthor.new, 'Author')
    label = SelectFromList.new.do_helper_action(state, state[:labels], CreateLabel.new, 'Labels')
    source = SelectFromList.new.do_helper_action(state, state[:sources], CreateSource.new, 'Source')

    game.label = label
    game.author = author
    game.genre = genre
    game.source = source

    state[:games] << game
  end
end
