require "spec_helper"

RSpec.describe Card do
  let(:ace_card) { (Card.new("A", "♥")) }
  let(:face_card) { (Card.new("Q", "♥")) }
  let(:card) { (Card.new(5, "♥")) }

  describe "#to_s" do
    it "converts the card to a string" do
      expect(ace_card.to_s). to eq "A♥"
    end

    describe "#ace?" do
      it "determines if a card is an ace" do
        expect(ace_card.ace?). to eq true
      end

      describe "#ace?" do
        it "determines if a card is a face card" do
          expect(ace_card.face_card?). to eq false
        end

        describe "#score" do
          it "returns the value of an ace card" do
            expect(ace_card.score). to eq 11
          end
        end
      end

      describe "#face_card" do
        it "determines if a card is a face card" do
          expect(face_card.face_card?). to eq true
        end

        describe "#score" do
          it "returns the value of a face card" do
            expect(face_card.score). to eq 10
          end
        end
      end

      describe "#score" do
        it "return the value of a non-ace and non-face card" do
          expect(card.score). to eq 5
        end
      end
    end
  end
end
