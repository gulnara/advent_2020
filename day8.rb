

def acc_value(ops)

	acc = 0
	i = 0

	visited = []

	while !visited.include? i
		o = ops[i][0]
		# inc = ops[i][1].slice(1..).to_i
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

	return acc

end


ops = []

File.foreach("operations.txt").each do |line|
	ops.append(line.split(" "))
end

# puts ops

puts acc_value(ops)
# 1749



