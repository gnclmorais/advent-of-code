numbers = File.read("#{__dir__}/input.txt").split("\n").map(&:to_i)
preamble_size = 25

for i in preamble_size..(numbers.length - 1) do
  number   = numbers[i]
  preamble = numbers[(i - preamble_size)..i]

  preamble_diffs = preamble.map { |num| number - num }
  found_sum = preamble_diffs.any? do |diff|
    preamble.include?(diff) && diff * 2 != number
  end

  solution = number and break unless found_sum
end

puts "Solution: #{solution}"
