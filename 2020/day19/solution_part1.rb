require_relative "solution_part1_helpers"

rules, messages =
  File.read("#{__dir__}/input.txt").split("\n\n").map { |chunk| chunk.split("\n") }

sorted_rules = rules.map do |rule|
  rule_key, rule_val = rule.split(": ")
  [rule_key.rjust(3, " "), ": ", rule_val.gsub(/"/, "")].join
end.sort

indexed_rules = sorted_rules.map do |rule|
  key, val = rule.split(": ")
  [key.strip, val]
end.to_h

current_rule = sorted_rules.first.split(": ")[1]
the_rule = Regexp.new("^#{translate(indexed_rules, current_rule)}$")
matched_messages = messages.filter { |message| message.strip.match(the_rule) }

puts "Solution: #{matched_messages.length}"
