require_relative 'player.rb'
require_relative 'string.rb'

class Mastermind
  attr_accessor :solution_peg_array, :player_hash, :cpu_hash, :Cpu_player, :player, :coder_input_array

  def initialize
    @solution_peg_array = 4.times.map { %w[red green brown blue magenta cyan].sample }
    @player = Player.new
    @coder_input_array = []
  end

  def compare_guess
    if @player.last_guess == @solution_peg_array
      puts "\nI win! #{@player.last_guess} is correct! It took me #{13 - @player.guesses_left} guesses!"
    else
      cpu_hash = Hash.new(0)
      player_hash = Hash.new(0)
      matches = 0
      color_only = 0
      incorrect = 0
      j = 0
      while j < 4
        if @solution_peg_array[j] == @player.last_guess[j]
          matches += 1
          @player.saved_guesses[j] = @player.last_guess[j]
        end
        j += 1
      end
      @solution_peg_array.each { |color| cpu_hash[color] += 1 }
      @player.last_guess.each { |color| player_hash[color] += 1 }
      cpu_hash.each { |key, value| incorrect += [(value - player_hash[key]), 0].max }
      puts "\n Guess #{13 - @player.guesses_left} is wrong... darnit! #{@player.last_guess} is not correct."
      puts "Correctly guessed #{matches} pegs!"
      color_only = 4 - (incorrect + matches)
      puts "#{color_only} color-only matches."
      puts "#{incorrect} incorrect"
      @player.guesses_left -= 1
      play
    end
  end

  def play
    incorrect = 0
    matches = 0
    color_only = 0
    if @player.guesses_left > 0
      @player.make_guess
      compare_guess
    else
      puts 'No guesses left!'
    end
  end

  def who_is_playing
    puts "Lets Play Mastermind! Would you like to be coder or decoder? (type 'coder' or 'decoder')".red
    coder_or_decoder = gets.chomp
    if coder_or_decoder == 'decoder'
      play
    else
      puts "\nSo you think you can code...huh?"
      puts "\nI never lose! Give me 6 guesses...max!"
      puts "Enter your 4 colors! You can choose #{'red'.red}, #{'green'.green}, #{'brown'.brown}, #{'blue'.blue}, #{'magenta'.magenta}, or #{'cyan'.cyan} "
      puts "\nPeg 1"
      @coder_input_array << gets.chomp
      puts "\nPeg 2"
      @coder_input_array << gets.chomp
      puts "\nPeg 3"
      @coder_input_array << gets.chomp
      puts "\nPeg 4"
      @coder_input_array << gets.chomp
      @player.player_human = false
      @solution_peg_array = @coder_input_array
      play
    end
end
  end
