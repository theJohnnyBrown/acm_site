file = File.new("populate.txt", "r")
counter = 1
while (line = file.gets)
  member = line.split
  last_name = member[0]
  first_name = member[1]
  email = member[2]
  puts "member #{counter}"
  puts "    #{first_name} #{last_name}, #{email}"
  counter = counter + 1
end
file.close
