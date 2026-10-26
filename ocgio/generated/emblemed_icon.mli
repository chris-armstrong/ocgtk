class type emblemed_icon_t = object
  inherit Icon.icon_t
  method add_emblem : Emblem.emblem_t -> unit
  method clear_emblems : unit -> unit
  method get_emblems : unit -> Emblem.emblem_t list
  method get_icon : unit -> Icon.icon_t
  method gicon : Icon.icon_t
  method as_emblemed_icon : Raw.Emblemed_icon.t
end

class emblemed_icon : Raw.Emblemed_icon.t -> emblemed_icon_t

val new_ : Icon.icon_t -> Emblem.emblem_t option -> emblemed_icon_t
