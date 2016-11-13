require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind_advanced'


class MastermindAdvancedTest < Minitest::Test

  def test_it_exists
    master = MastermindAdvanced.new
    assert master
  end

  def test_it_initialzies_with_game_array
    master = MastermindAdvanced.new
    assert_equal Array, master.game_array.class
    assert_equal 18, master.game_array.count
  end

  def test_it_initializes_with_no_guesses
    master = MastermindAdvanced.new
    assert_equal 0, master.number_of_guesses
    assert_equal Fixnum, master.number_of_guesses.class
  end

  def test_it_initializes_with_guess_array
    master = MastermindAdvanced.new
    assert_equal Array, master.guess.class
    assert_equal [], master.guess
  end

  def test_it_initialzes_user_data
    master = MastermindAdvanced.new
    assert_equal Array, master.user_data.class
    assert_equal [], master.user_data
  end

  def test_it_generates_a_new_game_array
    master = MastermindAdvanced.new
    master.generate_sequence
    assert_equal Array, master.new_game_array.class
    assert_equal 6, master.new_game_array.count
  end

end
