class Player

  attr_reader :name

  def initialize(name)
    @name = name
    @number_of_lives = 6
    @guessed_letters = []
    @revealed_string = []
  end

  def check_lives
    return @number_of_lives
  end

  def remove_life
    @number_of_lives -= 1
  end

  def check_guessed_letters
    return @guessed_letters
  end

  def display_revealed_string()
    return @revealed_string.join()
  end

  def get_hidden_word(hidden_word_array)
    for letter in hidden_word_array
      @revealed_string.push("*")
    end
  end

  def add_guess_letter(letter)
    @guessed_letters.push(letter)
  end

    def change_revealed_string(guessed_letter, hidden_word_array, player)
      if hidden_word_array.include?(guessed_letter)
        index = 0
        for letter in hidden_word_array
          if letter == guessed_letter
            @revealed_string[index] = letter
          end
          index += 1  
        end
        add_guess_letter(guessed_letter)
      else
        player.remove_life()
        add_guess_letter(guessed_letter)
      end
    end

end
