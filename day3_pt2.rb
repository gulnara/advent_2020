
def count_trees(map, right, down)
	count = 0
	tree = "#"
	width = map[0].length

	current_counter = 0

	for i in 0..(map.length - (down + 1))

		if width - current_counter <= right
			current_counter =  right - (width - current_counter)
		else
			current_counter += right
		end

		item = map[i+down][current_counter]

		if item == tree
			count += 1
		end
	end
	return count
end

def skip_row_trees(map, right, down)
	i, count = 0, 0
	tree = "#"
	width = map[0].length

	current_counter = 0

	while i < (map.length - (down + 1))

		if width - current_counter <= right
			current_counter =  right - (width - current_counter)
		else
			current_counter += right
		end

		item = map[i+down][current_counter]
		i += 2
		if item == tree
			count += 1
		end
	end
	return count
end

def product_of_slopes(map)

	a = count_trees(map, 1, 1)
	b = count_trees(map, 3, 1)
	c = count_trees(map, 5, 1)
	d = count_trees(map, 7, 1)
	e = skip_row_trees(map, 1, 2)

	return a * b * c * d * e

end

map = File.read("trees.txt").split

# map = [
# "..##.......",
# "#...#...#..",
# ".#....#..#.",
# "..#.#...#.#",
# ".#...##..#.",
# "..#.##.....",
# ".#.#.#....#",
# ".#........#",
# "#.##...#...",
# "#...##....#",
# ".#..#...#.#"]

puts product_of_slopes(map)
# 5522401584

