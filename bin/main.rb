require_relative '../lib/string.rb'
require_relative '../lib/mastermind.rb'

puts 'Welcome to MasterMind!'
game = Mastermind.new
puts 'What would you like to be ? '.red
puts 'The Coder (Have me guess the colours) or '.blue
puts 'The Decoder (Having you guess the colors)? Choose wisely- because I never lose ;)'.green

puts 'D - Decoder, C - Coder'
choice = gets.strip.downcase

case choice
when "d"
    puts "Welcome Decoder !".green
    game.play
when "c"
    puts "Welcome Coder ! ".blue
    puts "Enter 1st Number: "
    game.coder_array << gets.strip
    puts "Enter 2nd Number: "
    game.coder_array << gets.strip
    puts "Enter 3rd Number: "
    game.coder_array << gets.strip
    puts "Enter 4rth Number: "
    game.coder_array << gets.strip
    puts "Lets play!".green
    game.play
else
    puts "Type d for decoder or c for coder. Nothing else!".red
end
