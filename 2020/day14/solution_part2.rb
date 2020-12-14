mask     = "" # keep the full mask
mask_or  = "" # keep the "smallest" mask
mask_and = "" # for X into 0 for smallest number
memory   = {}

mask_length = mask.length
x_positions = []
x_positions_nr = x_positions.length

# Read instructions line by line
IO.foreach("#{__dir__}/input.txt") do |line|
  instruction, value = line.strip.split(" = ")

  if instruction == "mask"
    mask = value
    mask_or = mask.gsub(/X/, "1").to_i(2)

    mask_length = mask.length
    x_positions = mask.chars.each_with_index.reduce([]) do |memo, (char, idx)|
      char == "X" ? memo.push(idx) : memo
    end
    x_positions_nr = x_positions.length
  else
    # "mem[13358]" -> ["mem[", "13358", "]"] -> 13358
    address = instruction.partition(/\d+/)[1].to_i
    value = value.to_i

    # Get the highest possible address and set that straight off the bat
    highest_address = address | mask_or
    memory[highest_address] = value
    
    #  Minus 2 (instead of -1) because of the highest address already set
    for i in 0..(2 ** x_positions_nr - 2) do
      # Ensure address being calculated has the same size as mask so the indexes
      # of the Xs point to the same places
      next_address = highest_address.to_s(2).rjust(mask_length, "0")

      # Translate the loop number into bits that then will be picked one by one
      # to fill in the Xs of the mask into the `next_address`
      bits_to_use = i.to_s(2).rjust(x_positions_nr, "0")

      # Finally, on the same place as all the Xs, insert the bits from `i`
      x_positions.each_with_index { |x_idx, j| next_address[x_idx] = bits_to_use[j] }

      memory[next_address.to_i(2)] = value
    end
  end
end

puts "Solution: #{memory.values.reduce(:+)}"
