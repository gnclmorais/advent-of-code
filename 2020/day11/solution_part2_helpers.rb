def deep_clone(array_of_strings)
  array_of_strings.map(&:dup)
end

DIRECTIONS = [
  [-1, -1], [-1, 0], [-1, +1],
  [ 0, -1],          [ 0, +1],
  [+1, -1], [+1, 0], [+1, +1],
]

def visible_occupied_seats(all_seats, y, x)
  floor = "."
  occupied = "#"
  max_y = all_seats.length - 1
  max_x = all_seats.first.length - 1

  # LLL
  # LLL
  # LLL --> Imagine this string is a matrix
  seats = "........."

  for i in 1..[max_y, max_x].max do
    DIRECTIONS
      .map { |(y_delta, x_delta)| [y_delta * i + y, x_delta * i + x] }
      .each_with_index do |(yy, xx), j|
        if seats[j] == floor && yy.between?(0, max_y) && xx.between?(0, max_x)
          seats[j] = all_seats[yy][xx] 
        end
      end

    # Return earlier if we can
    nr_occupied = seats.count(occupied)
    return nr_occupied if nr_occupied >= 5
    return nr_occupied if seats.count(floor).zero?
  end

  seats.count(occupied)
end
