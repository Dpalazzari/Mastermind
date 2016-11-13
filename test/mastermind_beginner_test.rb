require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind_beginner'


class MastermindBeginnerTest < Minitest::Test

  def test_it_exists
    master = MastermindBeginner.new
    assert master
  end

  def test_it_initialzies_with_game_array
    master = MastermindBeginner.new
    assert_equal Array, master.game_array.class
    assert_equal 12, master.game_array.count
  end

  def test_it_generates_a_new_game_array
    master = MastermindBeginner.new
    assert_equal Array, master.generate_sequence.class
    assert_equal 4, master.generate_sequence.count
  end

  def test_it_initializes_with_no_guesses
    master = MastermindBeginner.new
    assert_equal 0, master.number_of_guesses
    assert_equal Fixnum, master.number_of_guesses.class
  end

  def test_user_data_is_an_empty_array
    master = MastermindBeginner.new
    assert_equal [], master.user_data
    assert_equal Array, master.user_data.class
  end

  def test_it_can_generate_a_sequence
    master = MastermindBeginner.new
    master.generate_sequence
    assert_equal Array, master.new_game_array.class
    assert_equal 4, master.new_game_array.count
  end

end
