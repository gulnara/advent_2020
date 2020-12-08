require 'set'

def validate_passport(data)
	valid_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
	split_data = Set.new(data.split(" ").map {|e| e.slice(0..2)})
	# puts split_data
	valid_fields.each do |field|

		if !split_data.include?(field)
			return false
		end
	end
	return true
end




def count_valid_passports(parsed_data)
	count = 0
	parsed_data.each do |data|
		valid = validate_passport(data)

		if valid == true
			count += 1
		end
	end
	return count
end

# File.foreach("temp.txt", sep="/\n{2,}/" ). each do |line|
# 	puts line
# 	if validate_passport(line)
# 		count += 1
# 	end
# end


parsed_data = File.read("passports.txt").split(/\n{2,}/)
# puts parsed_data
puts count_valid_passports(parsed_data)




