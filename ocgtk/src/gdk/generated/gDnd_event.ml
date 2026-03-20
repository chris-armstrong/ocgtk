class type dnd_event_t = object
    method get_drop : unit -> GDrop.drop_t option
    method as_dnd_event : Dnd_event.t
end

(* High-level class for DNDEvent *)
class dnd_event (obj : Dnd_event.t) : dnd_event_t = object (self)

  method get_drop : unit -> GDrop.drop_t option =
    fun () ->
      Option.map (fun ret -> new GDrop.drop ret) (Dnd_event.get_drop obj)

    method as_dnd_event = obj
end

