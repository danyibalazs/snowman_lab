class HiddenWord
  def initialize(hidden_string)
    @hidden_string_array = hidden_string.split("")
  end

  def get_hidden_string
    return @hidden_string_array
  end

  def check_if_letter_is_in_string(letter)
    @hidden_string_array.include?(letter)
  end

end
