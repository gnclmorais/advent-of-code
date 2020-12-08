# Slurp the whole file since I need all instructions
instructions = File.read("#{__dir__}/input.txt").split("\n")
nr_instructions = instructions.length

position_being_analised = 0
flip_done = false
accumulator = 0

loop do
  # Setup the loop iteration
  position = 0
  has_seen = {}

  while position < nr_instructions && !has_seen[position] do
    # Record this command/position as ran
    has_seen[position] = true

    command, value = instructions[position].split(" ")
    value = value.to_i

    # Flip this command if we're trying this particular position
    if position == position_being_analised && !flip_done && command != "acc"
      command = command == "jmp" ? "nop" : "jmp"
    end

    if command == "jmp"
      position += value
    else
      position += 1
      accumulator += value if command == "acc"
    end
  end

  # Success criteria: break the loop if we ran the last command
  break if position == nr_instructions

  # Prepare for the next loop iteration
  position_being_analised += 1
  flip_done = false
  accumulator = 0
end

puts "Solution: #{accumulator}"
