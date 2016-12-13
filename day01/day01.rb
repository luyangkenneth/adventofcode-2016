input = File.read('input.txt')

array = input.split(', ')

# Part 1
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

puts "Part 1: #{hor.abs + ver.abs}"

# Part 2
hor = 0
ver = 0
dir = 0 # N0 E1 S2 W3

ans = nil
trail = [[0, 0]]

array.each do |a|
  if a[0] == 'L'
    dir = (dir - 1) % 4
  elsif a[0] == 'R'
    dir = (dir + 1) % 4
  end

  dist = a[1..a.length].to_i
  if dir == 0
    dist.times do
      ver += 1
      if trail.include? [hor, ver]
        ans ||= [hor, ver]
      else
        trail.push [hor, ver]
      end
    end
  elsif dir == 1
    dist.times do
      hor += 1
      if trail.include? [hor, ver]
        ans ||= [hor, ver]
      else
        trail.push [hor, ver]
      end
    end
  elsif dir == 2
    dist.times do
        ver -= 1
        if trail.include? [hor, ver]
          ans ||= [hor, ver]
        else
          trail.push [hor, ver]
        end
    end
  elsif dir == 3
    dist.times do
        hor -= 1
        if trail.include? [hor, ver]
          ans ||= [hor, ver]
        else
          trail.push [hor, ver]
        end
    end
  end
end

puts "Part 2: #{ans[0].abs + ans[1].abs}"
