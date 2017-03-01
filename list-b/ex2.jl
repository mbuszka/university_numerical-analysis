function nc2(f, a, b)
  h = (b-a) / 2.
  h * (f(a) + 4f(a + h) + f(b)) / 3.
end

function nc4(f, a, b)
  h = (b-a) / 4.
  2. / 45. * h * (7f(a) + 32f(a+h) + 12f(a+2h) + 32f(a+3h) + 7f(b))
end

function nc6(f, a, b)
  h = (b-a) / 6.
  h * (41(f(a) + f(b)) + 216(f(a+h) + f(a+5h)) + 27(f(a+2h) + f(a+4h)) + 272f(a+3h)) / 140.
end

function nc8(f, a, b)
  h = (b-a) / 8.
  4. / 14175. * h * (989(f(a) + f(b)) + 5888(f(a+h) + f(a+7h)) - 928(f(a+2h) + f(a+6h)) + 10496(f(a+3h) + f(a+5h)) - 4540f(a+4h))
end

function nc10(f, a, b)
  h = (b-a) / 10.
  5. / 299376. * h * (16067(f(a) + f(b)) + 106300(f(a+h) + f(a+9h)) - 48525(f(a+2h) + f(a+8h)) + 272400(f(a+3h) + f(a+7h)) - 260550(f(a+4h) + f(a+6h)) + 427368f(f(a+5h)))
end

f = x -> 1. / (1. + x * x)
@show nc2(f, -4, 4) - 2atan(4)
@show nc4(f, -4, 4) - 2atan(4)
@show nc6(f, -4, 4) - 2atan(4)
@show nc8(f, -4, 4) - 2atan(4)
@show nc10(f, -4, 4) - 2atan(4)
@show 2atan(4)
