class type emblem_t = object
    method get_icon : unit -> GIcon.icon_t
    method get_origin : unit -> Gio_enums.emblemorigin
    method as_emblem : Emblem.t
end

(* High-level class for Emblem *)
class emblem (obj : Emblem.t) : emblem_t = object (self)

  method get_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(Emblem.get_icon obj)

  method get_origin : unit -> Gio_enums.emblemorigin =
    fun () ->
      (Emblem.get_origin obj)

    method as_emblem = obj
end

