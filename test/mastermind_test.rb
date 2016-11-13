gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind.rb'
require 'pry'

class MasterMindTest < Minitest::Test

  def test_master_mind_class_exists
    mastermind = Mastermind.new
    assert_equal Mastermind, mastermind.class
  end

  def test_that_mastermind_initializes_with_difficulties
    master = Mastermind.new
    assert_equal MastermindBeginner, master.beginner.class
    assert_equal MastermindIntermediate, master.intermediate.class
    assert_equal MastermindAdvanced, master.advanced.class
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


end
