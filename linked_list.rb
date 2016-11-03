class Node
  attr_accessor :next, :data
  def initialize(data = nil)
    @next = nil
    @data = data    
  end
  def value
    return @data
  end
  def next_node
    return @next
  end
end

class LinkedList
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end
  def append(data)
    if @head == nil
      @head = data
      @size += 1
      return true
    end
    current_node = @head
    loop do
      if current_node.next_node == nil
        current_node.next = data
        @size += 1
        return true
      else
        current_node = current_node.next_node
      end
    end
  end
  def prepend(data)
    new_first = data
    new_first.next = @head
    @head = new_first
    @size += 1
  end
  def size
    return @size
  end
  def head
    return @head
  end
  def tail
    if @head == nil
      return @head
    end
    current_node = @head
    loop do
      if current_node.next_node == nil
        return current_node
      else
        current_node = current_node.next_node
      end
    end
  end
  def at(index)
    current_node = @head 
    index.times do 
      current_node = current_node.next_node
    end
    return current_node
  end
  def pop
    if @head == nil 
      return false
    end
    if @head.next_node == nil
      @head = nil
      @size -= 1
      return true
    end
    current_node = @head
    loop do
      if current_node.next_node.next_node == nil
        current_node.next = nil
        @size -= 1
        return true
      else
        current_node = current_node.next_node
      end
    end
  end
  def contains?(data)
    if @head == nil
      return false
    end
    current_node = @head
    loop do
      if current_node.data == data
        return true
      elsif current_node.next_node == nil
        return false
      else
        current_node = current_node.next_node
      end
    end
  end
  def find(data)
    if @head == nil
      return nil
    end
    current_node = @head
    index = 0
    loop do
      if current_node.data == data
        return index
      elsif current_node.next_node == nil
        return nil
      else
        current_node = current_node.next_node
        index += 1
      end
    end
  end
  def to_s
    if @head == nil
      puts "nil"
      return true
    end
    current_node = @head
    string = ""
    loop do
      if current_node.next_node == nil
        string += current_node.data + " -> nil"
        puts string
        return true
      else
        if current_node.data == nil
          string += "nil"
        else
          string += current_node.data
        end
        current_node = current_node.next_node
        string += " -> "
      end
    end
  end
end

list = LinkedList.new
list.append(Node.new("John"))
list.append(Node.new("James"))
list.append(Node.new("Keith"))
list.prepend(Node.new("Kyle"))
list.append(Node.new)
list.append(Node.new("Jules"))
p list.head
p list.tail
list.to_s
p list.size
p list.find("John")
p list.find("Me")
list.pop
list.pop
list.pop
list.to_s
p list.size
p list.at(2)
p list.contains?("Kyle")