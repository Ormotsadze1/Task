#Fill the hash with vowel letters

class Letters
  def vowel_letters
    vowel = {
      "a" => "a".ord - "a".ord + 1,
      "e" => "e".ord - "a".ord + 1,
      "i" => "i".ord - "a".ord + 1,
      "o" => "o".ord - "a".ord + 1,
      "u" => "u".ord - "a".ord + 1
    }
  end
end

puts Letters.new.vowel_letters

