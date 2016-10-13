gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'mastermind_new.rb'
require 'pry'

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
    out = capture_io do
        mastermind.welcome_user
      end
      assert_equal "Welcome", out[0].strip.split[0].to_s
      assert_equal "(q)uit?", out[0].strip.split[-1].to_s
    end


  def test_it_instructs_the_user
    mastermind = Mastermind.new
    out = capture_io do
        mastermind.instructions
      end
      assert_equal "1)", out[0].strip.split[0].to_s
      assert_equal "(y/n)", out[0].strip.split[-1].to_s
  end

  def test_it_tells_user_to_just_wing_it
    mastermind = Mastermind.new
    out = capture_io do
        mastermind.not_understand_instructions
      end
      assert_equal "Just", out[0].strip.split[0].to_s
      assert_equal "you.", out[0].strip.split[-1].to_s
  end

  # def test_what_is_the_players_name
  #   mastermind = Mastermind.new
  #   assert_equal "Drew", mastermind.player_name
  # end



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

  # def test_it_will_ask_for_your_name_if_user_inut_equals_y
  #   mastermind = Mastermind.new
  #   out = capture_io do
  #       mastermind.player_name
  #     end
  #   out.join.tr("\n", "")
  #   assert_equal ,mastermind.analyze_user_input("y")
  # end
  # def test_if_check_guess_returns_the_right_number_of_guesses
  #   mastermind = Mastermind.new
  #   mastermind.make_your_guess_known
  #   assert_equal 0, mastermind.check_guess
  # end

end
