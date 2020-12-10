
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

def create_seats_array(seats)
	seat_ids = []
	seats.each do |seat|
		row = which_row(seat.slice(0..6))
		column = which_column(seat.slice(7..))
		seat_ids.append(seat_id(column, row))
	end

	return seat_ids.sort!
end

def highest_seat_id(seats_data)
	seats = create_seats_array(seats_data)
	return seats.last
end

def missing_seat_id(seats_data)
	seats = create_seats_array(seats_data)
	idx1 = 0
	idx2 = idx1 + 1

	for i in 0..(seats.length - 2)
		j = i + 1
		if seats[j] != seats[i] + 1 
			return (seats[i] + 1)
		end
	end
	return "no missing seat"
end

seats = File.read("seats.txt").split

puts highest_seat_id(seats)
# 901

puts missing_seat_id(seats)
# 661

