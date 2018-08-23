class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{@rank}#{@suit}"
  end

  def score
    if ace?
      return 11
    elsif face_card?
      return 10
    else
      return @rank
    end
  end

  def ace?
    @rank == "A"
  end

  def face_card?
    ["J", "Q", "K"].include?(@rank)
  end
end
