def count_trees(map)
	count = 0
	tree = "#"
	width = map[0].length

	current_counter = 0

	for i in 0..(map.length - 2)

		if width - current_counter <= 3
			current_counter =  3 - (width - current_counter)
		else
			current_counter += 3
		end

		item = map[i+1][current_counter]
		if item == tree
			count += 1
		end
	end
	return count
end

map = File.read("trees.txt").split

puts count_trees(map)
# 289
