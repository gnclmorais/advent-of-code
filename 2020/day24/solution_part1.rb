tiles = {}

IO.foreach("#{__dir__}/input.txt") do |steps_line|
  # Starting point, inspired by https://www.redblobgames.com/grids/hexagons/#coordinates-cube
  x, y, z = [0, 0, 0]

  # "swsenw" -> ["s", "w", "s", "e", "n", "w"]
  steps = steps_line.strip.split("")

  while steps.length > 0 do
    # Get next coordinate
    direction  = steps.shift
    direction += steps.shift if %w(n s).include? direction

    case direction
    when "e"  then x += 1 and y -= 1
    when "se" then            y -= 1 and z += 1 
    when "sw" then x -= 1            and z += 1 
    when "w"  then x -= 1 and y += 1
    when "nw" then            y += 1 and z -= 1 
    when "ne" then x += 1            and z -= 1 
    end
  end

  tile = [x, y, z].join(",")
  tiles[tile] = tiles[tile] == "B" ? "W" : "B"
end

puts "Solution: #{tiles.values.join.count("B")}"
