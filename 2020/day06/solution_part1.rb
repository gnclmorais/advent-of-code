current_line = ""
sum_of_counts = 0

IO.foreach("#{__dir__}/input.txt") do |line|
  # Store this line and move to the next one until we get an emply line
  current_line += line.strip and next if line.length > 1

  sum_of_counts += current_line.chars.uniq.length

  current_line = ""
end

unless current_line.empty?
  sum_of_counts += current_line.chars.uniq.length
end

puts "Solution: #{sum_of_counts}"
