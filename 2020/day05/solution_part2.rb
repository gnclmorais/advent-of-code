require_relative "solution_helpers"

input_file = "#{__dir__}/input.txt"
all_seat_ids = []

# Get the correct index where to split a string before the loop starts
split = File.open(input_file, &:readline).strip.length - 3

IO.foreach(input_file) do |line|
  row, col = [line[0..split - 1], line[split..]]

  row_num = row_number(row)
  col_num = col_number(col)
  seat_id = row_num * 8 + col_num

  all_seat_ids.push(seat_id)
end

expected_seat_ids = all_seat_ids.min..all_seat_ids.max
missing_seat_ids = expected_seat_ids.to_a - all_seat_ids

if missing_seat_ids.length == 1
  puts "Solution: #{missing_seat_ids.first}"
else
  raise "Error: expected a single seat missing but found more :("
end
