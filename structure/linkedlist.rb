class Node
  attr_reader	:data	#data(key) is immutable
  attr_accessor	:next	#next is mutable

  def initialize(obj)
    @data = obj
    @next = nil
  end
end

class LinkedList

  def initialize
    @head = nil
  end

  def insertFront(node)
    unless @head
      @head = node
    else
      nextNode = @head
      @head = node
      @head.next = nextNode
    end
  end

  def insertRear(node)
    unless @head
      insertFront(node)
    else
      prevNode = @head
      while  prevNode.next != nil do
        prevNode = prevNode.next
      end
      prevNode.next = node
    end
  end

  def removeFront
    return unless @head
    nextNode = @head.next
    @head.next = nil
    @head = nextNode
  end

  def clear
    until @head == nil do
      removeFront
    end
  end

  def removeRear
    return unless @head
    unless @head.next
      removeFront
    else
      prevNode = @head
      targetNode = @head.next
      while targetNode.next != nil do
        prevNode = targetNode
        targetNode = targetNode.next
      end
      prevNode.next = nil
    end
  end

  def size
    count = 0
    currentNode = @head
    while currentNode != nil do
      count += 1
      currentNode = currentNode.next
    end
    return count
  end

  def print
    currentNode = @head
    while currentNode do
      printf "%d ", currentNode.data
      currentNode = currentNode.next 
    end
    puts
  end

  def get(index)
    if index > self.size
      return nil
    else
      node = @head
      index.times do
        node = node.next
      end
    end
    return node
  end

  def remove(index)
    if index >= self.size
      return nil
    elsif index == self.size - 1
      removeRear
    elsif index == 0
      removeFront
    else
      count = 0
      prevNode = nil 
      targetNode = @head
      while count < index do
        prevNode = targetNode
        targetNode = targetNode.next
        count += 1
      end
      nextNode = targetNode.next
      targetNode.next = nil	#clear reference to next node for GC
      prevNode.next = nextNode
    end
  end
end

list = LinkedList.new

loop do
  printf "0:print 1:insertFront 2:insertRear 3:removeFront 4:removeRear 5:remove 6:get 7:size 8:clear>>"
  case $stdin.gets.to_i
  when 0
    list.print
  when 1
    printf "insert num>>"
    list.insertFront(Node.new($stdin.gets.to_i))
  when 2
    printf "insert num>>"
    list.insertRear(Node.new($stdin.gets.to_i))
  when 3
    list.removeFront
  when 4
    list.removeRear
  when 5
    printf "remove index>>"
    list.remove($stdin.gets.to_i)
  when 6
    printf "get index>>"
    node = list.get($stdin.gets.to_i)
    p (node)? node.data : "nodata"
  when 7
    p list.size
  when 8
    list.clear
  else
    break
  end
end
