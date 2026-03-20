class type emblem_t = object
    method get_icon : unit -> GIcon.icon_t
    method get_origin : unit -> Gio_enums.emblemorigin
    method as_emblem : Emblem.t
end

class emblem : Emblem.t -> emblem_t

