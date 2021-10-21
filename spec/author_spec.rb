require_relative '../app/classes/author/author'
require_relative '../app/classes/item/item'

describe 'When testing Author class' do
  it 'should return the correct attr with getters' do
    test_author = Author.new(first_name: 'John', last_name: 'Doe')
    expect(test_author.first_name).to eql 'John'
    expect(test_author.last_name).to eql 'Doe'
  end

  it 'should return the correct attr after using setters' do
    test_author = Author.new(first_name: 'John', last_name: 'Doe')
    test_author.first_name = 'Jean'
    test_author.last_name = 'Dean'
    expect(test_author.first_name).to eql 'Jean'
    expect(test_author.last_name).to eql 'Dean'
  end

  it 'should add items to its internal array of items' do
    test_author = Author.new(first_name: 'John', last_name: 'Doe')
    test_item = Item.new(date: '18-10-2021')
    test_author.add_item(test_item)
    expect(test_author.items).to eql [test_item]
  end
end
