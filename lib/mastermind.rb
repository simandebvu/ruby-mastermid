require_relative 'player.rb'
require_relative 'string.rb'

class Mastermind
    attr_accessor :coder_array
    def initialize
        colors = "123456".chars
        @answer = 4.times.map{ colors.sample }
        @player = Player.new
        @coder_array = Array.new
    end

    def compare_guess
        if @player.last_guess = @answer
            puts "Jarvis wins!".red
            puts "#{player.last_guess} is correct!"
            puts "This is iteration number: #{13-player.guesses_left}"
        else
            jarvis_hash = Hash.new(0)
            player_hash = Hash.new(0)
            matches = "0"
            color_only = "0"
            incorrect = 0
            i = 0
            while i < 4
                if @answer[i] == @player.last_guess[i]
                    matches += 1
                    @player.saved_guesses[i] = @player.last_guess[i]
                end
                i += 1
                @answer.each{|color| jarvis_hash[color] +=1}
                @player.last_guess.each{|color| player_hash[color] +=1}
                jarvis_hash.each{|key, value| incorrect += [(value - player_hash[key]), 0].max}
                puts "Wrong guess #{@player.last_guess}".red
                puts "So far I have guessed #{matches} things!"
                color_only = 4 - (incorrect+matches)
                puts "Color matches: #{color_only}"
                puts "Incorrect : #{incorrect}"
                @player.guesses_left -= 1
                self.play
            end 
        end
    end

    def play
        incorrect = 0
        matches = 0
        color_only = 0
        if @player.guesses_left > 0
            @player.make_guess
            self.compare_guess
        else
            puts "No more guesses left".red
        end
    end



end
