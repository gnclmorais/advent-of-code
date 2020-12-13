file = File.read("#{__dir__}/input.txt")
bus_ids = file.split("\n")[1].split(",")

# [7, 13, x, x, 59] -> [[7, 0], [13, 1], [59, 4]]
bus_id_and_index = bus_ids.each_with_index.reduce([]) do |memo, (bus_id, idx)|
  memo.push [bus_id.to_i, idx] if bus_id != "x"
  memo
end

# Keep record of the current earliest timestamp
earliest_timestamp = 0
running_product = 1

# Inspired by Liz's solution: https://youtube.com/watch?v=z5hR01EmgtM
bus_id_and_index.each do |(bus_id, idx)|
  while (earliest_timestamp + idx) % bus_id != 0
    earliest_timestamp += running_product
  end

  running_product *= bus_id
end

puts "Solution: #{earliest_timestamp}"
