class Game

  def initialize()
    @guessed_letters = []
  end

  def is_game_lost(player, lives)
    if player.check_lives == 0
      p "Sorry, you ran out of lives. Try again!"
    end
  end

  def is_game_won(string, hidden_string)
    hidden_string = hidden_string.hidden_string_array.join
    if string == hidden_string
      p "You win!"
    end
  end






end
