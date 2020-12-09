numbers = File.read("#{__dir__}/input.txt").split("\n").map(&:to_i)
numbers_length = numbers.length - 1
preamble_size = 25

for i in preamble_size..numbers_length do
  number   = numbers[i]
  preamble = numbers[(i - preamble_size)..i]

  # Subtract each of the preamble numbers to the number we have and
  # look for the differences in the preamble, see if we can't find a match
  preamble_diffs = preamble.map { |num| number - num }
  found_sum = preamble_diffs.any? do |diff|
    preamble.include?(diff) && diff * 2 != number
  end

  # Save the number found and its index for the next part
  (key, idx = [number, i]) and break unless found_sum
end
puts "Key: #{key}"

for i in 0..(numbers_length - 1) do
  for j in (i + 1)..numbers_length do
    subset = numbers[i..j]

    # Break the inner loop if we found a solution
    solution = subset.min + subset.max and break if subset.sum == key
  end

  # Break the outer loop if a solution has been set
  break if defined?(solution) && !solution.nil?
end
puts "Solution: #{solution}"
