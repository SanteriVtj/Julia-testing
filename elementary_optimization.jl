using Plots, Roots, ForwardDiff, LaTeXStrings

f(x) = 2x^4 - 5x^3 - x^2

D(f) = x -> ForwardDiff.derivative(f, float(x))

α = find_zeros(D(f), (-3, 3))

p1 = plot(-3:.01:3, f.(-3:.01:3))
plot!(α, f.(α), seriestype=:scatter)

p2 = plot(α[1]-.1:.001:α[1]+.1, f.(α[1]-.1:.001:α[1]+.1))
plot!([α[1]], [f(α[1])], seriestype=:scatter)

p3 = plot(α[2]-.1:.001:α[2]+.1, f.(α[2]-.1:.001:α[2]+.1))
plot!([α[2]], [f(α[2])], seriestype=:scatter)

p4 = plot(α[3]-.1:.001:α[3]+.1, f.(α[3]-.1:.001:α[3]+.1))
plot!([α[3]], [f(α[3])], seriestype=:scatter)

plot(p1, p2, p3, p4, layout=(2,2), legend=false, size=(850, 650), plot_title=L"2x^4-5x^3-x^2")

