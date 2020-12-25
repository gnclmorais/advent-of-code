card_pk, door_pk = File.read("#{__dir__}/input.txt").strip.split("\n").map(&:to_i)

mod = 20201227
subject_number = 7

card_loop_size, door_loop_size = [card_pk, door_pk].map do |public_key|
  loop_size, value = 0, 1

  while value != public_key
    loop_size += 1
    value *= subject_number
    value %= mod
  end

  loop_size
end

encryption_keys = [
  [door_pk, card_loop_size],
  [card_pk, door_loop_size],
].map do |(subject_number, loop_size)|
  value = 1

  loop_size.times do
    value *= subject_number
    value %= mod
  end

  value
end

if encryption_keys.uniq.length > 1
  raise "Wrong values found: #{encryption_keys.join(" and ")}"
end

puts "Solution: #{encryption_keys.first}"
