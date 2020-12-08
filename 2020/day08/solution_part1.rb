# Slurp the whole file since I need all instructions
instructions = File.read("#{__dir__}/input.txt").split("\n")

accumulator = 0
position = 0
has_seen = {}

while !has_seen[position] do
  has_seen[position] = true

  command, value = instructions[position].split(" ")
  value = value.to_i

  if command == "jmp"
    position += value
  else
    position += 1
    accumulator += value if command == "acc"
  end
end

puts "Solution: #{accumulator}"
