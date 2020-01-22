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

while secret_word != player.display_revealed_string
  p "Please enter a letter to check"
  guessed_letter = gets.chomp()
  player.change_revealed_string(guessed_letter, hidden_word_array, player)
  puts "Your guessed word is #{player.display_revealed_string}"
  puts "Your remaining lives are #{player.check_lives}"
  puts "Your guessed letters are #{player.check_guessed_letters}"
  game.is_game_won(secret_word, player.display_revealed_string)
  game.is_game_lost(player, player.check_lives)

end
