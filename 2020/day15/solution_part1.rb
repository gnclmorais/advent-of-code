input = File.read("#{__dir__}/input.txt").strip.split(",").map(&:to_i)

STOPPING_CRITERION = 2020

def memory_game(numbers)
  last = numbers.last
  return last if numbers.length == STOPPING_CRITERION

  r_index = numbers.rindex(last)
  l_index = numbers[0..r_index - 1].rindex(last) || r_index

  memory_game(numbers + [r_index - l_index])
end

puts "Solution: #{memory_game(input)}"
