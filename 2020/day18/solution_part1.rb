total = 0

IO.foreach("#{__dir__}/input.txt") do |line|
  tally = []
  current_atom = nil
  current_operation = nil

  line.gsub(/ /, "").strip.each_char do |char|
    case char
    when "("
      tally.push([current_operation, current_atom])
      current_atom = nil
      current_operation = nil
    when ")"
      operation, atom = tally.pop
      current_atom = [current_atom, atom].reduce(operation) unless operation.nil?
    when "+"
      current_operation = :+
    when "*"
      current_operation = :*
    else
      number = char.to_i
      current_atom = if current_operation.nil?
        number
      else
        [current_atom, number].reduce(current_operation)
      end
      current_operation = nil
    end
  end

  total += current_atom
end

puts "Solution: #{total}"
