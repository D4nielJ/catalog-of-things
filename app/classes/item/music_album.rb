require_relative 'item'
require_relative '../../../app/modules/display_module'

class MusicAlbum < Item
  attr_reader :on_spotify

  def initialize(on_spotify:, **options)
    @on_spotify = on_spotify
    super(**options)
  end

  def can_be_archived?
    on_spotify && super
  end
end
