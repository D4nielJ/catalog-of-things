require_relative 'item'
require_relative '../../../app/modules/display_module'

class MusicAlbum < Item
  include DisplayModule

  attr_reader :on_spotify

  def initialize(on_spotify:, **options)
    @on_spotify = on_spotify
    super(**options)
  end

  def can_be_archived?
    on_spotify && super
  end

  ## only for testing display module
  def display(alb)
    p 'helo'
    List_Collection.call(alb, 'Albums', %i[date on_spotify archived], Display_Table)
  end
end

## only for testing display module
ml = []
ma = MusicAlbum.new(date: '5/5/5, ', on_spotify: true, archived: false)
ml.push(ma)
ma.display(ml)
p ma.can_be_archived?
p ma.on_spotify
