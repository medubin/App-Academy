class PolyTreeNode
  def initialize value = nil
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent= node
    parent.children.delete(self) unless parent.nil?
    @parent = node
    node.children << self unless node.nil? || node.children.include?(self)
  end

  def add_child child_node
    child_node.parent = self
  end

  def remove_child child
    raise "Node not a child!" if child.parent.nil?
    child.parent = nil
  end

  def dfs target_value
    return self if self.value == target_value
    self.children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    nil
  end

  def bfs target_value
    node_array = [self]
    until node_array.empty?
      node = node_array.shift
      # puts "This is the node value #{node.value}"
      # puts "Target val: #{target_value}"
      return node if node.value == target_value
      node_array += node.children
    end
    nil
  end

end
