class type emblemed_icon_t = object
    method add_emblem : GEmblem.emblem_t -> unit
    method clear_emblems : unit -> unit
    method get_emblems : unit -> Emblem.t list
    method get_icon : unit -> GIcon.icon_t
    method as_emblemed_icon : Emblemed_icon.t
end

class emblemed_icon : Emblemed_icon.t -> emblemed_icon_t

val new_ : GIcon.icon_t -> GEmblem.emblem_t option -> emblemed_icon_t
