using CSoM
using Base.Test

# write your own tests here

code_tests = [
  "test_csom1.jl",
  "test_p4.1.1.jl",
  "test_p4.1.2.jl",
  "test_p4.2.2.jl",
  "test_p4.3.1b.jl",
  "test_p4.4.2.jl",
  "test_p4.5.2.jl",
  "test_p4.6.2.jl",
  "test_p4.7.1.jl",
  "test_p5.1.1.jl",
  "test_p5.1.2.jl",
  "test_p5.1.3.jl",
  "test_p5.1.4.jl",
  "test_p5.1.5.jl",
  "test_p5.2.1.jl",
  "test_p5.3.1.jl",
  "test_p5.4.1.jl",
  "test_p5.4.2.jl",
  "test_lufac.jl",
  "test_ldlt.jl",
  "test_ivp_ex7.3.jl",        # Four direct methods
  "test_bvp_ex7.4a.jl",       # Shooting method example 7.4a
  "test_bvp_ex7.4b.jl"        # Shooting method example 7.4b
]

if isfile(Pkg.dir("CSoM", "deps", "src", "CSoM", "4th_ed", "libcsom.dylib"))
  push!(code_tests, "test_csom2.jl")
end

println("Running tests:")

for my_test in code_tests
    println("\n  * $(my_test) *")
    include(my_test)
end

