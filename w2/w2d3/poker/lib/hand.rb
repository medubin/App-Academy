require_relative 'card.rb'

class Hand
  attr_reader :cards_in_hand
  def initialize
    @cards_in_hand = []
  end

  def get_card(card)
    if cards_in_hand.length < 5
      @cards_in_hand << card
      nil
    else
      raise TooManyCardsError
    end
  end

  def discard_card(card)
    raise NoCardsError if cards_in_hand.empty?
    if @cards_in_hand.include?(card)
      @cards_in_hand.delete(card)
    else
      raise CardNotInHandError
    end
  end

  def card_in_hand?(card)
    @cards_in_hand.each do |hand_card|
      # return true if card.hard_equal?(hand_card)
      return true if card.object_id == hand_card.object_id
    end
    false
  end

  def best_hand
  end





  private
  def find_straight_flush
  end

  def find_four_of_a_kind
  end

  def find_full_house
  end

  def find_flush
  end

  def find_straight
    []
  end

  def find_three_of_a_kind
  end

  def find_two_pair
    pairs = find_pairs
    return nil if pairs.length != 2
    remaining_card = @cards_in_hand - pairs.flatten
    high_pair = 
    [3, pairs]

  end

  def find_one_pair
    pairs = find_pairs
    return nil if pairs.empty?
    raise TwoPairError if pairs.length > 1

    remaining_cards = @cards_in_hand - pairs.flatten
    high_value = find_high_card(remaining_cards)
    pair_score = [2, pairs[0][0].value, high_value[1]]

  end

  def find_high_card(cards = @cards_in_hand)
    highest_card = cards.first
    cards.each do |card|
      highest_card = card if card > highest_card
    end
    [1, highest_card.value]

  end

  def find_pairs
    pairs = []
    @cards_in_hand.each_with_index do |card1, idx1|
      @cards_in_hand[idx1+1..-1].each_with_index do |card2, idx2|
        pairs << [card1, card2] if card1 == card2
      end
    end
    pairs
  end
end


class TooManyCardsError < StandardError
end

class NoCardsError < StandardError
end

class CardNotInHandError < StandardError
end

class TwoPairError < StandardError
end
