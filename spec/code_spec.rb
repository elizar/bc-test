require_relative '../code.rb'

describe '[ Code ]' do

  describe 'Question 1. #sort_chars' do
    it 'should sort characters in alphabetical order' do
      random_chars = 'cddbeeffa'.chars

      sorted_chars = Code.sort_chars(random_chars)
      expect(sorted_chars).to eq('abcddeeff')
    end
  end

  describe 'Question 2. #palindrome?' do
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

  describe 'Question 3. #reverse' do
    it 'should reverse any given string' do
      string = 'beepboop'

      result = Code.reverse(string)
      expect(result).to eq('poobpeeb')
    end
  end

  describe 'Question 4. #remove_dup' do
    it 'should remove duplicate values from an array' do
      arr = %w(a b a c d e b c)

      result = Code.remove_dup(arr)
      expect(result.join).to eq('abcde')
    end
  end

  describe 'Question 5. #shortest_gap' do
    it 'should find the shortest gap between two set of time' do
      input = ['6:00PM-6:01PM', '6:02AM-6:03AM']

      result = Code.shortest_gap(input)
      expect(result).to eq(43020)
    end
  end

  describe 'Helper fn #sort' do
    it 'should sort unsorted values from an array (ascending)' do
      unsorted_array = [5, 4, 2, 1, 3]

      results = Code.sort(unsorted_array)
      expect(results).to eq([1,2,3,4,5])
    end
  end

end

