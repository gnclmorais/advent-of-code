directions = %i[east south west north]
where_to = directions.cycle
east, south, west, north = directions

facing = where_to.next # starting direction
x, y = [0, 0] # x -> west/east, y -> north/south

# Get the file line by line
IO.foreach("#{__dir__}/input.txt") do |line|
  action, value = line.slice!(0), line.to_i

  case action
  when "N" then y += value
  when "S" then y -= value
  when "E" then x += value
  when "W" then x -= value
  when "L" then (3 * value / 90).times { facing = where_to.next }
  when "R" then (value / 90).times { facing = where_to.next }
  when "F"
    case facing
    when north then y += value
    when south then y -= value
    when east  then x += value
    when west  then x -= value
    end
  end
end

manhattan_distance = x.abs + y.abs

puts "Solution: #{manhattan_distance}"
