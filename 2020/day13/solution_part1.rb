# Get the whole file and assign the right meaning to each line
file = File.read("#{__dir__}/input.txt")
earliest_timestamp_line, bus_ids_line = file.split("\n")

# Clean up the lines so we can easily manipulate them
earliest_timestamp = earliest_timestamp_line.to_i
bus_ids = bus_ids_line.gsub(/x/, "").gsub(/,+/, ",").split(",").map(&:to_i)

# Get the smallest waiting time and the corresponding bus ID
next_departs = bus_ids.map { |bus_id| bus_id - (earliest_timestamp % bus_id) }
waiting_minutes = next_departs.min
earliest_bus_id = bus_ids[next_departs.index(waiting_minutes)]

puts "Solution: #{waiting_minutes * earliest_bus_id}"
