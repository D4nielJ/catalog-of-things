require_relative '../app/classes/item/music_album'
require_relative '../app/classes/item/item'

describe MusicAlbum do
  context 'With valid date' do
    it 'Should be archived with 2000 date' do
      item = MusicAlbum.new(on_spotify: true, date: '2000-10-10')
      expect(item.can_be_archived?).to be true
    end

    it 'Should should not be archived with 2020 date' do
      item = MusicAlbum.new(on_spotify: true, date: '2020-10-10')
      expect(item.can_be_archived?).to be false
    end
  end
end
