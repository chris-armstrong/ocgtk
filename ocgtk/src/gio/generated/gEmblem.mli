class emblem : Emblem.t ->
  object
    method get_icon : unit -> GIcon.icon
    method get_origin : unit -> Gio_enums.emblemorigin
    method as_emblem : Emblem.t
  end

