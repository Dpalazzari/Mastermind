require 'minitest/autorun'
require 'minitest/nyan_cat'
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

  def test_it_generates_a_new_game_array
    master = MastermindAdvanced.new
    assert_equal Array, master.generate_sequence.class
    assert_equal 6, master.generate_sequence.count
  end

end
