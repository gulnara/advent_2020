

# pt1
def count_yes_pt1(data)
	
	count = 0

	data.each do |answers|
		question_hash = {}
		temp_count = 0
		answers.each_char do |i|
			if !question_hash.key?(i) and i != "\n"
				question_hash[i] = true
				temp_count += 1
			end
		end
		count += temp_count
	end

	return count
end

# pt2

def count_yes_pt2(data)
	
	count = 0

	data.each do |answers|
		question_hash = {}
		temp_count = 0
		group_size = 1
		answers = answers.split("").sort!

		answers.each do |i|
			if i == "\n"
				group_size += 1
			elsif !question_hash.key?(i)
				question_hash[i] = 1
				if question_hash[i] == group_size
					temp_count += 1
				end
			elsif question_hash.key?(i)
				question_hash[i] += 1
				if question_hash[i] == group_size
					temp_count += 1
				end
			end	
		end

		count += temp_count
	end

	return count
end


parsed_data = File.read("group_answers.txt").split(/\n{2,}/)

puts count_yes_pt1(parsed_data)
# 6565
puts count_yes_pt2(parsed_data)
# 3131

