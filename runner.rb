require_relative('./player')
require_relative('./hidden_word')
require_relative('./game')

p "Input a secret word"
secret_word = gets.chomp()

hidden_string = HiddenWord.new(secret_word)
system("clear")
p "What's your name?"
player_name = gets.chomp()
player = Player.new(player_name)
player.get_hidden_word(hidden_string.get_hidden_string)


hidden_word_array = hidden_string.get_hidden_string
game = Game.new()

puts "This is your string: #{player.display_revealed_string}"

while secret_word != player.display_revealed_string
  puts ""
  puts "Please enter a letter to check"
  puts ""
  guessed_letter = gets.chomp().downcase()
  player.change_revealed_string(guessed_letter, hidden_word_array, player)
  puts ""
  puts "Your guessed word is #{player.display_revealed_string}"
  puts ""
  puts "Your remaining lives are #{player.check_lives}"
  puts "Your guessed letters are #{player.check_guessed_letters}"
  puts ""
  game.is_game_won(secret_word, player.display_revealed_string)

  if player.check_lives == 0
    p "Sorry, you ran out of lives. Try again!".upcase()
    puts ""
    return
  end
end
