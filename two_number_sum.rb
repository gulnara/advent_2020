def find_sum(nums, sum)
	visited = {}

	nums.each do |int|
		diff = sum - int.to_i
		if visited.has_key?(diff)
			return diff * int.to_i
		else
			visited[int.to_i] = true
		end
	end
end

nums = File.read("nums.txt").split
sum = 2020

puts find_sum(nums, sum)
# 381699
