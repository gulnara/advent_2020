

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

	new_map = []

	
	for j in 0..(map.length - 1)
		for i in 0..(width - 1)
			if seat_stack.length < 3
				seat_stack.append(map[j])
				new_map.append(map[j])
			else
				if can_occupy?(seat_stack[0], seat_stack[1], seat_stack[2], i)
					seat_stack[1][i] = "#"
					new_map[j+1][i] = "#"
				elsif should_vacate?(seat_stack[0], seat_stack[1], seat_stack[2], i)
					seat_stack[1][i] = "L"
					new_map[j+1][i] = "L"
				end
				seat_stack.shift
			end
		end
		j += 1
	end

	return new_map
end

seat_map = []

File.foreach("temp.txt") do |line|
	line = line.split("")
	seat_map.append(line)
end

puts "#{scan_map(seat_map)}"

