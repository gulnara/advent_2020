

def acc_value(ops)

	acc = 0
	i = 0

	visited = []

	while !visited.include? i
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
	end

	return acc, i

end

def replace_jmp(ops)

	for o in 0..(ops.length - 1)
		if ops[o][0] == "jmp"
			new_ops = ops
			new_ops[o][0] = "nop"
			acc, i = acc_value(new_ops)
			if i == ops.length + 1
				return acc, i
			end
		end
	end
end


ops = []

File.foreach("temp.txt").each do |line|
	ops.append(line.split(" "))
end

# puts ops

# puts acc_value(ops)
# 1749

puts replace_jmp(ops)





