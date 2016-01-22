class Card
  attr_accessor :card_face, :face_up
  def initialize(card_face)
    @face_up = false
    @card_face = card_face
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    @face_up ? "#{@card_face.to_s} " : "[]"
  end


  def == card
    @card_face == card.card_face
  end
end

#
# card1 = Card.new('a')
# card2 = Card.new('a')
# card1.reveal
# card2.reveal
# p card1 == card2

class Board
  def initialize(height, width)
      @height = height
      @width = width
      @board = build_board
      populate!
  end

  def validate_human_input(input)
    row,col = input.split(",")
    #Make sure we were give two ints, with a comma in between
    return [-1,-1] if row.to_i.to_s != row || col.to_i.to_s != col
    col, row = col.to_i, row.to_i
    #Make sure numbers don't exceed grid
    return [-2,-2] if row > @height - 1 || col > @width - 1
    #Make sure numbers aren't negative
    return [-3,-3] if row < 0 || col < 0
    #Make sure card isn't face up already
    return [-4,-4] if self[row,col].face_up
    return row, col
  end



  def build_board
    Array.new(@height) {[]}
  end

  def make_faces
    num_faces = @height * @width / 2
    list_of_faces = []
    97.upto(96 + num_faces) {|i| list_of_faces << i.chr}
    list_of_faces
  end

  def complete_list_of_faces
    list_of_faces = make_faces
    list_of_faces += list_of_faces
    list_of_faces.shuffle
  end

  def complete_list_of_cards
    list_of_cards = complete_list_of_faces.map {|face| Card.new(face)}
  end

  def populate!
    cards_to_set = complete_list_of_cards
    @height.times {|row| @board[row] += cards_to_set.pop(@width) }
  end

  def render
    system("clear")
    @board.each do |row|
      row.each{|card| print "#{card.to_s}   "}
      puts
      puts
    end
  end

  def reveal_all
    @board.each do |row|
      row.each{ |card| card.reveal }
    end
  end

  def won?
    @board.each do |row|
      row.each {|card| return false if !card.face_up}
    end
    true
  end

  def [] row, col
    @board[row][col]
  end



  def reveal(row, col)
    @board[row][col].reveal
    @board[row][col].to_s
  end
end

class Game
  attr_reader :last_guess, :height, :width, :board
  def initialize(width, height, player)
    @board = Board.new(width, height)
    @width = width
    @height = height
    @last_guess = nil
    @player = player
    @player.board = @board
  end

  def continuous_game
    @board.render
    until @board.won?
      take_turn
    end
    puts "You win!"
  end

  def take_turn
    row,col = @player.get_move
    @board.reveal(row, col)
    @board.render
    move_results(row,col)
  end

  def move_results(row,col)
    last_guess ? matched = is_match?(row, col) : matched = true
    hide_non_match(row,col) if !matched
    puts("Good job!") if matched && !@last_guess.nil?
    @last_guess ? @last_guess = nil : (@last_guess = [row,col])
  end

  def hide_non_match(row, col)
    @board[row,col].hide
    @board[last_guess[0],last_guess[1]].hide
    sleep(1)
    @board.render
  end



  def is_match?(row,col)
    @board[row,col] == @board[last_guess[0],last_guess[1]]
  end


end



class HumanPlayer
  attr_accessor :name, :board
  def initialize(name)
    @name = name
  end



  def prompt
    puts "Pick a card!  Must be in format a,b"
  end

  def get_move
    prompt
    row,col = @board.validate_human_input(gets.chomp)
    until row > -1 && col > -1
      puts "Invalid move!"
      prompt
      row,col = @board.validate_human_input(gets.chomp)
    end
    return row,col
  end
end

class AIPlayer
  attr_accessor :board
  def initialize(name)
    @name = name
    @AI_board = false
  end

  def build_AI_board
    @AI_board = Array.new(@height) {Array.new(@width) {[nil]}}
  end

  def number_of_valid_moves
    @AI_board.flatten.select(&:nil?).length
  end

  def matching_move?
    @AI_board.flatten.each {|el| return true if @AI_board.flatten.count(el) == 2 && !el.nil?}
    false
  end


  def get_move
    if matching_move


  end
end

#
# our_board = Board.new(5,5)
# # p our_board.build_board
# our_board.reveal(0,1)
# our_board.render
# our_board.reveal_all
# our_board.render
player = HumanPlayer.new('Sue')
our_game = Game.new(2,2, player)
our_game.continuous_game
