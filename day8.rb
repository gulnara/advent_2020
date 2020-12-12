

ops = []

File.foreach("temp.txt").each do |line|
	ops.append(line.split(" "))
end

puts ops