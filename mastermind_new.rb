require 'pry'

class Mastermind
    LETTERS = ["R", "G", "B", "Y"]

    attr_reader :name,
                :user_input


    def initialize
    @name = name
    @game_array = LETTERS
    @user_data
    @guess = 0

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
        puts "See you later, user. Come back aand play again, sometime."
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
        #continue on to next method
            if @name == ""
                puts "Come now, even I have a name."
                player_name
            else
                system 'clear'
                puts "Welcome to MASTERMIND, #{@name.capitalize}."
                guess_counter
            end
    end

    def generate_sequence #need to generate a random 4 element array out of the LETTERS
       LETTERS.sample(4)
        # game_flow
    end

    def instructions_two
        puts "I have generated a beginner sequence with four elements made up of: (r)ed,"
        puts "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
        puts "Type (c)heat to reveal the answer at any time...don't worry you're still soooo smart..."
    end

    def instructions_three
      puts "\n"
      puts "Choose from these LETTERS: #{LETTERS}"
      puts "\n"
      print "Please enter your guess for the four letter code: \n"
    end

    def guess_counter
      generate_sequence
      instructions_two
      done_guessing = false
      until done_guessing
        instructions_three
        user_data = gets.chomp.downcase.chars
        #assigning to instance variable
          if user_data.count < 4#All i have is array, now i need to check each element in the array
            puts "You have not made enough selections. Please re-guess."
            user_data = gets.chomp.downcase.chars

          elsif user_data.count > 4
            puts "You have selected too many characters, please guess again."
            user_data = gets.chomp.downcase.chars
            binding.pry
          elsif user_data.all? do |letter|
              if LETTERS.include?(letter) == false
                "Your selection includes colors not available to this game."
                user_data = gets.chomp.downcase.chars
              end
            end
          end
          done_guessing = true
        end
          #call next method: check_the_guesses
        end
      end


    def check_the_guesses
      @guess += 1


end

  megamind = Mastermind.new
  megamind.game_set_up
