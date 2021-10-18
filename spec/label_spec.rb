require_relative '../app/classes/label/label'

describe 'Label class' do
  it 'should return the correct title' do
    label = Label.new(title: 'Harry Potter', color: 'Blue')
    expect(label.title).to eq 'Harry Potter'
  end

  it 'should return the correct color' do
    label = Label.new(title: 'Harry Potter', color: 'Blue')
    expect(label.color).to eq 'Blue'
  end

  it 'should return an empty array' do
    label = Label.new(title: 'Harry Potter', color: 'Blue')
    expect(label.items).to eq []
  end
end