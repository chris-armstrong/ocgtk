(* High-level class for Renderer *)
class renderer (obj : Renderer.t) = object (self)

  method is_realized : unit -> bool =
    fun () ->
      (Renderer.is_realized obj)

  method unrealize : unit -> unit =
    fun () ->
      (Renderer.unrealize obj)

  method realized = Renderer.get_realized obj

    method as_renderer = obj
end

