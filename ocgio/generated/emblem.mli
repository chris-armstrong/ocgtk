class type emblem_t = object
  inherit Icon.icon_t
  method get_icon : unit -> Icon.icon_t
  method get_origin : unit -> Enums.emblemorigin
  method as_emblem : Raw.Emblem.t
end

class emblem : Raw.Emblem.t -> emblem_t

val new_ : Icon.icon_t -> emblem_t
val new_with_origin : Icon.icon_t -> Enums.emblemorigin -> emblem_t
