
# 0 - 127
def which_row(row)
	idx1 = 0
	idx2 = 127
	mid = 0

	row = row.split("")

	while row.length != 0
		char = row.shift
		mid = (idx1 + idx2) / 2
		if char == "B" and row.length == 0
			mid = idx2
		elsif char == "B"
			idx1 = mid + 1
		else
			idx2 = mid
		end 
	end
	return mid
end

# 0 - 7
def which_column(column)
	idx1 = 0
	idx2 = 7
	mid = 0

	column = column.split("")

	while column.length != 0
		char = column.shift
		mid = (idx1 + idx2) / 2
		if char == "R" and column.length == 0
			mid = idx2
		elsif char == "R"
			idx1 = mid + 1
		else
			idx2 = mid
		end 
	end
	return mid
end

def seat_id(column, row)
	return (row * 8 + column)
end

def highest_seat_id(seats)
	seat_ids = []
	seats.each do |seat|
		row = which_row(seat.slice(0..6))
		column = which_column(seat.slice(7..))
		seat_ids.append(seat_id(column, row))
	end

	return seat_ids.sort!.last
end

seats = File.read("seats.txt").split

puts highest_seat_id(seats)
# 901
