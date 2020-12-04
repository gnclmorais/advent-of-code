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
  credentials = current_line.map { |key_value| key_value.split(":").first }

  missing_credentials = fields - credentials
  if missing_credentials.empty? || missing_credentials == ["cid"]
    number_valid_passports += 1
  end

  current_line = []
end

puts "Solution: #{number_valid_passports}"
