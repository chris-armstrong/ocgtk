class type symbolic_paintable_t = object
  method snapshot_symbolic :
    Ocgdk.Snapshot.snapshot_t ->
    float ->
    float ->
    Ocgdk.Raw.Rgb_a.t array ->
    Gsize.t ->
    unit

  method as_symbolic_paintable : Raw.Symbolic_paintable.t
end

class symbolic_paintable : Raw.Symbolic_paintable.t -> symbolic_paintable_t
