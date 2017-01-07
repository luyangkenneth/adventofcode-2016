require 'digest'

door_id = 'ojvtpuvg'
md5 = Digest::MD5

# Part 1

password = ''
index = 0

until password.length == 8
  hash = md5.hexdigest(door_id + index.to_s)
  password << hash[5] if hash[0, 5] == '00000'
  index += 1
end

puts "Part 1: #{password}"

# Part 2

password = Array.new(8, nil)
index = 0

while password.include?(nil)
  hash = md5.hexdigest(door_id + index.to_s)

  if hash[0, 5] == '00000' && ('0'..'7').include?(hash[5])
    password[hash[5].to_i] ||= hash[6]
  end

  index += 1
end

puts "Part 2: #{password.join}"
