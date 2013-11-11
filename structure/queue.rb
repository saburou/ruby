class Queue
  def initialize(maxsize)
    @maxsize = maxsize
    @front = 0
    @rear = 0 
    @data = Array.new(maxsize)
    @size = 0
  end
  def isFull?
    @size == @maxsize
  end
  def isEmpty?
    @size == 0
  end
  def size
    @size
  end
  def enqueue(obj)
    unless self.isFull?
      @data [@rear % @maxsize] = obj
      @size += 1
      @rear += 1
    end
  end
  def dequeue
    unless self.isEmpty?
      obj = @data[@front % @maxsize]
      @data[@front % @maxsize] = nil
      @front += 1
      @size -= 1
      return obj
    end
  end
  def peek
    @data[(@front % @maxsize == @maxsize - 1)? 0: @front % @maxsize + 1]
  end
  def clear
    @maxsize.times{|i| @data[i] = nil }
    @front = 0
    @rear = 0
    @size = 0  
  end
  def print
    (@front...@rear).each{|i| printf "%s ", (@data[i % @maxsize])? @data[i % @maxsize].to_s: "nil"}
    puts
  end 
end

printf "data size>>"
queue = Queue.new($stdin.gets.to_i)

loop do
  printf "0:print 1:enqueue 2:dequeue 3:peek 4:clear 5:size 6:full? 7:empty?>>"
  case i = $stdin.gets.to_i
  when 0
    queue.print
  when 1
    printf "enqueue num>>"
    queue.enqueue($stdin.gets.to_i)
  when 2
    p queue.dequeue
  when 3
    p queue.peek
  when 4
    queue.clear
  when 5
    p queue.size
  when 6
    p queue.isFull?
  when 7
    p queue.isEmpty?
  else
    p "exit"
    break
  end
end
