class emblemed_icon : Emblemed_icon.t ->
  object
    method add_emblem : #GEmblem.emblem -> unit
    method clear_emblems : unit -> unit
    method get_icon : unit -> GIcon.icon
    method as_emblemed_icon : Emblemed_icon.t
  end

