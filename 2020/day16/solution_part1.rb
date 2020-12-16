valid_ranges, my_ticket, nearby_tickets = File.read("#{__dir__}/input.txt").split("\n\n")

# Transform 
valid_ranges = valid_ranges.split("\n").map do |range_line|
  range_line.split(": ")[1].split(" or ").map do |range_str|
    Range.new(*range_str.split("-").map(&:to_i))
  end
end.flatten

# Split by line break, drop the first line (title) and format the lines
nearby_tickets = nearby_tickets.split("\n")
nearby_tickets.shift
nearby_tickets = nearby_tickets.map { |line| line.split(",").map(&:to_i) }

error_rate = 0

# For each ticket, check if all its numbers belong to a range
nearby_tickets.each do |ticket_numbers|
  ticket_numbers.each do |number|
    next if valid_ranges.any? { |range| range.include?(number) }

    error_rate += number and break
  end
end

puts "Solution: #{error_rate}"
