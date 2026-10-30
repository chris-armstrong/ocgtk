class type symbolic_paintable_t = object
  (** {2:methods Methods} *)

  method snapshot_symbolic :
    Ocgdk.Snapshot.snapshot_t ->
    float ->
    float ->
    Ocgdk.Raw.Rgb_a.t array ->
    Gsize.t ->
    unit
  (** Snapshots the paintable with the given colors.

      If less than 4 colors are provided, GTK will pad the array with default
      colors. *)

  (** {2:conversions Conversions} *)

  method as_symbolic_paintable : Raw.Symbolic_paintable.t
end

(* High-level class for SymbolicPaintable *)
class symbolic_paintable (obj : Raw.Symbolic_paintable.t) : symbolic_paintable_t
  =
  object (self)
    method snapshot_symbolic :
        Ocgdk.Snapshot.snapshot_t ->
        float ->
        float ->
        Ocgdk.Raw.Rgb_a.t array ->
        Gsize.t ->
        unit =
      fun snapshot width height colors n_colors ->
        let snapshot = snapshot#as_snapshot in
        Raw.Symbolic_paintable.snapshot_symbolic obj snapshot width height
          colors n_colors

    method as_symbolic_paintable = obj
  end
