using Plots, Roots, ForwardDiff, LaTeXStrings, Calculus

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

q(x,y) = (y - x^2)^2 - x^2

plotlyjs()

a = -.6:.005:.6
b = -.6:.005:.6

contour(a, b, q)

function newton(f::Function, init::Real, vals::Array{Float,Float}, it=50)
    xn = init - 1 / ForwardDiff.derivative(x -> ForwardDiff.derivative(f, x), init) *
        ForwardDiff.derivative(f, init)
    if it == 0
        return xn
    end
    newton(f, xn, it-1)
end


newton(x -> x^4-x^3-8x^2, 2)

newton(x -> x^5-6x^3-2x^2,1)