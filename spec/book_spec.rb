require_relative '../app/classes/item/book'

describe 'Book class' do
  it 'should return the correct publisher' do
    book = Book.new(publisher: 'Bob', cover_state: 'bad', date: '2021-10-10', archived: false, id: 300)
    expect(book.publisher).to eq 'Bob'
  end

  it 'should return Book as a class' do
    book = Book.new(publisher: 'Bob', cover_state: 'bad', date: '2021-10-10', archived: false, id: 300)
    expect(book.class).to eq Book
  end

  it 'should return true when moving to archive' do
    book = Book.new(publisher: 'Bob', cover_state: 'bad', date: '2021-10-10', archived: false, id: 300)
    expect(book.move_to_archive).to eq true
  end
end