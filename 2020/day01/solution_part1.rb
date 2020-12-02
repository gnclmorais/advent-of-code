# (…) the Elves in accounting just need you to fix your expense report
# (your puzzle input); apparently, something isn't quite adding up.
# Specifically, they need you to find the two entries that sum to 2020
# and then multiply those two numbers together.

expenses = File.read("#{__dir__}/input.txt").split

expenses.each_with_index do |expense, i|
  for j in i+1..expenses.length do
    expense_a = expense.to_i
    expense_b = expenses[j].to_i

    if expense_a + expense_b == 2020
      puts "Solution: #{expense_a * expense_b}"
      return
    end
  end
end
