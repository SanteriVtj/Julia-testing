using Plots, Roots, ForwardDiff, LaTeXStrings

f(x) = 2x^4 - 5x^3 - x^2

D(f) = x -> ForwardDiff.derivative(f, float(x))

α = find_zeros(D(f), (-3, 3))

plot(-3:.01:3, f.(-3:.01:3), label=L"2x^4-5x^3-x^2")
plot!(α, f.(α), seriestype=:scatter, label="Roots")


