

def count_bags(rules, key_bags, gold_count)
	count = 0
	rules.each do |r|
		puts "#{r}"
		# this is the bug- assumes only 1 level of depth
		if (r & key_bags).any?
			count += 1
		end
	end
	return count + gold_count
end


def key_bags(gold_rules)
	bags = []
	count = 0
	gold_rules.each do |i|
		if !i.empty? and i[0] != "shinygold"
			bags.append(i[0])
			count += 1
		end
	end
	return bags, count
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

	if line.include? "shiny gold"
		gold_rule = parse_rules(line_arr)
	else
		sub_rule = parse_rules(line_arr)
	end

	gold_rules.append(gold_rule)
	rules.append(sub_rule)
end

# puts "#{gold_rules}"

key_bags, gold_count = key_bags(gold_rules)

puts "#{key_bags}"

puts count_bags(rules, key_bags, gold_count)
# 39
