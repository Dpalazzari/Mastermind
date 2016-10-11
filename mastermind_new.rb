require 'pry'

class Mastermind

    # attr_reader

    attr_accessor :game_array,
                  :guess,
                  :user_input,
                  :new_game_array


    def initialize
      @game_array = ["R", "G", "B", "Y"]
      @guess = 0

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
                guess_counter
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

    def guess_counter
      generate_sequence
      instructions_two
      done_guessing = false
      until done_guessing
        instructions_three
          cheat_options
          done_guessing = true
        end
        compare_answer(user_data)
        end
      end

      def cheat_options
        user_data = gets.chomp.downcase.chars
        if user_data.include?("c")
          puts "The secret key is #{@new_game_array}, you're sooooo good at this game!"
          user_data = gets.chomp.downcase.chars
        elsif user_data.include?("q")
          quit_game
        elsif user_data.count < 4 #All i have is array, now i need to check each element in the array
          puts "You have not made enough selections. Please re-guess."
          user_data = gets.chomp.downcase.chars

        elsif user_data.count > 4
          puts "You have selected too many characters, please guess again."
          user_data = gets.chomp.downcase.chars

        elsif user_data.all? do |letter|
            if game_array.include?(letter) == false
              "Your selection includes colors not available to this game."
              user_data = gets.chomp.downcase.chars
            end
          end
        end
      end


    # def compare_answer(user_data)
    #   @guess += 1




  megamind = Mastermind.new
  megamind.game_set_up
