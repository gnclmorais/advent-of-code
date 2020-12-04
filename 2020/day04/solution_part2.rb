require_relative "solution_part2_helpers"

input_file = "#{__dir__}/input.txt"

fields = [
  "byr", # Birth Year
  "iyr", # Issue Year
  "eyr", # Expiration Year
  "hgt", # Height
  "hcl", # Hair Color
  "ecl", # Eye Color
  "pid", # Passport ID
  "cid", # Country ID
]
current_line = []
number_valid_passports = 0

IO.foreach(input_file).with_index do |line, line_index|
  # Store this line and move to the next one until we get an emply line
  current_line += line.strip.split and next if line.length > 1

  # Get the type of credentials in the passport
  key_values = current_line.map { |key_value| key_value.split(":") }

  # Reset line accumulator and check if all fields are valid before proceeding
  current_line = []
  next unless check_validity(key_values)

  # Grab just the types of fields and check which ones might be missing
  credentials = key_values.map(&:first)
  missing_credentials = fields - credentials

  if missing_credentials.empty? || missing_credentials == ["cid"]
    number_valid_passports += 1
  end
end

puts "Solution: #{number_valid_passports}"
