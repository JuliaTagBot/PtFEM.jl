### Finite elements used to approximate fin_el ###

"""
## FiniteElement

Abstract finite element type.

### Type
```julia
abstract FiniteElement
```

### Subtypes
```julia
* Line::FiniteElement          : 1D Line(nod, nodof)
* Triangle::FiniteElement      : 2D Triangle(nod, nodof)
* Quadrilateral::FiniteElement : 2D Quadrilateral(nod, nodof)
* Hexahedron::FiniteElement    : 3D Hexahedron(nod, nodof)
* Tetrahedron::FiniteElement   : 3D Tetrahedron(nod, nodof)
```
"""
abstract type FiniteElement end     # Finite elements

"""
## Line (Interval) 1D type finite element

### Constructor
```julia
Line(nod, nodof)
Line(nodof)
```

### Arguments
```julia
* nod::Int64       : Number of nodes for finite element, defaults to 2
* nodof::Int64     : Number of degrees of freedom per node
```

### Related help
```julia
?FiniteElement      : Help on finite element types
```

"""
immutable Line <: FiniteElement
  nod::Int64
  nodof::Int64
end
Line(nodof::Int64) = Line(2, nodof)

"""
## Triangle type 2D finite element

### Constructor
```julia
Triangle(nod, nodof)
```

### Arguments
```julia
* nod::Int64       : Number of nodes for finite element (3, 6, 10, 15)
* nodof::Int64     : Number of degrees of freedom per node
```

### Related help
```julia
?FiniteElement      : Help on finite element types
```

"""
immutable Triangle <: FiniteElement
  nod::Int64
  nodof::Int64
end

"""
## Quadrilateral type 2D finite element

### Constructor
```julia
Quadrilateral(nod, nodof)
```

### Arguments
```julia
* nod::Int64       : Number of nodes for finite element (4, 8, 9)
* nodof::Int64     : Number of degrees of freedom per node
```

### Related help
```julia
?FiniteElement      : Help on finite element types
```

"""
immutable Quadrilateral <: FiniteElement
  nod::Int64
  nodof::Int64
end

"""
## Tetrahedron 3D finite element

### Constructor
```julia
Tetrahedron(nod, nodof)
Tetrahedron(nodof)
```

### Arguments
```julia
* nod::Int64       : Number of nodes for finite element (defaults to 4)
* nodof::Int64     : Number of degrees of freedom per node
```

### Related help
```julia
?FiniteElement      : Help on finite element types
```

"""
immutable Tetrahedron <: FiniteElement
  nod::Int64
  nodof::Int64
end
Tetrahedron(nodof::Int64) = Tetrahedron(4, nodof)

"""
## hexahedron 3D finite element

### Constructor
```julia
Hexahedron(nod, nodof)
```

### Arguments
```julia
* nod::Int64       : Number of nodes for finite element (8, 14, 20)
* nodof::Int64     : Number of degrees of freedom per node
```

### Related help
```julia
?FiniteElement      : Help on finite element types
```

"""
immutable Hexahedron <: FiniteElement
  nod::Int64
  nodof::Int64
end
