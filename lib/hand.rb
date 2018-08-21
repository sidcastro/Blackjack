class Hand
  attr_reader :name

  def initialize(name)
    @name = name
    @cards = []
  end

  def hit(card)
    @cards << card
  end

  def to_s
    cards = @cards.map { |card| card.to_s }.join(", ")
    "#{@name} has cards: #{cards}.\nCurrent Score: #{score}\n\n"
  end

  def bust?
    score > 21
  end

  def winner?
    score == 21
  end

  def score
    # complex scoring. handle multiple aces
    result = base_score
    aces = ace_count

    while result > 21 && aces > 0
      result -= 10
      aces -= 1
    end
    result
  end

  private

  def ace_count
    result = 0
    @cards.each do |card|
      if card.ace?
        result += 1
      end
    end
    result
  end

  def base_score
    # simple scoring. ignore multiple aces
    @cards.inject(0) { |sum, card| sum + card.score }
  end
end
