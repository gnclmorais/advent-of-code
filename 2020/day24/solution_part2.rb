require_relative "solution_part2_helpers"

past_tiles = starting_tiles
current_tiles = nil

100.times do
  current_tiles = deep_clone(past_tiles)
  all_black_adjacent = []

  blacks = past_tiles.filter { |_, value| value == "B" }.keys
  whites = past_tiles.filter { |_, value| value == "W" }.keys

  # Iterate over black tiles
  blacks.each do |coordinates|
    x, y, z = coordinates.split(",").map(&:to_i)

    adjacent_coordinates = adjacent(x, y, z)
    adjacent_blacks = adjacent_values(past_tiles, adjacent_coordinates)
    adjacent_count = adjacent_blacks.join.count("B")

    current_tiles[label(x, y, z)] = "W" if adjacent_count == 0 || adjacent_count > 2

    all_black_adjacent.concat(adjacent_coordinates)
  end

  # Get the "unknown" whites, white-by-default tiles adjacent to black tiles
  unknown_whites = all_black_adjacent.uniq
    .filter { |(x, y, z)| past_tiles[label(x, y, z)] == nil }
    .map { |coordinates| coordinates.join(",") }

  # Iterate over (known) white tiles
  whites.concat(unknown_whites).each do |coordinates|
    x, y, z = coordinates.split(",").map(&:to_i)

    adjacent_coordinates = adjacent(x, y, z)
    adjacent_blacks = adjacent_values(past_tiles, adjacent_coordinates)
    adjacent_count = adjacent_blacks.join.count("B")

    current_tiles[label(x, y, z)] = "B" if adjacent_count == 2
  end

  past_tiles = current_tiles
end

puts "Solution: #{current_tiles.values.join.count("B")}"
