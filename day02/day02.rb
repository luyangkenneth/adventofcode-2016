# Part 1

code = ''
num = 5

File.foreach('input.txt') do |line|
  line.each_char do |c|
    case c
    when 'U'
      num -= 3 unless [1, 2, 3].include?(num)
    when 'D'
      num += 3 unless [7, 8, 9].include?(num)
    when 'L'
      num -= 1 unless [1, 4, 7].include?(num)
    when 'R'
      num += 1 unless [3, 6, 9].include?(num)
    end
  end

  code += num.to_s
end

puts "Part 1: #{code}"

# Part 2

keypad = [
  [nil, nil, '1', nil, nil],
  [nil, '2', '3', '4', nil],
  ['5', '6', '7', '8', '9'],
  [nil, 'A', 'B', 'C', nil],
  [nil, nil, 'D', nil, nil]
]

code = ''
row = 2
col = 0

File.foreach('input.txt') do |line|
  line.each_char do |c|
    case c
    when 'U'
      row -= 1 unless row == 0 || keypad[row-1][col].nil?
    when 'D'
      row += 1 unless row == 4 || keypad[row+1][col].nil?
    when 'L'
      col -= 1 unless col == 0 || keypad[row][col-1].nil?
    when 'R'
      col += 1 unless col == 4 || keypad[row][col+1].nil?
    end
  end

  code += keypad[row][col]
end

puts "Part 2: #{code}"
