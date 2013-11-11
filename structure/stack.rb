class Stack
  def initialize(size)
    @max = size
    @ptr = 0
    @data = Array.new(size)
  end
  def push(obj)
    if @ptr < @max
      @data[@ptr] = obj
      @ptr += 1
    end
  end
  def pop
    return nil if @ptr <= 0
    @ptr -= 1
    obj = @data[@ptr]
    @data[@ptr] = nil
    return obj
  end
  def clear
    (@ptr - 1).step(0, -1){|i| @data[i] = nil }
    @ptr = 0
  end
  def isEmpty?
    @ptr == 0
  end
  def isFull?
    @ptr == @max
  end
  def size
    @ptr
  end
  def getData
    @data
  end
end

printf "data size>>"
stack = Stack.new($stdin.gets.to_i)

loop do
  printf "0:print 1:push 2:pop 3:peek 4:clear 5:size 6:full? 7:empty?>>"
  case i = $stdin.gets.to_i
  when 0
    p stack.getData
  when 1
    printf "push num>>"
    stack.push($stdin.gets.to_i)
  when 2
    p stack.pop
  when 3
    p stack.peek
  when 4
    stack.clear
  when 5
    p stack.size
  when 6
    p stack.isFull?
  when 7
    p stack.isEmpty?
  else
    p "exit"
    break
  end
end
