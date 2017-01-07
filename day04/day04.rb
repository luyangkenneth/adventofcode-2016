# Part 1

sum = 0

File.foreach('input.txt') do |line|
  a = line.split('-')
  last = a.pop
  letters = a.join
  id = last[0, 3].to_i
  expected_checksum = last[4, 5]

  hash = Hash.new(0)
  letters.each_char do |c|
    hash[c] += 1
  end

  checksum = ''
  hash.sort_by { |char, freq| [-freq, char] }.each do |char, freq|
    checksum << char
    break if checksum.length == 5
  end

  sum += id if checksum == expected_checksum
end

puts "Part 1: #{sum}"

# Part 2

print 'Part 2: '

File.foreach('input.txt') do |line|
  string = line[0..-13]
  id = line[-11, 3].to_i
  shift = id % 26

  string = string.each_char.map do |c|
    c == '-' ? ' ' : (c.ord + shift <= 'z'.ord ? c.ord + shift : c.ord + shift - 26).chr
  end.join

  puts "#{id} #{string}" if string.include?('north')
end
