# Translate an Integer to a String and vice verso
class Bijective
  ALPHABET = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'.freeze

  class << self
    def encode(number)
      return ALPHABET[0] if number.zero?
      return nil if number.nil?

      string = ''
      base = ALPHABET.length

      while number.positive?
        string << ALPHABET[number.modulo(base)]

        number /= base
      end

      string.reverse
    end

    def decode(string)
      number = 0

      base = ALPHABET.length

      string.each_char do |character|
        number = number * base + ALPHABET.index(character)
      end

      number
    end
  end
end
