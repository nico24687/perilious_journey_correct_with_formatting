require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/node' 

class NodeTest < Minitest::Test  
    
    def test_new_node_with_surname_only
        node = Node.new("Burke")
        assert_equal "Burke", node.surname
        assert_equal({}, node.supplies)
    end

    def test_new_node_with_surname_and_supplies
        node = Node.new("Burke", { "pounds of food" => 200})
        assert_equal "Burke", node.surname
        assert_equal({ "pounds of food" => 200 }, node.supplies)
    end

    def test_next_node_returns_nil
        assert_nil Node.new("Burke").next_node
    end
end






