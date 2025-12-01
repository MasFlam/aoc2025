include("../lib.jl")
function aocmain()


	lines = readlines("in.txt")
# 	lines = 
# 	[
# 	"L68",
# 	"L30",
# 	"R48",
# 	"L5",
# 	"R60",
# 	"L55",
# 	"L1",
# 	"L99",
# 	"R14",
# 	"L82",
# ]

	pos = 50

	total = 0

	for line in lines
		dir = line[1]
		k = parse(Int, line[2:end])

		if dir == 'R'
			pos += k
			pos %= 100
		else
			pos -= k
			pos %= 100
			pos += 100
			pos %= 100
		end

		if pos == 0
			total += 1
		end
	end

	println(total)

end
aocmain()
