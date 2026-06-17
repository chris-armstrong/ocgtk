class type switch_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget.widget_t
    inherit GActionable.actionable_t
    method on_activate : ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id
    method on_state_set : ?after:bool -> callback:(state:bool -> bool) -> unit -> Gobject.Signal.handler_id
    method get_active : unit -> bool
    method get_state : unit -> bool
    method set_active : bool -> unit
    method set_state : bool -> unit
    method as_switch : Switch.t
end

class switch : Switch.t -> switch_t

val new_ : unit -> switch_t
