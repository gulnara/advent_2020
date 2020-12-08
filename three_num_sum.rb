def find_sum(nums, sum)

	nums.sort!

	for i in 0..(nums.length - 1)
		left = i + 1
		right = nums.length - 1

		while left < right
			current_sum = nums[i] + nums[left] + nums[right]
			if current_sum == sum
				return nums[i] * nums[left] * nums[right]
			elsif current_sum < sum
				left += 1
			elsif current_sum > sum
				right -= 1
			else
				return "no triplets add up to 2020"
			end
		end
	end
end

nums = []
File.foreach("nums.txt") { |line| nums.append(line.to_i) }
sum = 2020

puts find_sum(nums, sum)