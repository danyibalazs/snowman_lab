require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../hidden_word')

class TestHiddenWord < Minitest::Test

  def setup
    @string = HiddenWord.new("hello")
  end

  def test_check_hidden_string
    assert_equal(["h","e","l","l","o"], @string.get_hidden_string())
  end

end
