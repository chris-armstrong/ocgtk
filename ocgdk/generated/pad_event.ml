class type pad_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_button : unit -> int
  method as_pad_event : Raw.Pad_event.t
end

(* High-level class for PadEvent *)
class pad_event (obj : Raw.Pad_event.t) : pad_event_t =
  object (self)
    inherit App_launch_context_cycle_de440b34.event (obj :> Raw.Event.t)
    method get_button : unit -> int = fun () -> Raw.Pad_event.get_button obj
    method as_pad_event = obj
  end
