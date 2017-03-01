function bairstow(a, ϵs = 1e-20)
  T = eltype(a)
  n = size(a, 1)
  b = Array{T}(n)
  c = Array{T}(n)
  x = Array{Complex{T}}(n-1)
  u = T(0.1)
  v = T(0.1)
  while n > 3
  b[n] = a[n]
  c[n] = T(0)
  c[n-1] = a[n]
  # @printf("Iter\tu\t\tv\t\tb₀\t\tb₁\t\tϵu\t\tϵv\n")
  for j in 1 : 20
    b[n-1]   = a[n-1] + u*b[n]

    for i in n-2 : -1 : 1
      b[i] = a[i] + u*b[i+1] + v*b[i+2]
      c[i] = b[i+1] + u*c[i+1] + v*c[i+2]
    end

    J = c[1]*c[3] - c[2]*c[2]
    δu = (c[2]*b[2] - c[3]*b[1]) / J
    δv = (c[2]*b[1] - c[1]*b[2]) / J
    u = u + δu
    v = v + δv
    ϵu = abs(δu / u)
    ϵv = abs(δv / v)

    # @printf("%d\t%.5e\t%.5e\t%.5e\t%.5e\t%.5e\t%.5e\n", j, u, v, b[1], b[2], ϵu, ϵv)
    if ϵu < ϵs && ϵv < ϵs
      break
    end
  end
  print("Dzielimy przez wielomian ") 
  print_quad(u, v)
  println()
  x[n-1], x[n-2] = solve_quad(u, v)
  n = n - 2
  for i in 1 : n
    a[i] = b[i+2]
  end
end
  if n == 3
    print("Dzielimy przez wielomian ")
    print_quad(-a[2]/a[3], -a[1]/a[3])
    println()
    x[1], x[2] = solve_quad(-a[2]/a[3], -a[1]/a[3])
  else
    x[1] = -a[1]/a[2]
  end
  x
end

function print_quad(u, v)
  print("z² ")
  if u < 0
    print("+ ")
  else 
    print("- ")
  end
  @printf("%.5e", abs(u))
  if v < 0
    print("z + ")
  else 
    print("z - ")
  end
  @printf("%.5e", abs(v))
end

function solve_quad(u, v)
  Δ = u * u + 4.0v
  r = sqrt(complex(Δ, 0.0))
  x₁= (u+r) / 2
  x₂= (u-r) / 2
  (x₁, x₂)
end  

using PolynomialRoots

setprecision(128)
a = [BigFloat(1), BigFloat(2), BigFloat(3), BigFloat(4), BigFloat(5)]

x = bairstow(copy(a))
@printf("x = [\n")
for i in 1 : 4
  @printf(" %.16e %+.16ei\n", real(x[i]), imag(x[i]))
end
println("]")
  
y = roots(a)
@printf("y = [\n")
for i in 1 : 4
  @printf(" %.16e %+.16ei\n", real(x[i]), imag(x[i]))
end
println("]")
 
err = norm(x - y)
@show err
