class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify:, **options)
    @on_spotify = on_spotify
    super(**options)
  end

  def to_hash
    {
      **super,
      on_spotify: @on_spotify
    }
  end

  private

  def can_be_archived?
    on_spotify && super
  end
end
