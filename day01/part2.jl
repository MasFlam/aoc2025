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
			if pos + k < 100
				pos += k
			else
				c = div(k - (100 - pos), 100)
				pos += k
				pos %= 100
				total += c + 1
				println("$line => total += $(c+1)")
			end
		else
			if pos - k > 0
				pos -= k
			else
				c = div(k - pos, 100)
				total += c + (pos == 0 ? 0 : 1)
				pos -= k
				pos %= 100
				pos += 100
				pos %= 100
				println("$line => total += $(c+1)")
			end
		end

		# if pos == 0
		# 	total += 1
		# end
	end

	println(total)

end
aocmain()
