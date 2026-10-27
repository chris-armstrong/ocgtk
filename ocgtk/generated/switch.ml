class type switch_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Actionable.actionable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
  (** Emitted to animate the switch.

      Applications should never connect to this signal, but use the
      [Gtk.Switch:active] property. *)

  method on_state_set :
    ?after:bool ->
    callback:(state:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted to change the underlying state.

      The ::state-set signal is emitted when the user changes the switch
      position. The default handler calls [Gtk.Switch.set_state] with the value
      of [state].

      To implement delayed state change, applications can connect to this
      signal, initiate the change of the underlying state, and call
      [Gtk.Switch.set_state] when the underlying state change is complete. The
      signal handler should return [TRUE] to prevent the default handler from
      running. *)

  method get_active : unit -> bool
  (** Gets whether the [GtkSwitch] is in its “on” or “off” state. *)

  method get_state : unit -> bool
  (** Gets the underlying state of the [GtkSwitch]. *)

  method set_active : bool -> unit
  (** Changes the state of [self] to the desired one. *)

  method set_state : bool -> unit
  (** Sets the underlying state of the [GtkSwitch].

      This function is typically called from a [Gtk.Switch::state-set] signal
      handler in order to set up delayed state changes.

      See [Gtk.Switch::state-set] for details. *)

  method as_switch : Raw.Switch.t
end

(* High-level class for Switch *)
class switch (obj : Raw.Switch.t) : switch_t =
  object (self)
    inherit
      Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
      .widget
        (obj :> Raw.Widget.t)

    inherit Actionable.actionable (Raw.Actionable.from_gobject obj)

    method on_activate ?(after = false) ~callback () =
      Raw.Switch.on_activate ~after self#as_switch ~callback

    method on_state_set ?(after = false) ~callback () =
      Raw.Switch.on_state_set ~after self#as_switch ~callback

    method get_active : unit -> bool = fun () -> Raw.Switch.get_active obj
    method get_state : unit -> bool = fun () -> Raw.Switch.get_state obj

    method set_active : bool -> unit =
      fun is_active -> Raw.Switch.set_active obj is_active

    method set_state : bool -> unit =
      fun state -> Raw.Switch.set_state obj state

    method as_switch = obj
  end

let new_ () : switch_t = new switch (Raw.Switch.new_ ())
