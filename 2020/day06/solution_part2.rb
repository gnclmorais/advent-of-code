current_line = []
sum_of_counts = 0
a2z = "a".upto("z").to_a

IO.foreach("#{__dir__}/input.txt") do |line|
  # Store this line and move to the next one until we get an emply line
  current_line.push(line.strip.split("")) and next if line.length > 1

  sum_of_counts += current_line.reduce(a2z) { |acc, arr| acc & arr }.length

  current_line = []
end

unless current_line.empty?
  sum_of_counts += current_line.reduce(a2z) { |acc, arr| acc & arr }.length
end

puts "Solution: #{sum_of_counts}"
