class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(last_played_at:, multiplayer: false, **args)
    super(**args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    time = Time.now
    date_to_compare = Time.new(time.year - 2, time.month, time.day)
    formatted_date = date_to_compare.strftime('%Y-%m-%d')

    super && @last_played_at > formatted_date
  end
end
