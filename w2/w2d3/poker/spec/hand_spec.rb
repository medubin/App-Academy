require 'rspec'
require 'hand.rb'

describe Hand do
  subject(:hand) {Hand.new}

  describe "#get_card" do
    it "adds a card to hand" do
      hand.get_card(double)
      expect(hand.cards_in_hand.length).to eq(1)
    end

    it "returns a card if over hand size" do
      5.times { hand.get_card(double) }
      expect { hand.get_card(double) }.to raise_error(TooManyCardsError)
    end
  end

  describe "#discard_card" do
    it "removes a card from the hand" do
      card = double
      hand.get_card(card)
      hand.discard_card(card)
      expect(hand.cards_in_hand.length).to eq(0)
    end
    it "returns a card" do
      card = double
      hand.get_card(card)
      expect(hand.discard_card(card)).to be_an_instance_of(double.class)
    end
    it "raises an error for an empty hand" do
      expect{ hand.discard_card(double) }.to raise_error(NoCardsError)
    end
    it "raises an error if card is not in hand" do
      hand.get_card(double)
      expect { hand.discard_card("double") }.to raise_error(CardNotInHandError)
    end
  end

  describe "#card_in_hand?" do
    let(:card) {double(value: 14, suite: :S)}
    let(:card2) {double(value: 5, suite: :S)}
    it "finds a card in hand" do
      hand.get_card(card)
        # hand.card_in_hand.include?(card)
      expect(hand.card_in_hand?(card)).to be_truthy
    end

    it "doesn't find a card not in hand" do
      hand.get_card(card)
      expect(hand.card_in_hand?(card2)).to be_falsey
    end
  end

  describe "#best_hand" do
    let(:hand1) { Hand.new }
    it "finds a straight flush" do
    end

    it "finds a full house" do
    end

    it "finds one of a kind" do
    end

    it "finds the highest hand" do

    end

  end


end

class FakeCard
  def initialize()
  end
  def hard_equal?(card)
    self.object_id == card.object_id
  end
end
