

def find_pair(pream, num)

	visited = {}

	pream.each do |i|
		diff = num - i
		if visited.key?(i)
			return true
		else
			visited[diff] = true
		end
	end

	return false

end


def first_odd(nums, pream_length)

	pream = []
	map = {}

	nums.each do |num|

		if pream.length < pream_length
			pream.append(num)
		else
			if find_pair(pream, num)

				pream.shift
				pream.append(num)
			else
				return num
			end
		end

	end

end

def calc_min_max()

end

def find_set(nums, odd_num)

	set = []
	temp_sum = 0

	nums.each do |i|
		puts "i #{i}"
		temp_sum += i
		puts "temp sum #{temp_sum}"
		

		if temp_sum < odd_num
			set.append(i)
			puts "set #{set}"
		elsif temp_sum > odd_num
			# puts i
			while temp_sum > odd_num
				temp_sum = temp_sum - set[0]
				puts "this t #{temp_sum}"
				set.shift
			end
			set.append(i)
			if temp_sum == odd_num
				min = set.min
				max = set.max
				return min + max
			end
			puts "set #{set}"
		elsif temp_sum == odd_num
			min = set.min
			max = set.max
			return min + max
		end

	end


end


nums = []
pream_length = 25

File.foreach("day_9_input.txt").each do |line|
	nums.append(line.to_i)
end

# puts first_odd(nums, pream_length)
# 41682220


odd_num = 41682220

puts find_set(nums, odd_num)


