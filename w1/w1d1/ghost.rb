require 'set'
#dictionary = Set.new

class Ghost
  attr_accessor :current_player
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @fragment = ""
    @dictionary = set_dictionary
    @current_player = player1
  end

  def switch_player
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end



  def set_dictionary
    dictionary = Set.new
    File.open("dictionary.txt").each_line { |line| dictionary << line.chomp}
    dictionary
  end

  def is_fragment?
    @dictionary.each do |el|
      if el.start_with?(@fragment)
        return true
      end
    end
    false
  end

  def is_word?
    @dictionary.each {|el| return true if el == @fragment}
    false
  end

  def is_valid? guess
    return false unless guess.chomp.length == 1
    return false unless guess.chomp.downcase.ord < 123 && guess.chomp.downcase.ord > 96
    true
  end

  def take_turn
    puts "Make your guess!!!"
    @current_player.guess
  end

  def play

    loop do
      guess = take_turn
      @fragment << guess
      if (!is_valid? guess) || is_word? || !is_fragment?
        break
      end
      puts "current fragment is: #{@fragment}"
      switch_player
      puts "current player is: #{@current_player.name}"
    end
    switch_player
    puts "#{@current_player.name} has dominated!!!"
  end


end

class Player
  attr_accessor :name
  def initialize(name)
    @name = name
  end

  def guess
    gets.chomp
  end
end

bob = Player.new("bob")
sam = Player.new("sam")


game = Ghost.new(bob,sam)
game.play
