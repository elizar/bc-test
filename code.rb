module Code

  # Sort characters in alphabetical order
  #
  # Given an input: 'acbaebfdg'
  # Should output: 'aabbcdefg'
  #
  # Code.sort_chars('olelh') => 'hello'
  def Code.sort_chars(a)
    # For readability and simplity
    # let's use selection sort.
    b = []
    a.size.times do |i|
      min = a.min
      b << min
      a.delete_at(a.index(min))
    end

    return b.join
  end

  # Check if given word is a palindrome
  #
  # Code.palindrome?('bobob') => true
  # Code.palindrome?('hello') => false
  def Code.palindrome?(string)
    # Recursive implementation of palindrome.
    if string.length <= 1
      true
    elsif string[0] != string[-1]
      false
    else
      Code.palindrome?(string[1..-2])
    end
  end

  # Reverse any given string
  #
  # Code.reverse('hello') => 'olleh'
  def Code.reverse(string)
    return string if string.length < 2
    string[-1] + Code.reverse("#{string[1..-2]}") + string[0]
  end

  # Removes duplicate value from an array
  #
  # Code.remove_dup(['a', 'b', 'c', 'a']) => ['a', 'b', 'c']
  def Code.remove_dup(arr)
    ele = {}
    new_arr = []

    arr.each do |e|
      if ele[e].nil?
        ele[e] = 1
        new_arr.push(e)
      end
    end

    new_arr
  end

  # Find the shortest gap time between
  # two sets of time.
  #
  # Code.shortest_gap(['6:00PM-6:01PM', '6:02AM-6:03AM']) => 717
  def Code.shortest_gap(arr)
    h = []
    arr.each do |e|
      e.split('-').each do |t|
        hands = t.split(':'); # left-hand is hour & right is minute

        h_hand = hands[0] # hour
        m_hand = hands[1] # minute

        h_hand = h_hand.to_i
        h_hand = h_hand + 12 if /pm/i.match(t) # Convert to 24hr if PM
        m_hand = m_hand.sub(/(am|pm)/i, '').to_i
        t_in_seconds = h_hand * 3600 + m_hand * 60
        h.push t_in_seconds
      end
    end

    h
  end

end
