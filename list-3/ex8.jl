# Metoda Steffensena
t = 1024
setprecision(t)

function steffensen(f, x0::BigFloat, eps::BigFloat, maxiter)
  c = BigFloat(x0)
  fc = f(c)
  i = 0
  while abs(fc) > eps
    if i > maxiter
      return c
    else
      c -= fc^2/(f(c + fc) - fc)
      @printf "current approximation: %e, error: %e\n" c fc
      fc = f(c)
      i+=1
    end
  end
  @printf "final approximation: %e, error: %e\n" c fc
  return c
end

steffensen(x -> exp(-x) - sin(x), BigFloat(2), BigFloat(1e-200), 200)

# (6.2850492733 + 3.0963639681)/2
