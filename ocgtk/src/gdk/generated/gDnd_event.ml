(* High-level class for DNDEvent *)
class dnd_event (obj : Dnd_event.t) = object (self)

  method get_drop : unit -> GDrop.drop option =
    fun () ->
      Option.map (fun ret -> new GDrop.drop ret) (Dnd_event.get_drop obj)

    method as_dnd_event = obj
end

