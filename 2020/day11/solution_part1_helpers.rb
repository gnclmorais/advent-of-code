def deep_clone(array_of_strings)
  Marshal.load(Marshal.dump(array_of_strings))
  # array_of_strings.map(&:dup)
end

def adjacent_occupied_seats(all_seats, y, x)
  max_y = all_seats.length - 1
  max_x = all_seats.first.length - 1

  [
    [y - 1, x - 1], [y - 1, x], [y - 1, x + 1],
    [y    , x - 1],             [y    , x + 1],
    [y + 1, x - 1], [y + 1, x], [y + 1, x + 1],
  ]
  .filter { |(y, x)| y.between?(0, max_y) && x.between?(0, max_x) }
  .reduce("") { |acc, (y, x)| acc + all_seats[y][x] }
  .count("#")
end
