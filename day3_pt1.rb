
def count_trees(map)
	count = 0
	tree = "#"
	width = map[0].length

	current_counter = 0

	for i in 0..(map.length - 3)

		if width - current_counter <= 1
			current_counter =  1 - (width - current_counter)
		else
			current_counter += 1
		end

		item = map[i+2][current_counter]

		if item == tree
			count += 1
		end
	end
	return count
end

map = File.read("trees.txt").split

puts count_trees(map)
# 289

# Right 1, down 1.
# Right 3, down 1. (This is the slope you already checked.)
# Right 5, down 1.
# Right 7, down 1.
# Right 1, down 2.