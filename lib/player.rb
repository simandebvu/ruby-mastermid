require_relative 'string.rb'
require_relative 'main.rb'

class Player
    def initialize 
        @guesses = 12
        @last_guess = Array.new
        @player_human = true
        @saved_guesses = Array.new(4, '')
        @colors = Array(1..6)
        @slot_one_colors = Array(1..6)
        @slot_two_colors = Array(1..6)
        @slot_three_colors = Array(1..6)
        @slot_four_colors = Array(1..6)
    end

    def make_guess
        if @player_human == true
            @last_guess = Array.new
            puts "Guess 1"
            @last_guess << gets.strip
            puts "Guess 2"
            @last_guess << gets.strip
            puts "Guess 3"
            @last_guess << gets.strip
            puts "Guess 4"
            @last_guess << gets.strip
            puts "Last guess : #{@last_guess}"
        else
            @last_guess = Array.new
            i = 0
            if !@saved_guesses[i].empty?
                @last_guess[i] = @saved_guesses[i]
            else
                if i == 0
                    s = @slot_one_colors.sample
                    @slot_one_colors -= s
                    @last_guess[i] = s
                elsif i == 1
                    s = @slot_two_colors.sample
                    @slot_two_colors -= s
                    @last_guess[i] = s
                elsif i == 2
                    s = @slot_three_colors.sample
                    @slot_three_colors -= s
                    @last_guess[i] = s
                else
                    s = @slot_four_colors.sample
                    @slot_four_colours -= s
                    @last_guess[i] = s
                end
            end
            i += 1
        end
    end
end


