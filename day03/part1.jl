include("../lib.jl")
function aocmain()


	lines = readlines("in.txt")
# 	lines = strlines("""987654321111111
# 811111111111119
# 234234234234278
# 818181911112111
# """)

	total = 0

	for line in lines
		mx = 0
		k = length(line)
		for i in 1:k-1
			for j in i+1:k
				x = (line[i] - '0') * 10 + (line[j] - '0')
				mx = max(mx, x)
			end
		end
		total += mx
	end

	println(total)


end
aocmain()
