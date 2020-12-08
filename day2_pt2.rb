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

	
	if string[rule[0] - 1] == letter and string[rule[1] - 1] == letter
		return false
	elsif string[rule[0] - 1] == letter
		return true
	elsif string[rule[1] - 1] == letter
		return true
	end

end




parsed_data = []
File.foreach("passwords.txt") { |line| parsed_data.append(line.split(" ")) }

puts valid_passwords(parsed_data)
# 267