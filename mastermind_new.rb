require 'pry'

class Mastermind

    # attr_reader

    attr_accessor :game_array,
                  :guess,
                  :user_data,
                  :new_game_array


    def initialize
      @game_array = ["R", "G", "B", "Y"]
      @guess = []
      @user_data = []

    end

    def welcome_user
      p "Welcome to MASTERMIND, user."
      p "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    end

    def instructions
      system 'clear'
        puts "1) It is your objective to guess the correct sequence of colors."
        puts "2) You must guess using (R)ED, (B)LUE, (G)REEN, and (Y)ELLOW."
        puts "3) It is the user's job to find the correct colors AND the correct sequence of colors."
        puts "4) You will recieve hints for the position of the colors in the sequence."
        puts "5) You will recieve 5 tries to guess the sequence and the colors, otherwise, you will lose."
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
        name = gets.chomp
            if name == ""
                puts "Come now, even I have a name."
                player_name
            else
                system 'clear'
                puts "Welcome to MASTERMIND, #{name.capitalize}."
                generate_sequence
                instructions_two
                make_your_guess_known
                instructions_three
            end
    end

    def generate_sequence
       @new_game_array = @game_array.sample(4)
    end

    def instructions_two
        puts "I have generated a beginner sequence with four elements made up of: (r)ed,"
        puts "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
        puts "Type (c)heat to reveal the answer at any time...don't worry you're still soooo smart..."
    end

    def instructions_three
      puts "\n"
      puts "Choose from these colors: #{game_array}"
      puts "\n"
      print "Please enter your guess for the four letter code: \n"
    end

    def make_your_guess_known
      done_guessing = false
      until done_guessing == true
        @user_data = gets.chomp.downcase.chars
        if user_data.include?("c")
          secret_key
        elsif user_data.include?("q")
          quit_game
        elsif incorrect_size?(user_data)
          puts "\n"
          puts "You have selected the wrong number of characters, please guess again."
          puts "-" * 69
          puts "Re-enter your guess, please."
        else
          used_the_right_colors
          puts "\n"
          puts "Your guess is valid."
          puts "-" * 20
        end
        # when done_guessing = true
          finish_the_game
      end
    end
  end

    def secret_key
      system 'clear'
      puts "The secret key is #{@new_game_array}. What a shame, you were doing SO well!"
      puts "-" * 77
      puts "Now type that sequence in..."
      make_your_guess_known
    end

    # def not_allowed_colors?(user_data)
    #   user_data.sort != @new_game_array.sort
    # end

    def incorrect_size?(user_data)
      user_data.count != 4
    end

    def used_the_right_colors
      user_data.sort == @game_array.sort
    end

    def finish_the_game
      how_many_in_sequence_are_right(user_data)
    end

    def how_many_in_sequence_are_right(user_data)
      correct_guess = 0
      @user_data.each_with_index do |letter, index|
        if letter == @new_game_array[index]
          correct_guess += 1
          puts "You have #{correct_guess} color in the correct spot out of your 4 guesses."
        end
      end
    end

    # def guess_count_so_far
    #   number_of_guesses = 1
    #   while number_of_guesses < 11
    #     number_of_guesses += 1
    #     puts "You have made #{number_of_guesses} guesses."
    #     # make_your_guess_known
    #   end
    # end

    def guess_count_so_far
      10.times do |letter|
        @user_data.push(make_your_guess_known)
          if @user_data == @new_game_array
            puts "Congrats, you win!"
          else
            puts "Sorry, you have exceeded your max number of guesses. You lose."
          end
      end
    end
    # def compare_answer(user_data)
    #   @guess += 1
    megamind = Mastermind.new
    megamind.game_set_up
