require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../player')
require_relative('../hidden_word')

class TestPlayer < Minitest::Test

  def setup
    @player = Player.new("Bob")
    @string = HiddenWord.new("hello")
    @hidden_string = ["h", "e", "l", "l", "o"]
  end

  def test_player_name
    assert_equal("Bob", @player.name)
  end

  def test_number_of_lives
    assert_equal(6, @player.check_lives)
  end

  def test_life_lost
    @player.remove_life
    assert_equal(5, @player.check_lives)
  end

  def test_guessed_letters
    assert_equal([], @player.check_guessed_letters)
  end

  def test_display_revealed_string
    assert_equal("hello", @string.get_hidden_string.join)
  end

  def test_get_hidden_word
   @player.get_hidden_word(@string.get_hidden_string)
   assert_equal("*****", @player.display_revealed_string)
  end

  def test_change_revealed_string
    @player.get_hidden_word(@hidden_string)
    @player.change_revealed_string("o", @hidden_string, @player)
    assert_equal("****o", @player.display_revealed_string)
  end

  def test_guessed_wrong_letter
    @player.get_hidden_word(@hidden_string)
    @player.change_revealed_string("g", @hidden_string, @player)
    assert_equal("*****", @player.display_revealed_string)
    assert_equal(5, @player.check_lives)
    assert_equal(["g"], @player.check_guessed_letters)
  end
end
