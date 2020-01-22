class HiddenWord
  def initialize(hidden_string)
    @hidden_string_array = hidden_string.split("")
  end

  def get_hidden_string
    return @hidden_string_array
  end

end
