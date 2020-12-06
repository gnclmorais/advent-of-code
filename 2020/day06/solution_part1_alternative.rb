# Slurp the whole file to do this in a one-liner
File.read("#{__dir__}/input.txt")
  # Turn empty lines into something distinct for now
  .gsub(/\n{2}/, "%")
  # Remove line breaks between same group people so they become single lines
  .gsub(/\n/, "")
  # Turn the distinct character into line breaks to have one group per line
  .split("%")
  # Get the unique characters per line/group, representing "yes"
  .map { |line| line.chars.uniq.length }
  # Count the number of "yes" responses
  .sum
  # Display result
  .tap { |result| puts "Solution: #{result}"}
