x = 1.0
while true
  y = 1 / x
  if (x * y != 1)
    println(bits(x))
  end
  x = nextfloat(x)
end
