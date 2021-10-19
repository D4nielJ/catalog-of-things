require_relative '../modules/display_module'

class ListAllAlbums
  include DisplayModule
  attr_reader :name

  def initialize
    @name = 'List all albums'
  end

  def do_action(state)
    # m1 = MusicAlbum.new(on_spotify: false, date: '2222-22-22')
    # m2 = MusicAlbum.new(on_spotify: true, date: '2222-23-22')
    # m3 = MusicAlbum.new(on_spotify: true, date: '2222-24-22')
    # state[:albums] << m1
    # state[:albums] << m2
    # state[:albums] << m3
    List_Collection.call(state[:albums], 'Albums', %i[genre author name label date], Display_All)
  end
end
