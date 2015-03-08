using Compat, CSoM

include("FE5_4.jl")

data = @compat Dict(
  # GenericSolid(ndim, nst, nels, nn, nip, finite_element(nod, nodof), axisymmentrix)
  :element_type => GenericSolid(3, 6, 7, 40, 27, Hexahedron(14, 3), false),
  :properties => [1.0 0.49 0.0;],
  :g_coord => [
    0.0000  0.0000  0.0000;     0.0000  1.0000  0.0000;
    0.0000  0.0000 -1.0000;     0.0000  1.0000 -1.0000;
    1.0000  0.0000  0.0000;     1.0000  1.0000  0.0000;
    1.0000  0.0000 -1.0000;     1.0000  1.0000 -1.0000;
    0.1650  0.2980 -0.2550;     0.2720  0.7700 -0.2500;
    0.3200  0.3570 -0.8140;     0.2490  0.8080 -0.6580;
    0.7880  0.3560 -0.3070;     0.8500  0.7370 -0.3510;
    0.6770  0.3170 -0.6950;     0.8260  0.7120 -0.7120;
    0.0000  0.5000 -0.5000;     0.5000  0.5000  0.0000;
    0.5000  0.0000 -0.5000;     0.5000  1.0000 -0.5000;
    0.5000  0.5000 -1.0000;     1.0000  0.5000 -0.5000;
    0.2515  0.5582 -0.4942;     0.5188  0.5403 -0.2908;
    0.4875  0.3320 -0.5177;     0.5493  0.7568 -0.4928;
    0.5180  0.5485 -0.7197;     0.7853  0.5305 -0.5162;
    0.1093  0.5170 -0.1263;     0.5305  0.8767 -0.1503;
    0.9095  0.5232 -0.1645;     0.4882  0.1635 -0.1405;
    0.1213  0.1637 -0.5173;     0.1303  0.8945 -0.4770;
    0.9190  0.8623 -0.5158;     0.8663  0.1682 -0.5005;
    0.1423  0.5412 -0.8680;     0.5187  0.8800 -0.8425;
    0.8758  0.5072 -0.8518;     0.4992  0.1685 -0.8773
  ],
  :g_num => [
    11,  9, 13, 15, 25, 23, 24, 28, 27, 12, 10, 14, 16, 26,
     3,  1,  9, 11, 33, 17, 29, 23, 37,  4,  2, 10, 12, 34,
     9,  1,  5, 13, 32, 29, 18, 31, 24, 10,  2,  6, 14, 30,
    15, 13,  5,  7, 36, 28, 31, 22, 39, 16, 14,  6,  8, 35,
     3, 11, 15,  7, 40, 37, 27, 39, 21,  4, 12, 16,  8, 38,
    12, 10, 14, 16, 26, 34, 30, 35, 38,  4,  2,  6,  8, 20,
     3,  1,  5,  7, 19, 33, 32, 36, 40, 11,  9, 13, 15, 25
  ],
  :support => [
    (1, [0 1 1]), (2, [0 0 1]), ( 3, [0 1 0]), ( 4, [0 0 0]), ( 6, [1 0 1]),
    (7, [1 1 0]), (8, [1 0 0]), (17, [0 1 1]), (20, [1 0 1]), (21, [1 1 0])
  ],
  :fixed_freedoms => [
    ( 1, 2, 0.01),
    ( 3, 2, 0.01),
    ( 5, 2, 0.01),
    ( 7, 2, 0.01),
    (19, 2, 0.01)
  ]
)

@time m = FE5_4(data)
println()
