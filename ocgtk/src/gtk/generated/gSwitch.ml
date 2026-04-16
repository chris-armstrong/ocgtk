(* Signal class defined in gswitch_signals.ml *)

class type switch_t = object
  inherit
    GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
    .widget_t

  inherit GActionable.actionable_t
  inherit Gswitch_signals.switch_signals
  method get_active : unit -> bool
  method get_state : unit -> bool
  method set_active : bool -> unit
  method set_state : bool -> unit
  method as_switch : Switch.t
end

(* High-level class for Switch *)
class switch (obj : Switch.t) : switch_t =
  object (self)
    inherit
      GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget
      .widget
        (obj
          :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget
             .Widget
             .t)

    inherit GActionable.actionable (Actionable.from_gobject obj)
    inherit Gswitch_signals.switch_signals obj
    method get_active : unit -> bool = fun () -> Switch.get_active obj
    method get_state : unit -> bool = fun () -> Switch.get_state obj

    method set_active : bool -> unit =
      fun is_active -> Switch.set_active obj is_active

    method set_state : bool -> unit = fun state -> Switch.set_state obj state
    method as_switch = obj
  end

let new_ () : switch_t = new switch (Switch.new_ ())
