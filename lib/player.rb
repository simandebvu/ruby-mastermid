class Player
  attr_accessor :guesses_left, :last_guess, :player_human, :saved_guesses, :colors, :saved_colors, :slot_one_colors, :slot_two_colors, :slot_three_colors, :slot_four_colors
  def initialize
    @guesses_left = 12
    @last_guess = []
    @player_human = true
    @saved_guesses = ['', '', '', '']
    @colors = %w[red green brown blue magenta cyan]
    @slot_one_colors = %w[red green brown blue magenta cyan]
    @slot_two_colors = %w[red green brown blue magenta cyan]
    @slot_three_colors = %w[red green brown blue magenta cyan]
    @slot_four_colors = %w[red green brown blue magenta cyan]
  end

  def make_guess
    if @player_human == true
      @last_guess = []
      puts 'Guess peg 1'
      @last_guess << gets.strip
      puts 'Guess peg 2'
      @last_guess << gets.strip
      puts 'Guess peg 3'
      @last_guess << gets.strip
      puts 'Guess peg 4'
      @last_guess << gets.strip
      puts "Last guess was #{last_guess} "
    end
    if @player_human == false
      @last_guess = []
      i = 0
      while i < 4
        if @saved_guesses[i] != ''
          @last_guess[i] = @saved_guesses[i]
        else
          if i == 0
            samp = @slot_one_colors.sample
            @slot_one_colors -= [samp]
            @last_guess[i] = samp
          elsif i == 1
            samp = @slot_two_colors.sample
            @slot_two_colors -= [samp]
            @last_guess[i] = samp
          elsif i == 2
            samp = @slot_three_colors.sample
            @slot_three_colors -= [samp]
            @last_guess[i] = samp
          else
            samp = @slot_four_colors.sample
            @slot_four_colors -= [samp]
            @last_guess[i] = samp
          end
        end
        i += 1
      end
    end
    end
    end
