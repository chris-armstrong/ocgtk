(* High-level class for EmblemedIcon *)
class emblemed_icon (obj : Emblemed_icon.t) = object (self)

  method add_emblem : 'p1. (#GEmblem.emblem as 'p1) -> unit =
    fun emblem ->
      let emblem = emblem#as_emblem in
      (Emblemed_icon.add_emblem obj emblem)

  method clear_emblems : unit -> unit =
    fun () ->
      (Emblemed_icon.clear_emblems obj)

    method as_emblemed_icon = obj
end

