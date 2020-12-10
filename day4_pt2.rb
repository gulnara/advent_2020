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
	flag = field[0]
	field_data = field[1]

	case flag

	when "byr"
		puts "#{field_data}"
		return byr_valid?(field_data)
	when "iyr"
		puts "#{field_data}"
		return iyr_valid?(field_data)
	when "eyr"
		puts "#{field_data}"
		return eyr_valid?(field_data)
	when "hgt"
		puts "#{field_data}"
		return hgt_valid?(field_data)
	when "hcl"
		puts "#{field_data}"
		return hcl_valid?(field_data)
	when "ecl"
		puts "#{field_data}"
		return ecl_valid?(field_data)
	when "pid"
		puts "#{field_data}"
		return pid_valid?(field_data)
	when "cid"
		return true
	else
		puts "#{field}"
		return false
	end
end


def byr_valid?(field)
	if field.to_i >= 1920 and field.to_i <= 2002
		return true
	else
		return false
	end
end


def iyr_valid?(field)
	if field.to_i >= 2010 and field.to_i <= 2020
		return true
	else
		return false
	end
end

def eyr_valid?(field)
	if field.to_i >= 2020 and field.to_i <= 2030
		return true
	else
		return false
	end
end

def hgt_valid?(field)
	hgt = field.slice(0..-3).to_i
	msrm = field[-2..-1]

	if msrm == "cm" and hgt >= 150 and hgt <= 193
		return true
	elsif msrm == "in" and hgt >= 59 and hgt <= 76
		return true
	else
		return false
	end
end

def hcl_valid?(field)
	if field.slice(0) != "#"
		return false
	end

	if !field.slice(1..).match(/\A[a-f0-9]*\z/).nil? and field.slice(1..).length == 6
		return true
	else
		return false
	end
end

def ecl_valid?(field)
	ecl = Set.new(["amb", "blu", "brn", "gry", "grn", "hzl", "oth"])
	if ecl.include?(field)
		return true
	else
		return false
	end
end

def pid_valid?(field)
	if !field.match(/\A[0-9]*\z/).nil? and field.length == 9
		return true
	else
		return false
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


parsed_data = File.read("passports.txt").split(/\n{2,}/)
puts count_valid_passports(parsed_data)
# 158



