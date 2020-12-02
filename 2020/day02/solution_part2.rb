# While it appears you validated the passwords correctly, they don't seem to be
# what the Official Toboggan Corporate Authentication System is expecting.
# 
# The shopkeeper suddenly realizes that he just accidentally explained the
# password policy rules from his old job at the sled rental place down the
# street! The Official Toboggan Corporate Policy actually works a little
# differently.

# Each policy actually describes two positions in the password, where 1 means
# the first character, 2 means the second character, and so on. (Be careful;
# Toboggan Corporate Policies have no concept of "index zero"!) Exactly one of
# these positions must contain the given letter. Other occurrences of the letter
# are irrelevant for the purposes of policy enforcement.
# 
# Given the same example list from above:
#   1-3 a: abcde is valid: position 1 contains a and position 3 does not.
#   1-3 b: cdefg is invalid: neither position 1 nor position 3 contains b.
#   2-9 c: ccccccccc is invalid: both position 2 and position 9 contain c.
# 
# How many passwords are valid according to the new interpretation of the policies?

nr_valid_passwords = 0

IO.foreach("#{__dir__}/input.txt") do |password_line|
  # 1-3 h: cdefgsdf
  # aaa bb password
  a, b, password = password_line.split(" ")

  # Clean up our variables for processing
  position_a, position_b = a.split("-").map { |pos| pos.to_i - 1 }
  letter = b.chomp(":")

  # Use a XOR: it only accepts true+false or false+true
  next unless (password[position_a] == letter) ^ (password[position_b] == letter)
  nr_valid_passwords += 1
end

puts "Solution: #{nr_valid_passwords}"
