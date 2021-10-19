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
    gl = [*state[:genres], CreateGenre.new]
    List_Collection.call(gl, 'Genres', %i[name], Display_Table)
    s1 = Show_Prompt_With_Callback.call(%i[index], 'Select a genre from the list', gl, callback: Get_By_Index)
    s1 = s1.respond_to?(:do_action) ? s1.send(:do_action, state) : s1

    al = [Author.new(first_name: 'daniel', last_name: '?'), Author.new(first_name: 'alons', last_name: '?')]
    List_Collection.call(al, 'Albums', %i[first_name last_name], Display_Table)
    s2 = Show_Prompt_With_Callback.call(%i[index], 'Select an album from the list', al, callback: Get_By_Index)

    ll = [Label.new(title: 'bla1', color: 'red'), Label.new(title: 'bla2', color: 'blue')]
    List_Collection.call(ll, 'Labels', %i[title color], Display_Table)
    s3 = Show_Prompt_With_Callback.call(%i[index], 'Select a label from the list', ll, callback: Get_By_Index)

    album = MusicAlbum.new(**Show_Prompt.call(%i[date on_spotify]))

    album.label = s3
    album.author = s2
    album.genre = s1

    state[:albums] << album
  end
end
