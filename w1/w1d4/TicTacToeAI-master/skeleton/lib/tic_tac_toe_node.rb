require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    (@next_mover_mark == :x ) ? (childs_move_mark = :o) : (childs_move_mark = :x)
    possbile_moves = []
    3.times do |row|
      3.times do |col|
        pos = [row,col]

        if @board.empty?(pos)
          new_board = @board.dup
          new_board[pos] = @next_mover_mark
          possbile_moves << TicTacToeNode.new(new_board, childs_move_mark, pos)
        end
      end
    end
    possbile_moves
  end

  def losing_node?(evaluator)
    return board.won? && board.winner != evaluator if @board.over?
    all_children = []
    self.children.each { |child| all_children << child.losing_node?(evaluator)}
    (evaluator == @next_mover_mark) ? (return all_children.all?) : (return all_children.any?)
  end

  def winning_node?(evaluator)
    return board.won? && board.winner == evaluator if @board.over?
    all_children = []
    self.children.each { |child| all_children << child.winning_node?(evaluator) }
    (evaluator == @next_mover_mark) ? (return all_children.any?) : (return all_children.all?)
  end

end
