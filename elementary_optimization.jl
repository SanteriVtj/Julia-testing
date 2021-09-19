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

function newton(f::Function, vals::Array{Float,1}, it=50)
    append!(vals, vals[end] - 1 / ForwardDiff.derivative(x -> ForwardDiff.derivative(f, x), vals[end]) *
        ForwardDiff.derivative(f, vals[end]))
    if it == 0
        return vals
    end
    newton(f, vals, it-1)
end

f(x) = x^4-x^3-8x^2
a = copy(newton(f, [2.], 10))
b = [a f.(a)]

xlim = [minimum(b[1:end,1]) - .1 * minimum(b[1:end,1]), maximum(b[1:end,1]) + .1 * maximum(b[1:end,1])]

gr()
p = plot(xlim[1]:.05:xlim[2], f.(xlim[1]:.05:xlim[2]))
for i in 1:size(b)[1]-1
    plot!(b[i:i+1], b[i:i+1, 2], linestyle=:dot, label=false)
    scatter!(b[i:i+1], b[i:i+1, 2], label=false)
end
plot(p)

