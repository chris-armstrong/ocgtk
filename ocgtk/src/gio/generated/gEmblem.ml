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

let new_ (icon : GIcon.icon_t) : emblem_t =
  let icon = icon#as_icon in
  new emblem (Emblem.new_ icon)

let new_with_origin (icon : GIcon.icon_t) (origin : Gio_enums.emblemorigin) : emblem_t =
  let icon = icon#as_icon in
  new emblem (Emblem.new_with_origin icon origin)

