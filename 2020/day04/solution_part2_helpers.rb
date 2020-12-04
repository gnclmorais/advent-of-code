# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Help methods

def check_validity(credentials)
  credentials.all? { |(key, value)| send(key, value) }
end

# Birth Year
def byr(value)
  value >= "1920" && value <= "2002"
end

# Issue Year
def iyr(value)
  value >= "2010" && value <= "2020"
end

# Expiration Year
def eyr(value)
  value >= "2020" && value <= "2030"
end

# Height
def hgt(value)
  numbers, unit = value.partition(/(cm|in)/)
  if unit == "cm"
    numbers >= "150" && numbers <= "193"
  else 
    numbers >= "59" && numbers <= "76"
  end
end

# Hair Color
def hcl(value)
  value.match /\A#(?:\h{3}){1,2}\z/
end

# Eye Color
def ecl(value)
  %w(amb blu brn gry grn hzl oth).include? value
end

# Passport ID
def pid(value)
  value.match /^\d{9}$/
end

# Country ID (its validity doesnt matter)
def cid(value)
  true
end
