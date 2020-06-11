puts 'Welcome to MasterMind!'

puts 'What would you like to be ? The Coder (Have me guess the colours) or the Decoder (Having you guess the colors)? '
puts 'Choose wisely- because I never lose ;)'

puts 'D - Decoder, C - Coder'
choice = gets.strip.downcase

case choice
when 'd'
  puts 'Welcome Decoder !'
  puts 'Guess #1 : '
when 'c'
  puts 'Welcome Coder ! '
else
  puts 'Type d for decoder or c for coder. Nothing else!'
end
