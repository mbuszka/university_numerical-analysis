t = 1024
setprecision(t)
function newton(f, df, x0, eps, maxiter)
  x = BigFloat(x0)
  fx = f(x)
  i = 0
  while abs(fx) > eps
    if i > maxiter
      return x
    else
      @printf "current approximation: %e, error: %e\n" x fx
      x -= fx/df(x)
      fx = f(x)
    end
  end
  x
end

newton(x -> x^2,x -> 2x, 0.5, BigFloat(1e-100), 200)
