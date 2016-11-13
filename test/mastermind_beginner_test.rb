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

end
