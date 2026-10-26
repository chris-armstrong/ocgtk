class type button_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Actionable.actionable_t

  method on_activate :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method on_clicked :
    ?after:bool -> callback:(unit -> unit) -> unit -> Gobject.Signal.handler_id

  method get_can_shrink : unit -> bool

  method get_child :
    unit ->
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option

  method get_has_frame : unit -> bool
  method get_icon_name : unit -> string option
  method get_label : unit -> string option
  method get_use_underline : unit -> bool
  method set_can_shrink : bool -> unit

  method set_child :
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t
    option ->
    unit

  method set_has_frame : bool -> unit
  method set_icon_name : string -> unit
  method set_label : string -> unit
  method set_use_underline : bool -> unit
  method as_button : Raw.Button.t
end

class button : Raw.Button.t -> button_t

val new_ : unit -> button_t
val new_from_icon_name : string -> button_t
val new_with_label : string -> button_t
val new_with_mnemonic : string -> button_t
