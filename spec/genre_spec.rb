require_relative '../app/classes/genre/genre'
require_relative '../app/classes/item/item'

describe Genre do
  context 'With a valid item' do
    it 'Should add a genere to the item' do
      item = Item.new(date: '2000-10-10', archived: false)
      genre = Genre.new(name: 'Horror')
      item.genre = genre
      expect(item.genre.name == 'Horror').to be true
    end
    it 'Should add an item' do
      item = Item.new(date: '2000-10-10', archived: false)
      genre = Genre.new(name: 'Horror')
      genre.add_item(item)
      expect(genre.items.empty?).to be false
    end
  end

  context 'With valid input' do
    it 'Should instantiate an item with date' do
      item = Item.new(date: '2000-10-10', archived: false)
      expect(item.date == '2000-10-10').to be true
    end
  end
end
