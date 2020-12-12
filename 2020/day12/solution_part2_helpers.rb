def rotate(x, y, degrees)
  (degrees / 90).times { x, y = [y, -x] } and [x, y]
end
