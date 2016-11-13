require 'minitest/autorun'
require 'minitest/nyan_cat'
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

  def test_it_generates_a_new_game_array
    master = MastermindIntermediate.new
    assert_equal Array, master.generate_sequence.class
    assert_equal 5, master.generate_sequence.count
  end

end
