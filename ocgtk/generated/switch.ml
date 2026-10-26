class type switch_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Actionable.actionable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_state_set :
    ?after:bool ->
    callback:(state:bool -> bool) ->
    unit ->
    Gobject.Signal.handler_id

  method get_active : unit -> bool
  method get_state : unit -> bool
  method set_active : bool -> unit
  method set_state : bool -> unit
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
