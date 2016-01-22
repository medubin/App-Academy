class Card
  attr_reader :value, :suite
  def initialize(value, suite)
    @value = value
    @suite = suite
  end

  VALUES = {
    2 => 2,
    3 => 3,
    4 => 4,
    5 => 5,
    6 => 6,
    7 => 7,
    8 => 8,
    9 => 9,
    10 => 10,
    11 => :J,
    12 => :Q,
    13 => :K,
    14 => :A
  }

  SUITES = {
    S: "♤",
    D: "♢",
    H: "♡",
    C: "♧"
  }

  def > card
    self.value > card.value
  end

  def < card
    self.value < card.value
  end

  def == card
    self.value == card.value
  end

  def <=> card
    if self.value > card.value
      1
    elsif self.value < card.value
      -1
    else
      0
    end
  end

  def hard_equal?(card)
    self.value == card.value && self.suite == card.suite
  end

  def to_s
    "#{VALUES[value]}#{SUITES[suite]}"
  end

end
