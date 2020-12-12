require_relative "solution_part2_helpers"

directions = %i[east south west north]
where_to   = directions.cycle

east, south, west, north = directions
facing = where_to.next

#         N (+y)
#          ↑ 
# W (-x) ←  → E (+x)
#          ↓
#         S (-y)
ship_x, ship_y = [0, 0]
waypoint_x, waypoint_y = [10, 1]

IO.foreach("#{__dir__}/input.txt") do |line|
  action, value = line.slice!(0), line.to_i

  case action
  when "N" then waypoint_y += value
  when "S" then waypoint_y -= value
  when "E" then waypoint_x += value
  when "W" then waypoint_x -= value
  when "L"
    3.times { waypoint_x, waypoint_y = rotate(waypoint_x, waypoint_y, value) }
  when "R"
    waypoint_x, waypoint_y = rotate(waypoint_x, waypoint_y, value)
  when "F"
    ship_x += waypoint_x * value
    ship_y += waypoint_y * value
  end
end

manhattan_distance = ship_x.abs + ship_y.abs

puts "Solution: #{manhattan_distance}"
