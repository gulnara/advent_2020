


seat_map = []

File.foreach("temp.txt") do |line|
	line = line.split("")
	seat_map.append(line)
end

puts seat_map