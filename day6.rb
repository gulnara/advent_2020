


def count_yes(data)
	
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


parsed_data = File.read("group_answers.txt").split(/\n{2,}/)

puts count_yes(parsed_data)



