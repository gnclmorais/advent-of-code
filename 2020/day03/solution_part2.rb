input_file = "#{__dir__}/input.txt"
tree = "#"

# Get the first index where we'll be out of map, so we can repeat it
border = File.open(input_file, &:readline).strip.length

# Number of moves per direction: [right, down]
variants = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2],
]

all_trees_found = variants.reduce(1) do |acc, (right, down)|
  trees_found = 0
  current_position = 0

  IO.foreach(input_file).with_index do |line, line_number|
    # Take into consideration when we move more than one line at a time
    next if line_number % down > 0

    # Skip just the first line, then count if it's a tree
    if line_number > 0
      trees_found += 1 if line[current_position] == tree
    end

    # Move right
    current_position += right

    # Wrap around the map if needed
    current_position -= border if current_position >= border
  end

  acc * trees_found
end

puts "Solution: #{all_trees_found}"
