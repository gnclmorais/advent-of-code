mask_and = "" # keep 0s
mask_or  = "" # keep 1s
memory   = []

# Read instructions line by line
IO.foreach("#{__dir__}/input.txt") do |line|
  instruction, value = line.split(" = ")

  if instruction == "mask"
    mask_and = value.gsub(/X/, "1").to_i(2)
    mask_or  = value.gsub(/X/, "0").to_i(2)
  else
    value = value.to_i
    # "mem[13358]" -> ["mem[", "13358", "]"] -> 13358
    memory_address = instruction.partition(/\d+/)[1].to_i

    memory[memory_address] = (value & mask_and) | mask_or
  end
end

puts "Solution: #{memory.compact.reduce(:+)}"
