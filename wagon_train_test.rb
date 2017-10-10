require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/wagon_train'


class WagonTrainTest < Minitest::Test
    def test_train_is_initialized_with_new_list
        assert_nil WagonTrain.new.list.head
    end

    def test_train_can_append_to_list
        train = WagonTrain.new
        appended_node = train.append("Burke")

        assert_equal train.list.head, appended_node
        assert_equal "Burke", appended_node.surname
    end

    def test_count_returns_count_of_list
        wt = WagonTrain.new
        wt.append("Burke", { "pounds of food" => 200 })
        wt.list.prepend("Hardy", { "spare wagon tongues" => 3})
        wt.list.insert(1, "West", { "pounds of food" => 300 })

        assert_equal 3, wt.count
    end

    def test_train_has_inventory_of_supplies
        wt = WagonTrain.new
        wt.append("Burke", { "pounds of food" => 200 })
        wt.list.prepend("Hardy", { "spare wagon tongues" => 3})
        wt.list.insert(1, "West", { "pounds of food" => 300 })

        assert_equal({ "spare wagon tongues" => 3, "pounds of food" => 500 }, wt.supplies)
    end
end