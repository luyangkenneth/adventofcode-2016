# Part 1

char_array = []

File.foreach('input.txt') do |line|
  line.strip.each_char.with_index do |char, index|
    char_array[index] ||= Hash.new(0)
    char_array[index][char] += 1
  end
end

part_one = char_array.map do |hash|
  hash.sort_by { |char, freq| -freq }.first[0]
end

puts "Part 1: #{part_one.join}"

# Part 2

part_two = char_array.map do |hash|
  hash.sort_by { |char, freq| freq }.first[0]
end

puts "Part 1: #{part_two.join}"
