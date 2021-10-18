class Book < Item
  attr_accessor :

  def initialize(publisher:, cover_state:, **args)
    super(**args)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
