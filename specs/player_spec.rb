require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../player')
require_relative('../hidden_word')

class TestPlayer < Minitest::Test

  def setup
    @player = Player.new("Bob")
    @string = HiddenWord.new("hello")
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









end
