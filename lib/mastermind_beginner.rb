require_relative 'beginner_module'

class MastermindBeginner
  include BeginnerInstructions

  attr_reader :game_array,
              :new_game_array,
              :guess,
              :user_data,
              :number_of_guesses,
              :start_time,
              :minutes,
              :seconds

  def initialize
    @game_array = ["R", "G", "B", "Y",
                   "R", "G", "B", "Y",
                   "R", "G", "B", "Y"]
    @guess      = []
    @user_data  = []
    @number_of_guesses = 0
  end

  def generate_sequence
     @new_game_array = @game_array.sample(4)
  end

  def start_game
    generate_sequence
    instructions_one
    instructions_two
    @start_time = Time.new
    make_your_guess_known
  end

  def make_your_guess_known
    done_guessing = false
    until done_guessing
      @user_data = gets.chomp.upcase.chars
      secret_key if user_data.include?("C")
      quit_game  if user_data.include?("Q")
      wrong_number_characters if incorrect_size?(user_data)
      check_guess
    end
  end

  def check_guess
    @number_of_guesses += 1
    used_the_right_colors
    answer_accepted
    win  if how_many_in_sequence_are_right == 4
    lose if @number_of_guesses > 9
    total_guess_count
  end

  def secret_key
    system 'clear'
    tell_secret_key
    make_your_guess_known
  end

  def incorrect_size?(user_data)
    user_data.count != 4
  end

  def used_the_right_colors
    user_data.sort == @game_array.sort
  end

  def how_many_in_sequence_are_right
    correct_colors = 0
    @user_data.each_with_index do |letter, index|
      correct_colors += 1 if letter == @new_game_array[index]
    end
    puts "You have #{correct_colors} colors in the correct position, of your 4 choices."
    correct_colors
  end

  def lose
    system 'clear'
    you_lose
    play_again?
  end

  def win
    elapsed_time
    system 'clear'
    correct_guess
    play_again?
  end

  def elapsed_time
    final_time = Time.new
    time = final_time - @start_time
    @minutes = Time.at(time).utc.strftime("%M")
    @seconds = Time.at(time).utc.strftime("%S")
  end

  def play_again?
    ask_play_again
    user_input = gets.chomp
      load './lib/mastermind.rb' if user_input.to_s.start_with?("y")
      quit_game
  end

  def quit_game
      system 'clear'
      see_you_later
      exit
  end

end
