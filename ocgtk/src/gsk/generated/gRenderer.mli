class renderer : Renderer.t ->
  object
    method is_realized : unit -> bool
    method unrealize : unit -> unit
    method realized : bool
    method as_renderer : Renderer.t
  end

