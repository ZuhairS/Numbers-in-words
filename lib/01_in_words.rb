class Fixnum

  def in_words
    nums_in_word = {
      0 => "zero",
      1 => "one",
      2 => "two",
      3 => "three",
      4 => "four",
      5 => "five",
      6 => "six",
      7 => "seven",
      8 => "eight",
      9 => "nine",
      10 => "ten",
      11 => "eleven",
      12 => "twelve",
      13 => "thirteen",
      14 => "fourteen",
      15 => "fifteen",
      16 => "sixteen",
      17 => "seventeen",
      18 => "eighteen",
      19 => "nineteen",
      20 => "twenty",
      30 => "thirty",
      40 => "forty",
      50 => "fifty",
      60 => "sixty",
      70 => "seventy",
      80 => "eighty",
      90 => "ninety",
      100 => "hundred",
      1000 => "thousand",
      1_000_000 => "million",
      1_000_000_000 => "billion",
      1_000_000_000_000 => "trillion"
    }

    if self < 10
      ones(nums_in_word)
    elsif self < 100
      tens(nums_in_word)
    elsif self < 1000
      hundreds
    elsif self < 1_000_000
      thousands
    elsif self < 1_000_000_000
      millions
    elsif self < 1_000_000_000_000
      billions
    elsif self < 1_000_000_000_000_000
      trillions
    end
  end

  private

  def ones(nums_in_word)
    nums_in_word[self]
  end

  def tens(nums_in_word)
    return nums_in_word[self] if nums_in_word.key?(self)
    first_num_in_tens = (self.to_s.chars[0] + "0").to_i
    second_digit = self % 10
    "#{first_num_in_tens.in_words} #{second_digit.in_words}"
  end

  def hundreds
    first_digit = self / 100
    other_digits = self % 100
    return "#{first_digit.in_words} hundred" if other_digits == 0
    "#{first_digit.in_words} hundred #{other_digits.in_words}"
  end

  def thousands
    return "#{(self / 1000).in_words} thousand" if (self % 1000) == 0
    "#{(self / 1000).in_words} thousand #{(self % 1000).in_words}"
  end

  def millions
    return "#{(self / 1_000_000).in_words} million" if (self % 1_000_000) == 0
    "#{(self / 1_000_000).in_words} million #{(self % 1_000_000).in_words}"
  end

  def billions
    return "#{(self / 1_000_000_000).in_words} billion" if (self % 1_000_000_000) == 0
    "#{(self / 1_000_000_000).in_words} billion #{(self % 1_000_000_000).in_words}"
  end

  def trillions
    return "#{(self / 1_000_000_000_000).in_words} trillion" if (self % 1_000_000_000_000) == 0
    "#{(self / 1_000_000_000_000).in_words} trillion #{(self % 1_000_000_000_000).in_words}"
  end

end
