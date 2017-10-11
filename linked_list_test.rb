require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/linked_list'

class LinkedListTest < Minitest::Test
    def test_head_is_empty_upon_initialization
        assert_nil LinkedList.new.head
    end

    def test_append_creates_node_with_matching_surname
        list = LinkedList.new
        appended_node = list.append("West")
        assert_equal "West", appended_node.surname
    end

    def test_append_creates_node_with_matching_surname_and_supplies
        list = LinkedList.new
        appended_node = list.append("West", { "pounds of food" => 300 })
        assert_equal "West", appended_node.surname
        assert_equal({ "pounds of food" => 300 }, appended_node.supplies)
    end

    def test_multiple_appends
        list = LinkedList.new
        list.append("Rhodes")
        list.append("Hardy")

        assert_equal "Hardy", list.head.next_node.surname
    end

    def test_head_next_node_returns_nil
        list = LinkedList.new
        list.append("West")

        assert_nil list.head.next_node
    end

    def test_count_returns_number_of_nodes
        list = LinkedList.new
        list.append("West")
        list.append("Hardy")

        assert_equal 2, list.count
    end

    def test_to_string_returns_single_family_with_one_node
        list = LinkedList.new
        list.append("West")

        assert_equal "The West family", list.to_string
    end

    def test_to_string_returns_list_of_families_with_many_nodes
        list = LinkedList.new
        list.append("Rhodes")
        list.append("Hardy")

        assert_equal "The Rhodes family, followed by the Hardy family", list.to_string
    end

    def test_prepend_adds_node_to_beginning_of_list
        list = LinkedList.new
        list.append("Brooks")
        list.append("Henderson")

        prepended_node = list.prepend("McKinney")

        assert_equal "Brooks", prepended_node.next_node.surname
        assert_equal "The McKinney family, followed by the Brooks family, followed by the Henderson family", list.to_string
        assert_equal 3, list.count
    end

    def test_prepend_adds_node_with_supplies_to_beginning_of_list
        list = LinkedList.new
        list.append("Brooks")
        list.append("Henderson")

        prepended_node = list.prepend("McKinney", { "pounds of food" => 1 })

        assert_equal({ "pounds of food" => 1}, prepended_node.supplies)
    end

    def test_insert_adds_node_to_index_specified
        list = LinkedList.new
        list.append("Brooks")
        list.append("Henderson")
        list.prepend("McKinney")

        inserted_node = list.insert(1, "Lawson")

        assert_equal "Brooks", inserted_node.next_node.surname
        assert_equal "The McKinney family, followed by the Lawson family, followed by the Brooks family, followed by the Henderson family", list.to_string
        assert_equal 4, list.count
    end

    def test_insert_adds_node_to_index_specified
        list = LinkedList.new
        list.append("Brooks")
        list.append("Henderson")
        list.append("West")
        list.append("McKinney")

        inserted_node = list.insert(2, "Lawson", { "pounds of food" => 2 })

        assert_equal({ "pounds of food" => 2 }, inserted_node.supplies)
        assert_equal "West", inserted_node.next_node.surname
        assert_equal 5, list.count
    end

    #edge case test
    def test_insert_out_of_bounds_returns_nil
        list = LinkedList.new
        list.append("Brooks")

        assert_nil list.insert(1, "Lawson")
    end

    def test_find_returns_family_list_of_range_specified
        list = LinkedList.new
        list.append("McKinney")
        list.append("Lawson")
        list.append("Brooks")
        list.append("Henderson")
        assert_equal "The Brooks family", list.find(2, 1)
    end

    def test_find_returns_list_of_multiple_families_from_range_specified
        list = LinkedList.new
        list.append("McKinney")
        list.append("Lawson")
        list.append("Brooks")
        list.append("Henderson")
        assert_equal "The Lawson family, followed by the Brooks family, followed by the Henderson family", list.find(1, 3)
    end

    def test_includes_returns_true_when_surname_is_in_list
        list = LinkedList.new
        list.append("McKinney")
        list.append("Lawson")
        list.append("Brooks")
        list.append("Henderson")

        assert list.includes?("Brooks")
        refute list.includes?("Chapman")
    end

    #edge case test1
    def test_includes_returns_false_for_empty_list
        refute LinkedList.new.includes?("Hello")
    end

    
    def test_pop_removes_the_last_node
        list = LinkedList.new
        list.append("McKinney")
        list.append("Lawson")
        list.append("Brooks")
        list.append("Henderson")

        assert_equal "Henderson", list.pop.surname
        assert_equal 3, list.count
    
        assert_equal "Brooks", list.pop.surname
        assert_equal 2, list.count

        assert_equal "The McKinney family, followed by the Lawson family", list.to_string
    end
end