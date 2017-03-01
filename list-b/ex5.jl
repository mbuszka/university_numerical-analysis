function trapese(f, a, b, n)
  h = (b-a) / n
  sum = f(a) / 2. + f(b) / 2.
  for i in 1 : n-1
    sum += f(a+i*h)
  end
  sum * h
end

function simpson(f, a, b, n)
  tn = trapese(f, a, b, n)
  tm = trapese(f, a, b, n/2)
  (4tn - tm) / 3.
end

@show (10.^5 * π^5 / 360.) ^ (0.25)
@show simpson(sin, 0, π, 18)

@show sqrt(π^3 * 10.^5 / 24.)
@show trapese(sin, 0, π, 359)
