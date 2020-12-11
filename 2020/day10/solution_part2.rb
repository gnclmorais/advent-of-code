# Slurp the whole file, transform it into a number array and sort it
numbers = File.read("#{__dir__}/sample.txt").split("\n").map(&:to_i).sort
# Prepend a 0 to account for the initial difference between 0 and the first adapter
# numbers.prepend 0

# def crawl(nmrs)
#   first, one, two, three, *rest = nmrs

#   puts rest
#   return 1 if rest.empty?

#   crawl([two, three, *rest]) + crawl([three, *rest]) + crawl(rest)
# end

# solution = crawl(numbers)

def combinations(nums)
  start, one, two, three, *rest = nums

  return 1 if two.nil?
  return combinations([one, two]) if three.nil?
  return combinations([one, two, three]) + combinations([two, three]) if rest.empty?
  
  combinations([one, two, three, *rest]) + combinations([two, three, *rest]) + combinations([three, *rest])
end

solution = combinations(numbers)

puts "Solution: #{solution}"
