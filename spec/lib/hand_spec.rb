require "spec_helper"

RSpec.describe Hand do
  describe "#score" do
    let(:hand) { (Hand.new("test player")) }

    it "is 4 if dealt two 2's" do
      hand.hit(Card.new(2, "♥"))
      hand.hit(Card.new(2, "♠"))
      expect(hand.score).to eq(4)
    end

    it "is 21 if dealt an Ace and King" do
      hand.hit(Card.new("A", "♠"))
      hand.hit(Card.new("K", "♠"))
      expect(hand.score).to eq(21)
    end

    it "is 12 if dealt two Aces" do
      hand.hit(Card.new("A", "♠"))
      hand.hit(Card.new("A", "♥"))
      expect(hand.score).to eq(12)
    end

    it "is 13 if dealt three Aces" do
      hand.hit(Card.new("A", "♠"))
      hand.hit(Card.new("A", "♥"))
      hand.hit(Card.new("A", "♦"))
      expect(hand.score).to eq(13)
    end

    it "is 14 if dealt four Aces" do
      hand.hit(Card.new("A", "♠"))
      hand.hit(Card.new("A", "♥"))
      hand.hit(Card.new("A", "♦"))
      hand.hit(Card.new("A", "♣"))
      expect(hand.score).to eq(14)
    end

    it "is 14 if dealt four Aces and a King" do
      hand.hit(Card.new("A", "♠"))
      hand.hit(Card.new("A", "♥"))
      hand.hit(Card.new("A", "♦"))
      hand.hit(Card.new("A", "♣"))
      hand.hit(Card.new("K", "♠"))
      expect(hand.score).to eq(14)
    end
  end
end
