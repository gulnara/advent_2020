# light red bags contain 1 bright white bag, 2 muted yellow bags.
# dark orange bags contain 3 bright white bags, 4 muted yellow bags.
# bright white bags contain 1 shiny gold bag.
# muted yellow bags contain 2 shiny gold bags, 9 faded blue bags.
# shiny gold bags contain 1 dark olive bag, 2 vibrant plum bags.
# dark olive bags contain 3 faded blue bags, 4 dotted black bags.
# vibrant plum bags contain 5 faded blue bags, 6 dotted black bags.
# faded blue bags contain no other bags.
# dotted black bags contain no other bags.



rules = {
	"red": {"white": 1, "yellow": 2},
	"orange": {"white": 3, "yellow": 4},
	"white": {"gold": 1},
	"yellow": {"gold": 2, "blue": 9},
	"gold": {"olive": 1, "plum": 2},
	"olive": {"blue": 3, "black": 3},
	"plum": {"blue": 5, "black": 6},
	"blue": {},
	"black": {}
}


rules = []

File.foreach("temp.txt").each do |line|
	line_arr = line.split(" ")
	sub_rule = []
	line_arr.each do |i|
		if i.include? "bag"
			next
		elsif i.include? "contain"
			next
		else
			sub_rule.append(i)
		end
	end

	rules.append(sub_rule)
	# line_arr = line.split(" ")
	
	# for i in 0..(line_arr.length - 1)
	# 	j = i + 1
	# 	num = 0
	# 	if line_arr[j].include?("bag")
	# 		if !rules.key?(line_arr[i])
	# 			rules[line_arr[i]] = num
	# 		end
	# 	elsif line_arr[i].include?("contain")
	# 		num = line_arr[j]
			


end

puts "#{rules}"
