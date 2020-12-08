def count_trees(map, right, down)
	i, count = 0, 0
	tree = "#"
	width = map[0].length

	current_counter = 0

	while i <= (map.length - (down + 1))

		if width - current_counter <= right
			current_counter =  right - (width - current_counter)
		else
			current_counter += right
		end

		item = map[i+down][current_counter]
		i += down
		if item == tree
			count += 1
		end
	end
	return count
end

def product_of_slopes(map)

	a = count_trees(map, 1, 1)
	puts a
	b = count_trees(map, 3, 1)
	puts b
	c = count_trees(map, 5, 1)
	puts c
	d = count_trees(map, 7, 1)
	puts d
	e = count_trees(map, 1, 2)
	puts e

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

