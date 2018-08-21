class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "#{@value}#{@suit}"
  end

  def score
    if ace?
      return 11
    elsif face_card?
      return 10
    else
      return @value
    end
  end

  def ace?
    @value == "A"
  end

  def face_card?
    ["J", "Q", "K"].include?(@value)
  end
end
