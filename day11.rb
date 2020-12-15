


def count_occupied(map)
	count = 0
	map.each do |i|
		i.each do |j|
			if j == "#"
				count += 1
			end
		end
	end
	return count
end


def get_neighbours(map, r, c, width, length)

	neighbours = []

	neighbours.push map[r - 1][c] unless r == 0 # N
  neighbours.push map[r - 1][c + 1] unless r == 0 or c == width - 1 # NE
  neighbours.push map[r][c + 1] unless c == width - 1 # E
  neighbours.push map[r + 1][c + 1] unless r == length - 1 or c == width - 1 # SE
  neighbours.push map[r + 1][c] unless r == length - 1 # S
  neighbours.push map[r + 1][c - 1] unless r == length - 1 or c == 0 # SW
  neighbours.push map[r][c - 1] unless c == 0 # W
  neighbours.push map[r - 1][c - 1] unless r == 0 or c == 0  # NW

  return neighbours
end

def scan_map(map)

	width = map[0].length
	length = map.length
	new_map = []

	length.times do
    new_map.push [nil] * width
  end

  current_occupied = 0
	last_occupied = nil

	until current_occupied == last_occupied
  	last_occupied = current_occupied
	
		for r in 0..(length - 1)
			for c in 0..(width - 1)
				neighbours = get_neighbours(map, r, c, width, length)

				if map[r][c] == "L" and neighbours.none? "#"
	        new_map[r][c] = "#"
	      elsif map[r][c] == "#" and neighbours.count("#") >= 4
	        new_map[r][c] = "L"
	      else
	        new_map[r][c] = map[r][c]
	      end
			end
		end

		map = new_map
		current_occupied = count_occupied(map)
	end

	return current_occupied
end

seat_map = []

File.foreach("temp.txt") do |line|
	line = line.split("")
	seat_map.append(line)
end

puts "#{scan_map(seat_map)}"

