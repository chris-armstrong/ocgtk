(* High-level class for Emblem *)
class emblem (obj : Emblem.t) = object (self)

  method get_icon : unit -> GIcon.icon =
    fun () ->
      new  GIcon.icon(Emblem.get_icon obj)

  method get_origin : unit -> Gio_enums.emblemorigin =
    fun () ->
      (Emblem.get_origin obj)

    method as_emblem = obj
end

