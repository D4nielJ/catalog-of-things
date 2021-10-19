require_relative '../modules/input_module'
require_relative '../modules/display_module'

class CreateBook
  include InputModule
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'Create book'
  end

  def do_action(state)
    book = Book.new(**Show_Prompt.call(%i[name date publisher cover_state]))
    genre = SelectFromList.new.do_helper_action(state, state[:genres], CreateGenre.new, 'Genre')
    author = SelectFromList.new.do_helper_action(state, state[:authors], CreateAuthor.new, 'Author')
    label = SelectFromList.new.do_helper_action(state, state[:labels], CreateLabel.new, 'Labels')
    source = SelectFromList.new.do_helper_action(state, state[:sources], CreateSource.new, 'Source')

    book.label = label
    book.author = author
    book.genre = genre
    book.source = source

    state[:books] << book
  end
end
