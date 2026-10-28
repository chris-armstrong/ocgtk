class type event_controller_legacy_t = object
  inherit Event_controller.event_controller_t

  (** {2:signals Signals} *)

  method on_event :
    ?after:bool ->
    callback:(event:Ocgdk.Event.event_t -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted for each GDK event delivered to [controller]. *)

  (** {2:conversions Conversions} *)

  method as_event_controller_legacy : Raw.Event_controller_legacy.t
end

(* High-level class for EventControllerLegacy *)
class event_controller_legacy (obj : Raw.Event_controller_legacy.t) :
  event_controller_legacy_t =
  object (self)
    inherit Event_controller.event_controller (obj :> Raw.Event_controller.t)

    method on_event ?(after = false) ~callback () =
      Raw.Event_controller_legacy.on_event ~after
        self#as_event_controller_legacy ~callback:(fun ~event ->
          callback ~event:(new Ocgdk.Event.event event))

    method as_event_controller_legacy = obj
  end

let new_ () : event_controller_legacy_t =
  new event_controller_legacy (Raw.Event_controller_legacy.new_ ())
