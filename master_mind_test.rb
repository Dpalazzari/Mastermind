gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'mastermind_new.rb'

class MasterMindTest < Minitest::Test

  def test_master_mind_class_exists
    mastermind = Mastermind.new
    assert_equal Mastermind, mastermind.class
  end

  def test_that_master_mind_initialized_with_info
    mastermind = Mastermind.new
    assert_equal ["R", "G", "B", "Y"], mastermind.game_array
    assert_equal [], mastermind.guess
  end

  def test_it_welcomes_the_player
    mastermind = Mastermind.new
    assert mastermind.welcome_user("welcome")
  end

  def test_how_many_in_sequence_are_right
    mastermind = Mastermind.new
    mastermind.user_data = ["r", "g", "y", "b"]
    mastermind.new_game_array = ["r", "g", "y", "b"]
    assert_equal 4, mastermind.how_many_in_sequence_are_right
  end

  def test_how_many_in_sequence_are_right_one_time
    mastermind = Mastermind.new
    mastermind.user_data = ["r", "y", "g", "b"]
    mastermind.new_game_array = ["r", "g", "b", "y"]
    assert_equal 1, mastermind.how_many_in_sequence_are_right
  end

  def test_how_many_in_sequence_are_right_two_times
    mastermind = Mastermind.new
    mastermind.user_data = ["r", "y", "g", "b"]
    mastermind.new_game_array = ["r", "y", "b", "g"]
    assert_equal 2, mastermind.how_many_in_sequence_are_right
  end
end
