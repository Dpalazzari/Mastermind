module BeginnerInstructions

  def welcome_to_mastermind
    system 'clear'
    puts "-" * 28
    puts "Welcome to MASTERMIND, #{name.capitalize}."
    puts "-" * 28
  end

  def instructions_one
      puts "I have generated a beginner sequence with four elements made up of: (r)ed,"
      puts "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
      puts "~" * 87
      puts "Be sure and guess the right number of colors, errors will be counted as a guess."
      puts "\n"
      puts "The user can (c)heat if they find the game too hard. COLORS CAN BE USED MORE THAN ONCE."
      puts "~" * 87
      puts "~" * 87
  end

  def instructions_two
    puts "\n"
    puts "Choose from these colors: R, G, Y, B"
    puts "\n"
    print "Please enter your 4 guesses for the Mastermind  code: \n"
  end

  def wrong_number_characters
    puts "\n"
    puts "Be careful, you have selected the wrong number of characters."
    puts "=" * 69
  end

  def answer_accepted
    puts "~" * 16
    puts "Answer submitted."
    puts "~" * 16
  end

  def total_guess_count
    puts "You have made #{number_of_guesses} guesses."
  end

  def tell_secret_key
    puts "The secret key is #{@new_game_array.join(", ")}. What a shame, you were doing SO well!"
    puts "-" * 80
    puts "Now type that sequence in..."
  end

  def correct_guess
    puts "Your guess of #{@user_data.join( ", ")} was correct. It only took you #{number_of_guesses} guesses!"
    puts "*" * 90
    puts "Congrats, #{name.capitalize}! You completed the game in #{@minutes} minutes and #{@seconds} seconds!"
    puts "*" * 90
    puts "You would challenge Mega-mind himself!"
  end

  def you_lose
    puts "You have lost. You don't deserve to know the answer, either."
  end

  def see_you_later
    puts "See you later, user. Come back and play again, sometime."
  end

  def ask_play_again
    puts "Do you want to play again, user? (y/n)"
  end

end
