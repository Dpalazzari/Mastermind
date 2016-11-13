require_relative 'mastermind_beginner'
require_relative 'mastermind_intermediate'
require_relative 'mastermind_advanced'
require_relative 'mastermind_module'

class Mastermind
  include MastermindInstructions

    attr_reader :beginner,
                :intermediate,
                :advanced,
                :name

    def initialize
      @beginner     = MastermindBeginner.new
      @intermediate = MastermindIntermediate.new
      @advanced     = MastermindAdvanced.new
      @name         = name
    end

    def analyze_user_input(user_input)
        if user_input.start_with?("y")
            system 'clear'
            player_name
        elsif user_input.start_with?("n")
            not_understand_instructions
            player_name
        else
            system 'clear'
            game_set_up
        end
    end

    def game_set_up
        system 'clear'
        welcome_user
        user_input = gets.chomp
            if user_input.to_s.start_with?("p")
                player_name
            elsif user_input.to_s.start_with?("i")
                instructions
                user_input = gets.chomp
                analyze_user_input(user_input)
            elsif
                user_input.start_with?("q")
                quit_game
            else
                puts "That is not a valid selection. Please hit 'enter/return' key."
                gets.chomp
                game_set_up
            end
    end

    def player_name
        puts "What is your name, user? > "
        @name = gets.chomp
            if name == ""
                puts "Come now, even I have a name."
                player_name
            else
                system 'clear'
                puts "Welcome to MASTERMIND, #{name.capitalize}."
                puts "-" * 28
                determine_the_difficulty
              end
    end

    def determine_the_difficulty
      difficulty_instructions
      user_input = gets.chomp
      beginner.start_game     if user_input.upcase.include?("B")
      intermediate.start_game if user_input.upcase.include?("I")
      advanced.start_game     if user_input.upcase.include?("A")
      determine_the_difficulty
    end
end

megamind = Mastermind.new
megamind.game_set_up
