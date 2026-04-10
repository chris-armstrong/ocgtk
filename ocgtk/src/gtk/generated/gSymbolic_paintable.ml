class type symbolic_paintable_t = object
    method snapshot_symbolic : Ocgtk_gdk.Gdk.Snapshot.snapshot_t -> float -> float -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array -> int -> unit
    method as_symbolic_paintable : Symbolic_paintable.t
end

(* High-level class for SymbolicPaintable *)
class symbolic_paintable (obj : Symbolic_paintable.t) : symbolic_paintable_t = object (self)

  method snapshot_symbolic : Ocgtk_gdk.Gdk.Snapshot.snapshot_t -> float -> float -> Ocgtk_gdk.Gdk.Wrappers.Rgb_a.t array -> int -> unit =
    fun snapshot width height colors n_colors ->
      let snapshot = snapshot#as_snapshot in
      (Symbolic_paintable.snapshot_symbolic obj snapshot width height colors n_colors)

    method as_symbolic_paintable = obj
end

