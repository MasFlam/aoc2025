include("../lib.jl")

function isbad(a)
	as = string(a)
	ka = length(as)
	if ka >= 2 && ka % 2 == 0
		println(" '$as' $ka ", as[begin:div(ka,2)], " ", as[div(ka,2)+1:end])
		if as[begin:div(ka,2)] == as[div(ka,2)+1:end]
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
				total += x
			end
		end
	end

	println(total)

end
aocmain()
