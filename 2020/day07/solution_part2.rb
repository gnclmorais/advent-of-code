bags_index = File
  # Slurp the whole file to create an index
  .read("#{__dir__}/input.txt")
  # Make singular/plural uniform (no more "bags", just "bag")
  .gsub(/bags/, "bag")
  .split("\n")
  .map { |line| line.split(" contain ") }
  # Split on the " contains " part and remove the full stop
  .map { |bag, content| [bag, content[0..-2].split(", ")] }
  .to_h

# Starting values
values_to_look_for = ["shiny gold bag"]
number_of_bags = 0

begin
  # Get the first type of bag to look for
  bag_to_look_for = values_to_look_for.shift

  # Get the bag breakdown for the ones we're looking at
  bags_index.fetch(bag_to_look_for, []).each do |bag|
    # Skip to the next one if it contains no other bag
    next if bag == "no other bag"

    # Separate the number of bags from its bag type and count it
    number, _, bag_type = bag.partition(" ")
    number_of_bags += number.to_i

    # Add that many types of bag to be processed
    number.to_i.times do
      values_to_look_for.push(bag_type)
    end
  end
end while values_to_look_for.any?

puts "Solution: #{number_of_bags}"
