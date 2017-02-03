using CSoM
using Base.Test

#=
Compare formulas at:
http://www.awc.org/pdf/codes-standards/publications/design-aids/AWC-DA6-BeamFormulas-0710.pdf
=#

data = Dict(
  # Frame(nels, nn, ndim, nst, nip, finite_element(nod, nodof))
  :struc_el => Frame(20, 21, 3, 1, 1, Line(2, 3)),
  :properties => [1.0e6 1.0e6 1.0e6 3.0e5;],
  :x_coords => collect(linspace(0, 4, 21)),
  :y_coords => zeros(21),
  :z_coords => zeros(21),
  :g_num => [
    collect(1:20)';
    collect(2:21)'],
  :support => [
    (1, [0 0 0 0 0 0]),
    (21, [0 0 0 0 0 0]),
    ],
  :loaded_nodes => [
    (11, [0.0 -10000.0 0.0 0.0 0.0 0.0])]
)

data |> display
println()

m = FE4_4(data)

println("Displacements:")
m.displacements |> display
println()

println("Actions:")
m.actions |> display
println()

println("y displacements:")
m.displacements[2,:] |> display
println()

println("y moment actions:")
m.actions[12,:] |> display
println()

# See figure 24 in above reference (Δmax): 
@test m.displacements[2,11] ≈ -10000 * 4^3 / (192 * 1.0e6) atol=10.0*eps()

# See figure 24 in above reference (Mmax): 
@test m.actions[12,10] ≈ (10000 * 4 / 8) atol=10.0*eps()

if VERSION.minor == 5
  using Plots
  gr(size=(400,600))

  p = Vector{Plots.Plot{Plots.GRBackend}}(3)
  p[1] = plot(m.x_coords, m.displacements[2,:], ylim=(-0.004, 0.001), lab="Displacement", 
   xlabel="x [m]", ylabel="deflection [m]", color=:red)
  p[2] = plot(m.actions[2,:], lab="Shear force", ylim=(-6000, 6000), xlabel="element",
    ylabel="shear force [N]", palette=:greens,fill=(0,:auto),α=0.6)
  p[3] = plot(m.actions[12,:], lab="Moment", ylim=(-6000, 6000), xlabel="element",
    ylabel="moment [Nm]", palette=:grays,fill=(0,:auto),α=0.6)

  plot(p..., layout=(3, 1))
  savefig(ProjDir*"/figure-24.png")
  #=
  plot!()
  gui()
  =#
end