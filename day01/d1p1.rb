input = File.read('input01.txt')

array = input.split(', ')
hor = 0
ver = 0
dir = 0 # N0 E1 S2 W3

array.each do |a|
  if a[0] == 'L'
    dir = (dir - 1) % 4
  elsif a[0] == 'R'
    dir = (dir + 1) % 4
  end

  dist = a[1..a.length].to_i
  if dir == 0
    ver += dist
  elsif dir == 1
    hor += dist
  elsif dir == 2
    ver -= dist
  elsif dir == 3
    hor -= dist
  end
end

puts hor.abs + ver.abs
