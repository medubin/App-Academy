require_relative "card.rb"

class Deck

  attr_reader :cards

  def initialize(joker = false)
    @joker = false
    @cards = []
    populate!
  end

  def populate!
    suites = [:S, :D, :H, :C]
    suites.each do |suite|
      2.upto(14) do |value|
        @cards << Card.new(value, suite)
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end

  def draw
    @cards.pop
  end

  def return_card(card)
    @cards << card
    shuffle!
  end
end
