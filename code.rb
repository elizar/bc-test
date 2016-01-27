module Code

  # Sort characters in alphabetical order
  #
  # Given an input: 'acbaebfdg'
  # Should output: 'aabbcdefg'
  #
  # Code.sort_chars('olelh') => 'hello'
  def Code.sort_chars(string)
    Code.sort(string).join
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
  #
  # There's an optional param for setting returned val
  # in minutes instead of second. Just pass `:minute  => true`
  def Code.shortest_gap(arr, opt = { :minute => false })
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

    # Return and convert result into minute format if
    # opt[:minute] is set to true
    return results.shift/60 if opt[:minute] == true

    # Otherwise just return the value
    # in second (default format)
    results.shift
  end


  #########################################################
  #
  # HELPER FUNCTIONS
  #
  #########################################################

  # Sort values from array (ascending)
  #
  # For readability and simplity we'll just
  # use selection sort.
  #
  # For more awesome algo related
  # stuff, visit the link below:
  #
  # http://www.sorting-algorithms.com/
  #
  #
  # Code.sort([4,1,2,5]) => [1,2,4,5]
  def Code.sort(a)
    b = []
    a.size.times do |i|
      min = a.min
      b << min
      a.delete_at(a.index(min))
    end

    b # return sorted array
  end

end
