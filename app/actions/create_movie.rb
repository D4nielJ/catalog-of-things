require_relative '../modules/input_module'
require_relative '../modules/display_module'

class CreateMovie
  include InputModule
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'Create movie'
  end

  def do_action(state)
    movie = Movie.new(**Show_Prompt.call(%i[name date], 'Movies', %i[silent], validator: Valid_Boolean))
    genre = SelectFromList.new.do_helper_action(state, state[:genres], CreateGenre.new, 'Genre')
    author = SelectFromList.new.do_helper_action(state, state[:authors], CreateAuthor.new, 'Author')
    label = SelectFromList.new.do_helper_action(state, state[:labels], CreateLabel.new, 'Labels')
    source = SelectFromList.new.do_helper_action(state, state[:sources], CreateSource.new, 'Source')

    movie.label = label
    movie.author = author
    movie.genre = genre
    movie.source = source

    state[:movies] << movie
  end
end
