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
    assert_equal 0, mastermind.guess
  end

  def test_if_program_welcomes_user
    mastermind = Mastermind.new
    assert_equal "Welcome to MASTERMIND, user. \nWould you like to (p)lay, read the (i)nstructions, or (q)uit?", mastermind.welcome_user
  end

  def test_if_game_sets_up
    mastermind = Mastermind.new
    input = mastermind.user_input
    input = "y"
    assert_equal "", mastermind.analyze_user_input(input)
  end

end
