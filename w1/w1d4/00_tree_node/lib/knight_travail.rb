require_relative '00_tree_node.rb'

class KnightPathFinder
  UPPER_LIMIT = 7
  VALID_MOVES = [[1,2], [2,1], [-1,2], [1,-2], [-2, 1], [2, -1], [-1, -2], [-2, -1]]

  def self.valid_moves(pos)
    pos_valid_moves = []
    VALID_MOVES.each do |movement|
      pos_valid_moves << [movement[0]+pos[0], movement[1]+pos[1]]
    end
    pos_valid_moves.select do |pos|
       !(pos.max > UPPER_LIMIT || pos.min < 0)
    end
  end



  def initialize(pos)
    @start_pos_node = PolyTreeNode.new(pos)
    @visited_positions = [pos]
    build_move_tree
  end

  def new_move_positions(pos)
    new_pos = KnightPathFinder.valid_moves(pos).reject do |potential_pos|
      @visited_positions.include?(potential_pos)
    end
    @visited_positions += new_pos
    new_pos
  end

  def build_move_tree
    queue = [@start_pos_node]
    until queue.empty?
      node = queue.shift
      new_moves = new_move_positions(node.value)
      new_moves.each do |child_node_pos|
        node.add_child(PolyTreeNode.new(child_node_pos))
      end
      queue += node.children
    end
  end

  def trace_path_back(node)
    return_path = []

    until node.parent.nil?
      return_path << node.value
      node = node.parent
    end

    return_path << @start_pos_node.value
    return_path.reverse
  end

  def find_path end_pos
    node_end_pos = @start_pos_node.bfs(end_pos)
    trace_path_back(node_end_pos)
  end

  # def show_all_moves
  #   puts @visited_positions.length
  # end


end
