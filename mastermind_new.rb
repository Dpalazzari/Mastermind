require 'pry'

class Mastermind

    # attr_reader

    attr_accessor :game_array,
                  :guess,
                  :user_data,
                  :new_game_array,
                  :number_of_guesses,
                  :name


    def initialize
      @game_array = ["R", "G", "B", "Y","R", "G", "B", "Y","R", "G", "B", "Y"]
      @guess = []
      @user_data = []
      @number_of_guesses = 0

    end

    def welcome_user
      puts "Welcome to MASTERMIND, user."
      puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    end

    def instructions
      system 'clear'
        puts "1) It is your objective to guess the correct sequence of colors."
        puts "2) You must guess using (R)ED, (B)LUE, (G)REEN, and (Y)ELLOW."
        puts "3) It is the user's job to find the correct colors AND the correct sequence of colors."
        puts "4) You will recieve hints of how many of your guesses are correct."
        puts "5) You will recieve 10 tries to guess the sequence and the colors, otherwise, you will lose."
        puts "\n"
        puts "Are the instructions clear? (y/n)"
    end

    def not_understand_instructions
        system 'clear'
        puts "Just wing it, and figure it out as you play, okay?"
        puts "If you cannot figure it out, MASTERMIND is not for you."
    end

    def quit_game
        system 'clear'
        puts "See you later, user. Come back and play again, sometime."
        exit
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
                generate_sequence
                instructions_two
                instructions_three
                make_your_guess_known
              end
    end

    def generate_sequence
       @new_game_array = @game_array.sample(4)
    end

    def instructions_two
        puts "I have generated a beginner sequence with four elements made up of: (r)ed,"
        puts "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
        puts "\n"
        puts "The user can (c)heat if they find the game too hard. COLORS CAN BE USED MORE THAN ONCE."
        puts "-" * 87
        puts "-" * 87
    end

    def instructions_three
      puts "\n"
      puts "Choose from these colors: R, G, Y, B"
      puts "\n"
      print "Please enter your 4 guesses for the Mastermind  code: \n"
    end

    def make_your_guess_known
      done_guessing = false
      until done_guessing
        @user_data = gets.chomp.upcase.chars
        if user_data.include?("C")
          secret_key
        elsif user_data.include?("Q")
          quit_game
        elsif incorrect_size?(user_data)
          puts "\n"
          puts "You have selected the wrong number of characters, please guess again."
          puts "-" * 69
        else
          check_guess
        end
      end
    end

    def check_guess
      @number_of_guesses += 1
      used_the_right_colors
      answer_accepted
      win if how_many_in_sequence_are_right == 4
      lose if @number_of_guesses > 9
      puts "You have made #{number_of_guesses} guesses."
    end

    def answer_accepted
      puts "-" * 16
      puts "Answer submitted."
      puts "-" * 16
    end

    def secret_key
      system 'clear'
      puts "The secret key is #{@new_game_array}. What a shame, you were doing SO well!"
      puts "-" * 80
      puts "Now type that sequence in..."
      make_your_guess_known
    end

    def incorrect_size?(user_data)
      user_data.count != 4
    end

    def used_the_right_colors
      user_data.sort == @game_array.sort
    end

    def finish_the_game
      how_many_in_sequence_are_right
    end

    def how_many_in_sequence_are_right
      correct_colors = 0
      @user_data.each_with_index do |letter, index|
        if letter == @new_game_array[index]
          correct_colors += 1
        end
      end
      puts "You have #{correct_colors} colors in the correct position, of your 4 choices."
      correct_colors
    end

    def lose
      system 'clear'
      puts "You have lost. You don't deserve to know the answer, either."
      play_again?
    end

    def win
        system 'clear'
        puts "Your guess of #{@user_data} was correct, #{@name.capitalize}. It only took you #{number_of_guesses} guesses!"
        puts "You would challenge Mega-mind himself!".upcase
        play_again?
    end

    def play_again?
      puts "Do you want to play again, user? (y/n)"
      user_input = gets.chomp
        if user_input.to_s.start_with?("y")
          load './mastermind_new.rb'
        else
          quit_game
        end
    end

end

megamind = Mastermind.new
megamind.game_set_up
