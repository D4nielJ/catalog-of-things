require_relative '../app/classes/item/movie'

describe 'When testing Movie class' do
  it 'should return the correct attr with getters' do
    test_movie = Movie.new(date: '2021-10-18')
    expect(test_movie.date).to eql '2021-10-18'
    expect(test_movie.silent).to eql false
  end

  it 'should archived this movie' do
    test_movie = Movie.new(date: '2010-10-18')
    test_movie.move_to_archive
    expect(test_movie.archived).to eql true
  end

  it 'should archived this movie' do
    test_movie = Movie.new(date: '2021-10-18', silent: true)
    test_movie.move_to_archive
    expect(test_movie.archived).to eql true
  end

  it 'should not archived this movie' do
    test_movie = Movie.new(date: '2021-10-18')
    test_movie.move_to_archive
    expect(test_movie.archived).to eql false
  end
end
