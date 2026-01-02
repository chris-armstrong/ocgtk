class dnd_event : Dnd_event.t ->
  object
    method get_drop : unit -> GDrop.drop option
    method as_dnd_event : Dnd_event.t
  end

