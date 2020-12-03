input_file = "#{__dir__}/input.txt"
tree = "#"
trees_found = 0
current_position = 0

# Get the first index where we'll be out of map, so we can repeat it
border = File.open(input_file, &:readline).strip.length

IO.foreach(input_file).with_index do |line, line_number|
  # Skip just the first line, then count if it's a tree
  if line_number > 0
    trees_found += 1 if line[current_position] == tree
  end

  # Move right
  current_position += 3

  # Wrap around the map if needed
  current_position %= border
end

puts "Solution: #{trees_found}"
