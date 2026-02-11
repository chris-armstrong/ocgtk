(* High-level class for RoundedRect *)
class rounded_rect (obj : Rounded_rect.t) = object (self)

  method init_copy : Rounded_rect.t -> Rounded_rect.t =
    fun src ->
      (Rounded_rect.init_copy obj src)

  method is_rectilinear : unit -> bool =
    fun () ->
      (Rounded_rect.is_rectilinear obj)

  method normalize : unit -> Rounded_rect.t =
    fun () ->
      (Rounded_rect.normalize obj)

  method offset : float -> float -> Rounded_rect.t =
    fun dx dy ->
      (Rounded_rect.offset obj dx dy)

  method shrink : float -> float -> float -> float -> Rounded_rect.t =
    fun top right bottom left ->
      (Rounded_rect.shrink obj top right bottom left)

    method as_rounded_rect = obj
end

