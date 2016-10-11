class Mastermind
    LETTERS = ["R", "G", "B", "Y"]

    attr_accessor :name,


    def initialize
    @name = name
    @game_array = LETTERS
    @user_array = []
    @clue = clue
    end

    def welcome_user
        puts "Welcome to MASTERMIND, user."
        puts "Would you like to (p)lay, read the noobie (i)nstructions, or (q)uit?"
    end

    def instructions
          system 'clear'
            puts "1) It is your objective to guess the correct sequence of colors."
            puts "2) You must guess using (R)ED, (B)LUE, (G)REEN, and (Y)ELLOW."
            puts "3) It is the user's job to find the correct colors AND the correct sequence of colors."
            puts "4) You will recieve hints for the position of the colors in the sequence."
            puts "5) You will recieve 10 tries to guess the sequence and the colors, otherwise, you will be deemed a plebian and lose."
            puts "Are the instructions clear? (y/n)"
    end

    def not_understand_instructions
        system 'clear'
        puts "Just wing it, and figure it out as you play, okay?"
        puts "If you cannot figure it out, MASTERMIND is not for you."
    end

    def quit_game
        system 'clear'
        puts "See you later, user. Come back and lose again sometime."
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
                game_flow
            end
    end

    #this is where it breaks

    def generate_sequence #need to generate a random 4 element array out of the letters
       @game_array = @game_array.shuffle
        # game_flow
    end

    def instructions_two
        puts "I have generated a beginner sequence with four elements made up of: (r)ed,"
        puts "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
    end

    def computer_logic
        if user_input.start_with?("c")
            puts @game_array
            game_flow
        elsif @game_array.include?(user_input)
            puts "Please, enter your next guess:"
            user_input = gets.chomp
            @user_array << user_input
        end
    end

    def get_results
        index = 0
            while index < @user_array.length
                if @user_array[index] == @game_array[index]
                    @clue[index] = "Correct"
                elsif @game_array.include?(@user_array[index])#how and where to implement this
                    @clue[index] = "Almost"
                else
                    @clue[index] = "Incorrect"
                end
            index += 1
        end
        return @clue
    end

    def game_flow
        generate_sequence
        instructions_two
        user_input = gets.chomp
            while !user_input.start_with?("q") && @user_array.size != 4
                computer_logic
            end
            if @game_array == @user_array
                puts "You win, user. You are a Mastermind."
            else
                "You lose, plebian."
            end
                # user_input.start_with?("q") #part of while condition
                # quit_game
    end
end

megamind = Mastermind.new
megamind.game_set_up
