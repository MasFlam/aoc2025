include("../lib.jl")
function aocmain()



	lines = readlines("in.txt")
# 	lines = strlines("""..@@.@@@@.
# @@@.@.@.@@
# @@@@@.@.@@
# @.@@@@..@.
# @@.@@@@.@@
# .@@@@@@@.@
# .@.@.@.@@@
# @.@@@.@@@@
# .@@@@@@@@.
# @.@.@@@.@.""")

	n = length(lines)
	m = length(lines[1])
	grid = makegrid(lines, sentinels=true)
	grid2 = makegrid(lines, sentinels=true)

	total = 0

	for i in 1:m
		for j in 1:n
			grid[i+1, j+1] == '.' && continue
			k = 0
			for (i2, j2) in nbors(i+1, j+1, diag=true)
				if grid[i2, j2] == '@'
					k += 1
				end
			end
			if k < 4
				grid2[i+1, j+1] = '.'
				total += 1
			end
		end
	end
	
	printgrid(grid2)
	println(total)

	

end
aocmain()
