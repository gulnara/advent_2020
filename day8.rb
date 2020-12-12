

def acc_value(ops)
	acc = 0
	i = 0

	visited = []

	while !visited.include? i
		if i != ops.length
			o = ops[i][0]
			inc = ops[i][1].to_i
			visited.append(i)
			if o == "nop"
				i += 1
			elsif o == "acc"
				acc += inc
				i += 1
			elsif o == "jmp"
				i += inc
			else
				puts "something wrong"
			end
		else
			return acc, i
		end
	end

	return acc, i

end

def replace_jmp(ops)

	map = {}

	for o in 0..(ops.length - 1)
		if ops[o][0] == "jmp"
			new_ops = ops
			new_ops[o][0] = "nop"
			acc, i = acc_value(new_ops)
			map[i] = acc
			new_ops[o][0] = "jmp"
		end
	end
	return map
end

def replace_nop(ops)

	map = {}

	for o in 0..(ops.length - 1)
		# puts ops[o]
		if ops[o][0] == "nop"
			new_ops = ops
			new_ops[o][0] = "jmp"
			acc, i = acc_value(new_ops)
			map[i] = acc
			new_ops[o][0] = "nop"
		end
	end
	return map
end

def find_right_rep(map1, map2, l)
	if map1.key?(l)
		return map1[l]
	else
		return map2[l]
	end
end


ops = []

File.foreach("operations.txt").each do |line|
	ops.append(line.split(" "))
end



# puts acc_value(ops)
# 1749

map1 = replace_jmp(ops)
map2 =  replace_nop(ops)

puts find_right_rep(map1, map2, ops.length)
# 515




