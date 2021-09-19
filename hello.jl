using Plots, Random

f(x) = x + 1
function plot_results()
    x = 1:5
    y = f.(x)
    plot(x, y)
    print(y)
end

# execute main function
plot_results()