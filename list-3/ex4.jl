t = 128
s = big"1"
c = big"0"
P = big"2"

setprecision(t)
for k = 3:2t
  c = sqrt((1+c)/2)
  # s /= 2 * c 
  s = sqrt((1-c)/2)
  P = ldexp(s, k)
  err = BigFloat(pi) - P
  @printf "s%d = %e, c%d = %.20e, P%d = %.20e, err = %e\n" k s k c k P err
end

