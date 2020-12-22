# Get the whole file and split it into two nicely clean decks
player_1, player_2 = File.read("#{__dir__}/input.txt").split("\n\n").map do |deck|
  deck.split("\n").tap { |d| d.shift }.map(&:to_i)
end

loop do
  card_1 = player_1.shift
  card_2 = player_2.shift

  # Don't take ties into consideration
  if card_1 > card_2
    player_1.push(card_1, card_2)
  else
    player_2.push(card_2, card_1)
  end

  break if player_1.empty? || player_2.empty?
end

solution = player_1.concat(player_2).reverse.each_with_index.reduce(0) do |memo, (card, idx)|
  memo + card * (idx + 1)
end

puts "Solution: #{solution}"
