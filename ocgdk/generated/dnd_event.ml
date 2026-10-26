class type dnd_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_drop : unit -> Drop.drop_t option
  method as_dnd_event : Raw.Dnd_event.t
end

(* High-level class for DNDEvent *)
class dnd_event (obj : Raw.Dnd_event.t) : dnd_event_t =
  object (self)
    inherit App_launch_context_cycle_de440b34.event (obj :> Raw.Event.t)

    method get_drop : unit -> Drop.drop_t option =
      fun () ->
        Option.map (fun ret -> new Drop.drop ret) (Raw.Dnd_event.get_drop obj)

    method as_dnd_event = obj
  end
