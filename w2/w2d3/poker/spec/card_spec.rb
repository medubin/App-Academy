require 'rspec'
require 'card.rb'

describe Card do
  subject(:card) {Card.new(14, :S)}
  let(:card2) {Card.new(14, :H)}
  let(:card3) {Card.new(7, :H)}

  describe "#initialize" do
    it "initializes with correct value" do
      expect(card.value).to eq(14)
    end

    it "initializes with correct suite" do
      expect(card.suite).to eq(:S)
    end
  end

  describe "#to_s" do
    it "returns correct string based on value and suite" do
      expect(card.to_s).to eq("A♤")
    end
  end

  describe "#==" do
    it " determines two cards as equal" do
      expect(card == card2).to be_truthy
    end
    it " determines two cards as different" do
      expect(card == card3).to be_falsey
    end
  end

  describe "#<" do
    it "determines one card is less than the other" do
      expect(card3 < card).to be_truthy
    end
    it "determines one card is not less than the other" do
      expect(card < card3).to be_falsey
    end

    it "returns false if cards are equal" do
      expect(card < card2).to be_falsey
    end
  end

  describe "#>" do
    it "determines one card is more than the other" do
      expect(card > card3).to be_truthy
    end
    it "determines one card is not more than the other" do
      expect(card3 > card).to be_falsey
    end
    it "returns false if cards are equal" do
      expect(card > card2).to be_falsey
    end

  end


end
