class LinkedList
    attr_reader :head
    def initialize
        @head = nil
    end
    def append(value)
        if @head == nil
            @head = Node.new(value)
            return @head.value
        else
            current_node = @head
            while current_node.next_node != nil
                current_node = current_node.next_node
            end
            current_node.next_node = Node.new(value)
            return current_node.next_node.value
        end
    end
    
    def prepend(value)
        if @head == nil
            @head = Node.new(value)
            return @head.value
        else
            first_node = @head
            @head = Node.new(value)
            @head.next_node = first_node
            return @head.value
        end
    end

    def size
        count = 0
        current_node = @head
        while current_node != nil
            count += 1
            current_node = current_node.next_node
        end
        return count
    end

    def get_head
        if @head == nil
            return nil
        else
            return @head.value
        end
    end

    def get_tail
        current_node = @head
        if current_node == nil
            return nil
        end
        while current_node.next_node != nil
            current_node = current_node.next_node
        end
        return current_node.value
    end

    def at(index)
        if @head == nil
            return nil
        end
        current_node = @head
        node_count = 0
        while node_count < index
            current_node = current_node.next_node
            if current_node == nil
                return nil
            end
            node_count += 1
        end
        return current_node.value
    end
    
    def pop
        if @head == nil
            return nil
        end
        if @head.next_node == nil
            popped_node = @head.value
            @head = nil
            return popped_node
        end
        current_node = @head
        while current_node.next_node != nil
            if current_node.next_node.next_node == nil
                popped_node = current_node.next_node.value
                current_node.next_node.value = nil
                current_node.next_node = nil
                return popped_node
            end
            current_node = current_node.next_node
        end
    end
    
    def contains?(value)
        current_node = @head
        while current_node != nil
            if current_node.value == value
                return true
            else
                current_node = current_node.next_node
            end
        end
        return false
    end

    def find(value)
        current_node = @head
        index = 0
        while current_node != nil
            if current_node.value == value
                return index
            else
                current_node = current_node.next_node
                index += 1
            end
        end
        return nil
    end

    def to_s
        string = ''
        current_node = @head
        while current_node != nil
            string += "(#{current_node.value}) -> "
            current_node = current_node.next_node
        end
        return string += "nil"
    end
end

class Node
    attr_accessor :value, :next_node
    def initialize(value = nil)
        @value = value
        @next_node = nil
    end
end

my_list = LinkedList.new

my_list.append("my")
my_list.prepend("is")
my_list.append("1st")
my_list.append("linked")
my_list.prepend("This")
my_list.append("list!")
my_list.append("extra node")
puts my_list
extra_node = my_list.pop
puts "I just popped off the #{extra_node}"
puts my_list
puts "The size is #{my_list.size}"
puts "Does the string contain 'This'?"
puts my_list.contains?("This")
puts "The word at index 2 is '#{my_list.at(2)}'"
puts "The word 'linked' is at index #{my_list.find('linked')}"
puts "The head is '#{my_list.get_head}'"
puts "The tail is '#{my_list.get_tail}'"
