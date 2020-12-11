

def count_bags(rules, key_bags)
	count = 0

	rules.each do |r|
		# puts "#{r}"
		key_bags.each do |b|
			# puts "#{b}"
			if r.include?(b)
				count += 1
			end
		end
	end

	return count
end


def key_bags(gold_rules)
	bags = []
	gold_rules.each do |i|
		if !i.empty? and i[0] != "shinygold"
			bags.append(i[0])
		end
	end
	return bags
end	

def parse_rules(rule)
	temp_arr = []
	r = ""
	digits = "0123456789"
	rule.each do |i|
		if i.include? "bag"
			temp_arr.append(r)
			r = ""
		elsif i.include? "contain"
			temp_arr.append(r)
			r = ""
		elsif digits.include? i
			
		else
			r = r + i
		end
	end
	return temp_arr
end


rules = []
gold_rules = []

File.foreach("bags.txt").each do |line|
	line_arr = line.split(" ")
	sub_rule = []
	gold_rule = []

	if line_arr.include? "gold" and line_arr.include? "shiny"
		gold_rule = parse_rules(line_arr)
	else
		sub_rule = parse_rules(line_arr)
	end

	gold_rules.append(gold_rule)
	rules.append(sub_rule)
end

# puts "#{gold_rules}"

key_bags = key_bags(gold_rules)
# puts key_bags

# clean_rules(rules)

puts count_bags(rules, key_bags)


