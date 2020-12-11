[["light", "red", "1", "bright", "white", "2", "muted", "yellow"], ["dark", "orange", "3", "bright", "white", "4", "muted", "yellow"], ["bright", "white", "1", "shiny", "gold"], ["muted", "yellow", "2", "shiny", "gold", "9", "faded", "blue"], ["shiny", "gold", "1", "dark", "olive", "2", "vibrant", "plum"], ["dark", "olive", "3", "faded", "blue", "4", "dotted", "black"], ["vibrant", "plum", "5", "faded", "blue", "6", "dotted", "black"], ["faded", "blue", "no", "other"], ["dotted", "black", "no", "other"]]





def count_bags(rules, key_bags)
	count = 0

	rules.each do |r|
		key_bags.each do |b|
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
		if !i.empty? and i[1] != "gold"
			bags.append(i[1])	
		end
	end
	return bags
end	


def parse_rules(rule)
	temp_arr = []
	rule.each do |i|
		if i.include? "bag"
			next
		elsif i.include? "contain"
			next
		else
			temp_arr.append(i)
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

	if line_arr.include? "gold"
		gold_rule = parse_rules(line_arr)
	else
		sub_rule = parse_rules(line_arr)
	end

	gold_rules.append(gold_rule)
	rules.append(sub_rule)
end

# puts "#{gold_rules}"

key_bags = key_bags(gold_rules)

puts count_bags(rules, key_bags)


