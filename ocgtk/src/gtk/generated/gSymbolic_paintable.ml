class type symbolic_paintable_t = object
    method as_symbolic_paintable : Symbolic_paintable.t
end

(* High-level class for SymbolicPaintable *)
class symbolic_paintable (obj : Symbolic_paintable.t) : symbolic_paintable_t = object (self)

    method as_symbolic_paintable = obj
end

