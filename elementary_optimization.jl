using Plots, Roots, ForwardDiff

f(x) = 2x^4 - 5x^3 - x^2

D(f) = x -> ForwardDiff.derivative(f, float(x))

plot(-3:.01:3, f.(-3:.01:3))
find_zero(D, (-3, 3))