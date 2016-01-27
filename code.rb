module Code

  # Sort values from array (ascending)
  #
  # Code.sort([4,1,2,5]) => [1,2,4,5]
  def Code.sort(a)
    # For readability and simplity
    # let's use selection sort.
    b = []
    a.size.times do |i|
      min = a.min
      b << min
      a.delete_at(a.index(min))
    end

    b
  end

  # Sort characters in alphabetical order
  #
  # Given an input: 'acbaebfdg'
  # Should output: 'aabbcdefg'
  #
  # Code.sort_chars('olelh') => 'hello'
  def Code.sort_chars(string)
    return Code.sort(string).join
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

  # Find the shortest gap time between two sets of time.
  #
  # Note: Returns number in seconds format.
  #
  # Code.shortest_gap(['6:00PM-6:01PM', '6:02AM-6:03AM']) => 43020
  def Code.shortest_gap(arr)
    # Holds list of parsed time in seconds
    # format.
    time_list = []

    arr.each do |e|
      e.split('-').each do |t|
        # left-hand is hour & right is minute
        digits = t.split(':');

        h = digits[0] # hour
        m = digits[1] # minute

        # hours
        h = h.to_i
        h = h + 12 if /pm/i.match(t) # Convert to 24hr if PM

        # minutes
        m = m.sub(/(am|pm)/i, '').to_i

        t_in_seconds = h * 3600 + m * 60
        time_list << t_in_seconds
      end
    end

    results = Code.sort([
      (time_list[3] - time_list[0]).abs,
      (time_list[3] - time_list[1]).abs,
      (time_list[2] - time_list[0]).abs,
      (time_list[2] - time_list[1]).abs
    ])

    # First item should be the shortest
    results.shift
  end

end
