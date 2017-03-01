function AdaptiveSimpson(f, a, b; abstol = 1.0e-8)
  nf = 3;
  ff = f([a, (a+b)/2, b]);
  nf = 3; # Initial Simpson approximation
  I1 = (b-a)*dot([1, 3, 1], ff) / 6;
  function adaptrec(f, a, b, ff, I1, tol, nf)
    h = (b-a) / 2;
    fm = f([a+h/2, b-h/2]);
    nf = nf + 2;
    # Simpson approximations for left and right subinterval
    fR = [ff[2], fm[2], ff[3]];
    fL = [ff[1], fm[1], ff[2]];
    IL = h * dot([1, 4, 1], fL) / 6;
    IR = h * dot([1, 4, 1], fR) / 6;
    I2 = IL + IR;
    I = I2 + (I2 - I1)/15;
    # Extrapolated approximation
    if (abs(I - I2) > tol)
      IL, nf = adaptrec(f, a, a+h, fL, IL, tol/2, nf);
      IR, nf = adaptrec(f, b-h, b, fR, IR, tol/2, nf);
      I = IL + IR;
    end
    return I, nf;
  end
  return adaptrec(f, a, b, ff, I1, abstol, nf);
end
f = x -> cos(50x) .* x .* x
@show quadgk(f, -1, 1)
@show AdaptiveSimpson(f, -1, 1)
