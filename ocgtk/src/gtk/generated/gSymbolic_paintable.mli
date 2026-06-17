class type symbolic_paintable_t = object
    method snapshot_symbolic : Ocgtk_gdk.Gdk.Snapshot.snapshot_t -> float -> float -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array -> Gsize.t -> unit
    method as_symbolic_paintable : Symbolic_paintable.t
end

class symbolic_paintable : Symbolic_paintable.t -> symbolic_paintable_t

