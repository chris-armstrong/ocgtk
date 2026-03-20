class type symbolic_paintable_t = object
    method as_symbolic_paintable : Symbolic_paintable.t
end

class symbolic_paintable : Symbolic_paintable.t -> symbolic_paintable_t

