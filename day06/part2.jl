include("../lib.jl")
function aocmain()


	lines = readlines("in.txt")
# 	lines = strlines("""123 328  51 64 
#  45 64  387 23 
#   6 98  215 314
# *   +   *   +""")

	lastline = lines[end] * " "^10
	grid = lines[begin:end-1]
	
	n = length(grid)
	m = length(grid[begin])

	multing = false
	accum = BigInt(0)

	total = BigInt(0)

	for j in 1:m
		if lastline[j] == '+'
			println("accum = $accum")
			total += accum
			multing = false
			accum = BigInt(0)
			println("Adding")
		elseif lastline[j] == '*'
			println("accum = $accum")
			total += accum
			multing = true
			accum = BigInt(1)
			println("Multing")
		end
		val = ""
		for i in 1:n
			if '0' <= grid[i][j] <= '9'
				val *= String([grid[i][j]])
			end
		end
		if val != ""
			println("val = $val")
			val = parse(Int, val)
			if multing
				accum *= val
			else
				accum += val
			end
		end
	end
	
	println("accum = $accum")
	total += accum
	println(total)

end
aocmain()
