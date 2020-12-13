


nums = []

File.foreach("temp.txt").each do |line|
	nums.append(line.to_i)
end

puts nums
