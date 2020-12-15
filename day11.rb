
def scan_map(seat_map)
	a = 0
	k = 0

	while k <= (seat_map.length - 1)
		l = k + 1
		while a <= (seat_map[0].length - 1)
			b = a + 1
			if seat_map[k][a] == "L" and (seat_map[l][a] == "L" or seat_map[l][a] == "." ) and (seat_map[l][b] == "L" or seat_map[l][b] == ".")
				seat_map[k][a] = "#"
				a += 1
			end
		end
	end
	return seat_map
end

seat_map = []

File.foreach("temp.txt") do |line|
	line = line.split("")
	seat_map.append(line)
end

puts scan_map(seat_map)