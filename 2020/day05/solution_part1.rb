require_relative "solution_helpers"

input_file = "#{__dir__}/input.txt"
highest_seat_id = 0

# Get the correct index where to split a string before the loop starts
split = File.open(input_file, &:readline).strip.length - 3

IO.foreach(input_file) do |line|
  row, col = [line[0..split - 1], line[split..]]

  row_num = row_number(row)
  col_num = col_number(col)
  seat_id = row_num * 8 + col_num

  highest_seat_id = [highest_seat_id, seat_id].max
end

puts "Solution: #{highest_seat_id}"
