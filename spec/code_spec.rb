require_relative '../code.rb'

describe '[ Code ]' do

  describe '#sort_chars' do
    it 'should sort characters in alphabetical order' do
      random_chars = 'cddbeeffa'.chars

      sorted_chars = Code.sort_chars(random_chars)
      expect(sorted_chars).to eq('abcddeeff')
    end
  end

  describe '#palindrome?' do
    it 'should return true for palindrome word' do
      palindrome_word = 'efcfe'

      result = Code.palindrome?(palindrome_word)
      expect(result).to be(true)
    end

    it 'should return false for non-palindrome word' do
      nonpalindrome_word = 'hello'

      result = Code.palindrome?(nonpalindrome_word)
      expect(result).to be(false)
    end
  end

  describe '#reverse' do
    it 'should reverse any given string' do
      string = 'beepboop'

      result = Code.reverse(string)
      expect(result).to eq('poobpeeb')
    end
  end

  describe '#remove_dup' do
    it 'should remove duplicate values from an array' do
      arr = %w(a b a c d e b c)

      result = Code.remove_dup(arr)
      expect(result.join).to eq('abcde')
    end
  end

  describe '#shortest_gap' do
    it 'should find the shortest gap between two set of time' do
      input = ['6:00PM-6:01PM', '6:02AM-6:03AM']

      result = Code.shortest_gap(input)
      expect(result).to eq(717)
    end
  end

end

