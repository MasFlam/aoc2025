include("../lib.jl")
function aocmain()


	lines = readlines("in.txt")
# 	lines = strlines("""123 328  51 64 
#  45 64  387 23 
#   6 98  215 314
# *   +   *   +""")

	lastline = split(lines[end])
	lines = parseints.(split.(lines[begin:end-1]))

	n = length(lastline)

	results = []

	for i in 1:n
		multing = lastline[i] == "*"
		result = BigInt(multing ? 1 : 0)
		for line in lines
			if multing
				result *= line[i]
			else
				result += line[i]
			end
		end
		push!(results, result)
	end

	println(results)
	println(sum(results))
	


end
aocmain()
