# byr (Birth Year) - four digits; at least 1920 and at most 2002.
# iyr (Issue Year) - four digits; at least 2010 and at most 2020.
# eyr (Expiration Year) - four digits; at least 2020 and at most 2030.
# hgt (Height) - a number followed by either cm or in:
# If cm, the number must be at least 150 and at most 193.
# If in, the number must be at least 59 and at most 76.
# hcl (Hair Color) - a # followed by exactly six characters 0-9 or a-f.
# ecl (Eye Color) - exactly one of: amb blu brn gry grn hzl oth.
# pid (Passport ID) - a nine-digit number, including leading zeroes.
# cid (Country ID) - ignored, missing or not.


require 'set'

def validate_passport(data)
	split_data = Set.new(data.split(" ").map {|e| e.split(":")})
	valid_fields = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
	split_data.each do |field|
		if !validate_field(field)
			return false
		else
			valid_fields.delete(field[0])
		end
	end

	puts "#{valid_fields}"
	if valid_fields.length == 0
		return true
	else
		return false
	end
end

def validate_field(field)
	puts "#{field}"
	case field[0]

	when "byr"
		puts "#{field[1]}"
		if field[1].to_i >= 1920 or field[1].to_i <= 2002
			return true
		else
			return false
		end
	when "iyr"
		puts "#{field[1]}"
		if field[1].to_i >= 2010 or field[1].to_i <= 2020
			return true
		else
			return false
		end
	when "eyr"
		puts "#{field[1]}"
		if field[1].to_i >= 2020 or field[1].to_i <= 2030
			return true
		else
			return false
		end
	when "hgt"
		puts "#{field[1]}"
		if field[1].to_i >= 1920 or field[1].to_i <= 2002
			return true
		else
			return false
		end
	when "hcl"
		puts "#{field[1]}"
		if field[1].to_i >= 1920 or field[1].to_i <= 2002
			return true
		else
			return false
		end
	when "ecl"
		puts "#{field[1]}"
		if field[1].to_i >= 1920 or field[1].to_i <= 2002
			return true
		else
			return false
		end
	when "pid"
		puts "#{field[1]}"
		if field[1].to_i >= 1920 or field[1].to_i <= 2002
			return true
		else
			return false
		end
	else
		puts "#{field}"
		return true
	end
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


parsed_data = File.read("temp.txt").split(/\n{2,}/)
# puts parsed_data
count_valid_passports(parsed_data)




