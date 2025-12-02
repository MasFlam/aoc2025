include("../lib.jl")
function isbad(a)
	as = string(a)
	ka = length(as)
	if ka == 2
		return as[1] == as[2]
	end
	if ka <= 1
		return false
	end
	
	for d in 1:ka-1
		d == ka && continue
		ka % d != 0 && continue
		# println([groups(as, d)...])
		xs = Set()
		for x in groups(as, d)
			push!(xs, x)
		end
		if length(xs) == 1
			return true
		end
	end
	
	false
end

function aocmain()


	input = split(readlines("in.txt")[1], ',')
	# input = split("11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124", ',')

	total = 0
	
	for range in input
		println(range)
		as, bs = split(range, '-')
		a, b = parse.(Int, split(range, '-'))
		
		println(a:b)
		for x in a:b
			if isbad(x)
				println("invalid $x")
				total += x
			end
		end
	end

	println(total)

end
aocmain()
