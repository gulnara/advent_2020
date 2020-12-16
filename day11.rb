
$map = []

File.foreach("temp.txt") do |line|
	line = line.split("")
	if line[-1] == "\n"
		line = line[0..-2]
	end
	$map.append(line)
end

$width = $map[0].length
$length = $map.length

def count_occupied
	count = 0
	$map.each do |i|
		i.each do |j|
			puts j
			if j == "#"
				count += 1
			end
		end
	end
	return count
end


def get_neighbours(c, r)

	neighbours = []

	neighbours.push $map[r - 1][c] unless r == 0 # N
  neighbours.push $map[r - 1][c + 1] unless r == 0 or c == $width - 1 # NE
  neighbours.push $map[r][c + 1] unless c == $width - 1 # E
  neighbours.push $map[r + 1][c + 1] unless r == $length - 1 or c == $width - 1 # SE
  neighbours.push $map[r + 1][c] unless r == $length - 1 # S
  neighbours.push $map[r + 1][c - 1] unless r == $length - 1 or c == 0 # SW
  neighbours.push $map[r][c - 1] unless c == 0 # W
  neighbours.push $map[r - 1][c - 1] unless r == 0 or c == 0  # NW

  return neighbours
end


current_occupied = 0
last_occupied = nil

until current_occupied == last_occupied
	last_occupied = current_occupied
	new_map = []

	$length.times do
  	new_map.push [nil] * $width
	end

	(0...$length).each do |r|
  	(0...$width).each do |c|
			neighbours = get_neighbours(c, r)

			if $map[r][c] == "L" and neighbours.none? "#"
        new_map[r][c] = "#"
      elsif $map[r][c] == "#" and neighbours.count("#") >= 4
        new_map[r][c] = "L"
      else
        new_map[r][c] = $map[r][c]
      end
		end
	end

	$map = new_map
	current_occupied = count_occupied
	puts current_occupied
end


