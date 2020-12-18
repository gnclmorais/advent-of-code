total = File.read("#{__dir__}/input.txt").split("\n").reduce(0) do |memo, line|
  # Remove spaces 'cause we don't really need them
  line = line.gsub(/ /, "")

  # Scan the whole line until we can move to the next one
  loop do
    # Handle simplifications just in case, like "6+(11)" --> "6+11"
    simplification = line.match /\(\d+\)/
    line.sub!(simplification.regexp, eval(simplification.to_s).to_s) and next unless simplification.nil?

    # Handle simple sums, like "6+11" --> "17"
    sum = line.match /\d+\+\d+/
    line.sub!(sum.regexp, eval(sum.to_s).to_s) and next unless sum.nil?

    # Find operations to evaluate, like "(4+5)" or "(6*9)"
    # Break out of the loop
    operation = line.match(/\(\d+(\+\d+)+\)/) || line.match(/\(\d+(\*\d+)+\)/)
    break if operation.nil?

    # Identify any parenthesis, remove them to evaluate the expression
    parenthesis = operation.to_s.chars - operation.to_s.gsub(/[\(|\)]/, "").chars
    clean_operation = parenthesis.empty? ? operation : (operation.to_s.chars - parenthesis).join
    evaluated_operation = eval(clean_operation)

    # Put the parenthesis back in the correct order
    final_operation =
      if    parenthesis == ["("] then "(#{evaluated_operation}"
      elsif parenthesis == [")"] then "#{evaluated_operation})"
      else  evaluated_operation.to_s
      end

    # Place the new expression back into the line
    line.sub!(operation.regexp, final_operation)
  end

  memo += eval(line)
end

puts "Solution: #{total}"
