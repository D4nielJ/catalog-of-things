require_relative '../modules/display_module'

class ListAllAlbums
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'List all albums'
  end

  def do_action(state)
    List_Collection.call(state[:albums], 'Albums', %i[genre author name label date source], Display_All)
  end
end
