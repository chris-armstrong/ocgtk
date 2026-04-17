class type emblem_t = object
    inherit GIcon.icon_t
    method get_icon : unit -> GIcon.icon_t
    method get_origin : unit -> Gio_enums.emblemorigin
    method as_emblem : Emblem.t
end

class emblem : Emblem.t -> emblem_t

val new_ : GIcon.icon_t -> emblem_t
val new_with_origin : GIcon.icon_t -> Gio_enums.emblemorigin -> emblem_t
