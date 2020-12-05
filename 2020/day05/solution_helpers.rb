def row_number(row_input)
  row_input.split("").reduce(0..127) do |range, char|
    new_limit = range.min + (range.max - range.min) / 2
    new_range = char == "F" ? range.min..new_limit : new_limit+1..range.max

    return new_range.begin if new_range.size == 1

    new_range
  end
end

def col_number(column_input)
  column_input.split("").reduce(0..7) do |range, char|
    new_limit = range.min + (range.max - range.min) / 2
    new_range = char == "L" ? range.min..new_limit : new_limit+1..range.max

    return new_range.begin if new_range.size == 1

    new_range
  end
end 
