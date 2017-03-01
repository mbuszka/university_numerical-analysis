
w16( x :: Float16 ) = x^3 - Float16(6)*x^2 + Float16(3)*x - Float16(0.149)
w32( x :: Float32 ) = x^3 - Float32(6)*x^2 + Float32(3)*x - Float32(0.149)
w64( x :: Float64 ) = x*x*x - Float64(6)*x*x + Float64(3)*x - Float64(0.149)

u16( x :: Float16 ) = ((x - Float16(6))*x + Float16(3))*x - Float16(0.149)
u32( x :: Float32 ) = ((x - Float32(6))*x + Float32(3))*x - Float32(0.149)
u64( x :: Float64 ) = ((x - Float64(6))*x + Float64(3))*x - Float64(0.149)

relative_error( x, x_prec ) = abs(x - x_prec)#/x_prec)

p = -14.636489

x16 = w16(Float16(4.71)) 
x32 = w32(Float32(4.71))
x64 = w64(Float64(4.71))

println("First polynomial x^3 -6x^2 + 3x - 0.149, at 4.71")
@printf "floating half precision: result is %f, relative error %.10f\n" x16 relative_error(x16, p)
@printf "floating single precision: result is %f, relative error %.10f\n" x32 relative_error(x32, p)
@printf "floating double precision: result is %f, relative error %e\n" x64 relative_error(x64, p)

x16 = u16(Float16(4.71)) 
x32 = u32(Float32(4.71))
x64 = u64(Float64(4.71))

println("Second polynomial ((x - 6)x + 3)x - 0.149")
@printf "floating half precision: result is %f, relative error %.10f\n" x16 relative_error(x16, p)
@printf "floating single precision: result is %f, relative error %.10f\n" x32 relative_error(x32, p)
@printf "floating double precision: result is %f, relative error %e\n" x64 relative_error(x64, p)




