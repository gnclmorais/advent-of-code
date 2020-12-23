cups = File.read("#{__dir__}/input.txt").strip.split("").map(&:to_i)

100.times do
  current, one, two, three, *rest = cups
  new_cups = [*rest, current]

  cup_to_find = current
  loop do
    cup_to_find -= 1
    cup_to_find = cups.max if cup_to_find < 0

    idx = new_cups.index(cup_to_find)
    new_cups.insert(idx + 1, one, two, three) and break if idx
  end

  cups = new_cups
end

# [2, 1, 3] -> "213" -> ["2", "3"] -> ["3", "2"] -> "32"
solution = cups.join.split("1").reverse.join

puts "Solution: #{solution}"
