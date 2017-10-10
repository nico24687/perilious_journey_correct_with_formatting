require './lib/node'

class LinkedList
    attr_reader :head, :count

    def initialize
        @count = 0
    end

    def append(surname, supplies = {})
        @count += 1
        node = Node.new(surname, supplies)

        if head
            current_node = head
            while current_node.next_node
                current_node = current_node.next_node
            end

            current_node.next_node = node
        else
            @head = node
        end

        node
    end

    def prepend(surname, supplies = {})
        @count += 1
        node = Node.new(surname, supplies)
        node.next_node = head
        @head = node
    end

    def insert(index, surname, supplies = {})
        @count += 1
        node = Node.new(surname, supplies)
        old_next_node = head.next_node
        head.next_node = node
        node.next_node = old_next_node
        node
    end

    def find(start_index, result_count)
        end_index = start_index + result_count
        results = LinkedList.new

        for i in start_index...end_index
            results.append(node_at(i).surname)
        end

        results.to_string
    end

    def includes?(surname)
        return true if head.surname == surname

        current_node = head

        while current_node.next_node do
            current_node = current_node.next_node
            return true if current_node.surname == surname
        end

        return false
    end

    def pop
        current_node = head
        for i in 0...@count-2
            current_node = current_node.next_node
        end
        
        popped_node = current_node.next_node
        current_node.next_node = nil

        @count -= 1 if @count > 0

        puts "The #{popped_node.surname} family has died of dysentery"
        
        popped_node
    end

    def to_string
        description = "The #{head.surname} family"

        current_node = head
        while current_node.next_node do
            description += ", followed by the #{current_node.next_node.surname} family"
            current_node = current_node.next_node
        end

        description
    end

    private

    def node_at(index)
        current_node = head
        for i in 0...index
            current_node = current_node.next_node
        end

        current_node
    end
end