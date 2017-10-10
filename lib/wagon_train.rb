require './lib/linked_list'

class WagonTrain
    attr_reader :list

    def initialize
        @list = LinkedList.new
    end

    def append(surname, supplies = {})
        list.append(surname, supplies)
    end

    def count
        list.count
    end

    def supplies
        supplies = {}

        current_node = list.head
        while current_node != nil
            current_supplies = current_node.supplies
            current_supplies.each do |supply, amount|
                supplies[supply] ||= 0
                supplies[supply] += amount
            end

            current_node = current_node.next_node
        end

        supplies
    end
end