# Slurp the whole file, transform it into a number array and sort it
numbers = File.read("#{__dir__}/input.txt").split("\n").map(&:to_i).sort

jolt1 = 0
jolt3 = 1 # Built-in adapter is 3 higher than the highest adapter

# Prepend a 0 to account for the initial difference between 0 and the first adapter
numbers.prepend 0

for i in 0..(numbers.length - 2) do
  case numbers[i + 1, 3].map { |number| number - numbers[i] }.min
  when 1 then jolt1 += 1
  when 3 then jolt3 += 1
  end
end

puts "Solution: #{jolt1 * jolt3}"
