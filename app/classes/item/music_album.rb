class MusicAlbum < Item
  attr_reader :on_spotify
  def initialize(on_spotify:, **options)
    on_spotify
    super(**options)
  end
end