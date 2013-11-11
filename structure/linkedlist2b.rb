#linked list  with cursor

class Node
  #配列に追加したときに各要素の初期化は必要になるか？
  #配列から削除した時に各要素の初期化は必要になるか？
  attr_reader		:data
  attr_accessor		:next , :emptyNext

  def initialize(obj)
    @data = obj
    @next = nil		#reference to next node
    @emptyNext = nil #reference to next insert node
  end

end

class LinkedList

  def initialize(size)
    @node = Array.new(size)
    @tail = nil		#最後に値を追加したインデックス
    @head = nil		#先頭のインデックス
    @emptyHead = nil #あんまりいい名前じゃない
  end
 
  def getIndex
    unless @emptyHead
      return 1 + @tail #return ture?
    else
      index = @emptyHead
      @emptyHead = @node[index].emptyNext
      return index
    end  
  end

  def delete(index)
    unless @emptyHead
      @emptyHead = index
      @node[index].emptyNext = nil
    else
      nextIndex = @emptyHead
      @emptyHead = index
      @node[index].emptyNext = nextIndex
    end
  end

  def insertRear(node)
      unless @head && @tail
        insertFront(node)
      #配列内に隙間があればそこにつめる
      elsif @emptyHead
        prevIndex = @tail    
        @tail = @emptyHead
        @node[@tail] = node
        @node[prevIndex].next = @tail
      #配列内に隙間がなければ末尾につめる
      else
        prevIndex = @tail
        @tail = @tail + 1
        @node[@tail] = node
        @node[prevIndex].next = @tail
      end
  end

  def insertFront(node)
      #配列内に隙間があればそこにつめる
      if @emptyHead
        nextIndex = @head
        @head = @emptyHead
        @node[@head] = node
        @node[@head].next = nextIndex
      #配列内に隙間がなければ末尾につめる	  
      else
        nextIndex = @head
        @head = @tail
        @node[@head] = node
        @node[@head].next = nextIndex
      end
  end

  def removeFront
    if @head
      @emptyHead = @head
      @head = @node[@head].next
    end
  end

  def clear
    return unless @head
    until @head.next == nil do
      removeFront
    end
  end

  def removeRear
    return unless @head
    rearIndex = @head
    prevIndex = nil
    until rearIndex == @tail do
      prevIndex = rearIndex
      rearIndex = @node[rearIndex].next
    end
    @node[rearIndex].next = @emptyHead
    @emptyHead = rearIndex
  end

  def print
    unless @head
      p "no data"
    else
      currentIndex = @head
      begin
        p @node[currentIndex]
        currentIndex = @node[currentIndex].next
      end until @node[currentIndex].next == nil
    end
  end

end
