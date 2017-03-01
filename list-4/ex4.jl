t = 1024
setprecision(t)
function falsi(f, x0, x1, eps, maxiter)
  xp = BigFloat(x0)
  x  = BigFloat(x1)
  fx  = f(x)
  fxp = f(xp)
  i = 0
  while abs(fx) > eps
    if i > maxiter
      return x
    else
      @printf "current approximation: %e, error: %e\n" x fx
      t = x - fx*(x - xp)/(fx - fxp)
      ft = f(t)
      if fx * ft >= 0
        x, fx = t, ft
      else
        xp, fxp = t, ft
      end
    end
  end
  @printf "final approximation: %e, error: %e\n" x fx
end

falsi(x -> x^2 -1, 2, 0, BigFloat(1e-100), 200)
