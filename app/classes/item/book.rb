class Book < Item
  attr_accessor :
  def initialize(publisher:, cover_state:, **args)
    super(**args)
    @publisher = publisher
    @cover_state = cover_state
  end
end
