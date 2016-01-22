require 'rspec'
require 'deck.rb'

describe Deck do
  subject(:deck) { Deck.new }

  describe "#populate!" do
    it "builds an array of 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "builds a deck of unique cards" do
      count = 0
      deck.cards.each do |card|
        deck.cards.each do |card2|
          count += 1 if card.hard_equal?(card2)
        end
      end
      expect(count).to eq(52)
    end
  end

  describe "#shuffle!" do
    let(:deck2) {Deck.new}
    let(:deck3) {Deck.new}

    it 'shuffles a deck' do
      deck2.shuffle!
      expect(deck.cards == deck2.cards).to be_falsey
    end
    it 'shuffles randomly' do
      deck2.shuffle!
      deck3.shuffle!
      expect(deck2.cards == deck3.cards).to be_falsey
    end
    it 'maintains same card' do
      deck2.shuffle!
      expect(deck2.cards.sort == deck.cards.sort).to be_truthy
    end
  end

  describe "#draw" do
    it "returns a card" do
      expect(deck.draw).to be_an_instance_of(Card)
    end
    it "removes a card from the deck" do
      deck.draw
      expect(deck.cards.length).to eq(51)
    end
    it "removes correct card from deck" do
      hand = deck.draw
      found = false
      deck.cards.each do |card|
        found = true if card.hard_equal?(hand)
      end
      expect(found).to be_falsey
    end
  end

  describe "#return_card" do
    it "returns a card to the deck" do
      card = deck.draw
      deck.return_card(card)
      expect(deck.cards.length).to eq(52)
    end
    it "shuffles the deck" do
      deck2 = Deck.new
      card = deck.draw
      deck.return_card(card)
      expect(deck2.cards == deck.cards).to be_falsey
    end
  end

end
