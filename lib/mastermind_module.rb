module MastermindInstructions

  def welcome_user
    puts "Welcome to MASTERMIND, user."
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  end

  def instructions
    system 'clear'
      puts "1) It is your objective to guess the correct sequence of colors."
      puts "2) You must guess using the provided colors. Colors are different depending on the difficulty."
      puts "3) It is the user's job to find the correct colors AND the correct sequence of colors."
      puts "4) You will recieve hints of how many of your guesses are correct."
      puts "5) You will recieve 10 tries to guess the sequence and the colors, otherwise, you will lose."
      puts "-" * 81
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

  def difficulty_instructions
    puts "Please select your preferred level of difficulty: "
    puts "(B)eginner, (I)ntermediate, or (A)dvanced."
  end

end
