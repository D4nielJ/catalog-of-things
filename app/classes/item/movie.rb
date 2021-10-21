class Movie < Item
  attr_accessor :silent

  def initialize(silent: false, **args)
    super(**args)
    @silent = silent
  end

  def to_hash
    {
      **super,
      silent: @silent
    }
  end

  private

  def can_be_archived?
    super || @silent
  end
end
