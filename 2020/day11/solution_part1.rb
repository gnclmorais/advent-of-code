require_relative "solution_part1_helpers"

# Slurp the whole file, so we can work with the whole thing simultaneously
seats = File.read("#{__dir__}/input.txt").split("\n")

floor = "."
empty = "L"
occupied = "#"
past_round = seats.dup

iter = 0

loop do
  current_round = deep_clone(past_round)

  past_round.each_with_index do |row, y|
    row.chars.each_with_index do |seat, x|
      next if seat == floor

      nr_occupied_seats = adjacent_occupied_seats(past_round, y, x)
      current_round[y][x] = occupied and next if seat == empty && nr_occupied_seats == 0
      current_round[y][x] = empty and next if seat == occupied && nr_occupied_seats >= 4
    end
  end

  break if past_round.join("") == current_round.join("")

  past_round = current_round
end

puts "Solution: #{past_round.join("").count(occupied)}"
