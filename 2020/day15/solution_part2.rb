input = File.read("#{__dir__}/input.txt").strip.split(",").map(&:to_i)
input_hash = input.map.with_index { |x, i| [x, i]}.to_h

stopping_criterion = 30000000
puts "This will take several seconds, hang on…"

# Grab the last element to start with
last = input.last
input_hash.delete(last)

for i in input.length..(stopping_criterion - 1) do
  previous_index = input_hash[last]

  # Take note as the previous loop as where `last` occurred
  last_position = i - 1
  input_hash[last] = last_position

  # Pick the correct `last` for the next loop
  last = previous_index.nil? ? 0 : last_position - previous_index
end

puts "Solution: #{last}"
