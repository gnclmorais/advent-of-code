# Slurp the whole file to create an index
bags_index = File
  .read("#{__dir__}/input.txt")
  .split("\n")
  .map { |line| line.split(" contain ") }
  .map { |bag, content| [bag, content[0..-2].split(", ")] }
  .to_h

# Starting values
values_to_look_for = ["shiny gold"]
number_of_bags = 0

begin
  bag_to_look_for = values_to_look_for.shift

  bags_index.each do |bag, contents|
    bags_found = contents.find do |content|
      content.include? bag_to_look_for
    end

    if bags_found
      number_of_bags += 1
      bags_index.delete(bag)
      values_to_look_for.push(bag.gsub(/s$/, ''))
    end
  end
end while values_to_look_for.any?

puts "Solution: #{number_of_bags}"
