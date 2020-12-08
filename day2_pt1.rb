

# 9-10 m: mmmmnxmmmwm
# ["9-10", "m:", "mmmmnxmmmwm"]

def valid_passwords(parsed_data)

	valid = 0

	parsed_data.each do |data|
		if validate_passwords(data)
			valid += 1
		end
	end
	return valid
end


def validate_passwords(password_data)

	rule = password_data[0].split("-").map {|e| e.to_i}
	letter = password_data[1].chomp(':')
	string = password_data[2]

	current_count = 0
	string.each_char do |char|
		if char == letter
			current_count += 1
		end
	end

	if current_count >= rule[0] and current_count <= rule[1]
		return true
	end
end




parsed_data = []
File.foreach("passwords.txt") { |line| parsed_data.append(line.split(" ")) }

puts valid_passwords(parsed_data)
# 469