require_relative '../modules/input_module'
require_relative '../modules/display_module'

class CreateAlbum
  include InputModule
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'Create album'
  end

  def do_action(state)
    genre = SelectFromList.new.do_helper_action(state, state[:genres], CreateGenre.new, 'Genre')
    author = SelectFromList.new.do_helper_action(state, state[:authors], CreateGenre.new, 'Author')
    label = SelectFromList.new.do_helper_action(state, state[:labels], CreateGenre.new, 'Labels')
    source = SelectFromList.new.do_helper_action(state, state[:sources], CreateGenre.new, 'Labels')
    album = MusicAlbum.new(**Show_Prompt.call(%i[date on_spotify]))

    album.label = s3
    album.author = s2
    album.genre = genre

    state[:albums] << album
  end
end
