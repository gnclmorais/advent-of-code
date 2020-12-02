# The Elves in accounting are thankful for your help; one of them even offers
# you a starfish coin they had left over from a past vacation. They offer you
# a second one if you can find three numbers in your expense report that meet
# the same criteria.
# Using the above example again, the three entries that sum to 2020 are 979,
# 366, and 675. Multiplying them together produces the answer, 241861950.
# In your expense report, what is the product of the three entries that sum to 2020?

expenses = File.read("#{__dir__}/input.txt").split

expenses.each_with_index do |expense, i|
  for j in i+1..expenses.length do
    for k in j+1..expenses.length do
        expense_a = expense.to_i
        expense_b = expenses[j].to_i
        expense_c = expenses[k].to_i

        if expense_a + expense_b + expense_c == 2020
          puts "Solution: #{expense_a * expense_b * expense_c}"
          return
        end
    end
  end
end
