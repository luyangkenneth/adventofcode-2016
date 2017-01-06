# Part 1

count = 0

File.foreach('input.txt') do |line|
  numbers = line.split(' ').map(&:to_i)
  max = numbers.delete_at(numbers.index(numbers.max))
  count += 1 if numbers[0] + numbers[1] > max
end

puts "Part 1: #{count}"

# Part 2

count = 0
triangles = []

File.foreach('input.txt').with_index(0) do |line, line_num|
  triangles[first = line_num - line_num % 3] ||= []
  triangles[second = first + 1] ||= []
  triangles[third = first + 2] ||= []

  numbers = line.split(' ').map(&:to_i)
  triangles[first].push(numbers[0])
  triangles[second].push(numbers[1])
  triangles[third].push(numbers[2])
end

triangles.each do |numbers|
  max = numbers.delete_at(numbers.index(numbers.max))
  count += 1 if numbers[0] + numbers[1] > max
end

puts "Part 2: #{count}"
