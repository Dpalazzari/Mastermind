require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind_intermediate'


class MastermindIntermediateTest < Minitest::Test

  def test_it_exists
    master = MastermindIntermediate.new
    assert master
  end

  def test_it_initialzies_with_game_array
    master = MastermindIntermediate.new
    assert_equal Array, master.game_array.class
    assert_equal 15, master.game_array.count
  end

  def test_it_initializes_with_no_guesses
    master = MastermindIntermediate.new
    assert_equal 0, master.number_of_guesses
    assert_equal Fixnum, master.number_of_guesses.class
  end

  def test_it_initializes_with_guess_array
    master = MastermindIntermediate.new
    assert_equal Array, master.guess.class
    assert_equal [], master.guess
  end

  def test_it_initialzes_user_data
    master = MastermindIntermediate.new
    assert_equal Array, master.user_data.class
    assert_equal [], master.user_data
  end

  def test_it_generates_a_new_game_array
    master = MastermindIntermediate.new
    master.generate_sequence
    assert_equal Array, master.new_game_array.class
    assert_equal 5, master.new_game_array.count
  end

end
