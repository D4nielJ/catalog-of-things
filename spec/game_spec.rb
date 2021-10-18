require_relative '../app/classes/item/game'

describe 'When testing Game class' do
  it 'should return the correct attr with getters' do
    test_game = Game.new(date: '2021-10-18', last_played_at: '2021-10-18')
    expect(test_game.date).to eql '2021-10-18'
    expect(test_game.last_played_at).to eql '2021-10-18'
    expect(test_game.multiplayer).to eql false
  end

  it 'should archive this game' do
    test_game = Game.new(date: '2010-10-18', last_played_at: '2015-10-18')
    test_game.move_to_archive
    expect(test_game.archived).to eql true
  end

  it 'should not archive this game' do
    test_game = Game.new(date: '2021-10-18', last_played_at: '2021-10-18')
    test_game.move_to_archive
    expect(test_game.archived).to eql false
  end
end
