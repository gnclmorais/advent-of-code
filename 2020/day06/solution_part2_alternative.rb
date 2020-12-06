# Slurp the whole file to do this in a one-liner
File.read("#{__dir__}/input.txt")
  # Turn empty lines into something distinct so we break the string into array
  .gsub(/\n{2}/, "%")
  .split("%")
  # Apply the following to each group
  .map do |group|
    # Split group strings by line break and found answers everyone said "yes" to
    group.split("\n").reduce("a".."z") { |acc, arr| acc.to_a & arr.split("") }.length
  end
  # Count the number of "yes" responses
  .sum
  # Display result
  .tap { |result| puts "Solution: #{result}"}
