require_relative '../app/classes/source/source'
require_relative '../app/classes/item/item'

describe 'When testing Source class' do
  it 'should return the correct attr with getters' do
    test_source = Source.new(name: 'test')
    expect(test_source.name).to eql 'test'
  end

  it 'should return the correct attr after using setters' do
    test_source = Source.new(name: 'test')
    test_source.name = 'new test'
    expect(test_source.name).to eql 'new test'
  end

  it 'should add items to its internal array of items' do
    test_source = Source.new(name: 'test')
    test_item = Item.new(date: '18-10-2021')
    test_source.add_item(test_item)
    expect(test_source.items).to eql [test_item]
  end
end
