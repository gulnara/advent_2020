

def can_occupy?(r1, r2, r3, i)
	mini_map = [r1[0][i - 1], r1[1][i], r1[2][i + 1], r2[0][i - 1], r2[2][i + 1], r3[0][i - 1], r3[1][i], r3[2][i + 1]]

	if mini_map.include? "#"
		return false
	elsif r2[1][i] == "."
		return false
	else
		return true
	end
end

def should_vacate?(r1, r2, r3, i)
	mini_map = [r1[0][i - 1], r1[1][i], r1[2][i + 1], r2[0][i - 1], r2[2][i + 1], r3[0][i - 1], r3[1][i], r3[2][i + 1]]
	ocupied_seats = 0
	mini_map.each do |s|
		if s == "#"
			ocupied_seats += 1
		end
	end

	if r2[1][i] == "#" and ocupied_seats >= 4
		return true
	else
		return false
	end
end

def scan_map(map)
	# a = 1
	# k = 1
	seat_stack = []
	width = map[0].length

	
	for i in 0..(map.length - 1)
		j = i + 1



	end


	while k <= (seat_map.length - 1)
		while a <= (seat_map[0].length - 1)
			if seat_map[k][a] == "L" and (seat_map[l][a] == "L" or seat_map[l][a] == "." ) and (seat_map[l][b] == "L" or seat_map[l][b] == ".")
				seat_map[k][a] = "#"
				a += 1
			elsif seat_map[k][a] == "."
			end
		end
		k += 1
	end
	return seat_map
end

seat_map = []

File.foreach("temp.txt") do |line|
	line = line.split("")
	seat_map.append(line)
end

puts scan_map(seat_map)