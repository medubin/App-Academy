def max_window_range(arr, w)
  max_range = nil

  arr[0..(-1*w)].each_index do |idx|
    window = arr[idx...idx+w]
    if max_range.nil? || (window.max - window.min > max_range.max - max_range.min)
      max_range = window
    end
  end
  max_range
end



def max_window_range_queue(arr,w)
  current_max_range = nil
  queue = MinMaxStackQueue.new
  arr.each do |el|

    if queue.size < w
      queue.enqueue(el)
    else
      current_dif = queue.max - queue.min
      current_max_range = current_dif if current_max_range.nil? || current_dif > current_max_range
      queue.dequeue
      queue.enqueue(el)
    end
  end

  [current_max_range, (queue.max - queue.min)].max
  # current_max_range
end

# queue = []
# shift/  pop
# push/   unshift
#
# stack = []
# pop
# push


#STACKS AND QUEUE EXERCISES

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(item)
    @store.push(item)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end
end

class MyStack

  attr_reader :max, :min

  def initialize
    @store = []
    @max = nil
    @min = nil
  end

  def pop
    popped_value = @store.pop
    @max = popped_value[1] if popped_value[0] == @max
    @min = popped_value[2] if popped_value[0] == @min
    popped_value[0]
  end

  def push(item)
    @store.push([item, @max, @min])
    @max = item if @max.nil? || item > @max
    @min = item if @min.nil? || item < @min
  end

  def peek
    @store.last[0]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end


class StackQueue

  def initialize
    @queue = MyStack.new
    @dequeue = MyStack.new
  end

  def enqueue(item)
    flip_to_queue
    @queue.push(item)
  end

  def dequeue
    flip_to_dequeue
    @dequeue.pop
  end

  def size
    (@queue.size + @dequeue.size)
  end

  def empty?
    @queue.empty? && @dequeue.empty?
  end

  private
  def flip_to_queue
    if @queue.empty? && !@dequeue.empty?
      until @dequeue.empty?
        @queue.push(@dequeue.pop)
      end
    end
  end

  def flip_to_dequeue
    if !@queue.empty? && @dequeue.empty?
      until @queue.empty?
        @dequeue.push(@queue.pop)
      end
    end
  end
end


class MinMaxStackQueue < StackQueue

  def initialize
    super
  end

  def max
    @queue.max
  end

  def min
    @queue.min
  end


end
