include("../lib.jl")
function aocmain()


	lines = readlines("in.txt")
# 	lines = strlines("""987654321111111
# 811111111111119
# 234234234234278
# 818181911112111
# """)

	L = 12

	total = 0

	for line in lines
		k = length(line)

		A = [ch - '0' for ch in line]

		dp = zeros(Int, (L, k))

		dp[1, 1] = A[1]
		for i in 2:k
			dp[1, i] = max(dp[1, i-1], A[i])
		end

		for l in 2:L
			dp[l, l] = parse(Int, line[begin:l])
			for i in l+1:k
				dp[l, i] = max(
					dp[l, i-1],
					dp[l-1, i-1] * 10 + A[i]
				)
			end
		end

		mx = dp[L, k]

		total += mx
	end

	println(total)


end
aocmain()
